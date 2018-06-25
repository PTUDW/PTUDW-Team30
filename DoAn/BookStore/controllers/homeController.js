var express = require('express');
var categoryRepo = require('../repos/categoryRepo');
var bookRepo = require('../repos/bookRepo');
var accountRepo = require('../repos/accountRepo');
var customerRepo = require('../repos/customerRepo');

var config = require('../config/config.js');

var router = express.Router();

router.get('/', (req, res) => {
    if (req.session.isLogged == true) {
        req.session.isLogged == false;
        req.session.destroy();
    }
    bookRepo.loadAll().then(rows => {
        var vm = {
            books: rows
        };
        res.render('home/index', vm);
    });
});

router.get('/home', (req, res) => {
    bookRepo.loadAll().then(rows => {
        var vm = {
            books: rows
        };
        res.render('home/index', vm);
    });
});

router.get('/home-customer', (req, res) => {
    bookRepo.loadAll().then(rows => {
        var vm = {
            books: rows,
            layout: 'cus.handlebars'
        };
        res.render('home/index', vm);
    });
});

router.get('/about', (req, res) => {
    res.render('home/about');
});

router.get('/view-product/:book_id', (req, res) => {
    var bookid = req.params.book_id;
    bookRepo.single(bookid).then(rows => {
        if (req.session.isLogged == true) {
            var vm = {
                product: rows[0],
                layout: 'cus.handlebars'
            }
        } else {
            var vm = {
                book: rows[0],
                layout: 'main.handlebars'
            }
        }
        res.render('home/view-product', vm);
    });
});

router.get('/books-by-category', (req, res) => {
    res.render('home/books-by-category');
});

router.get('/user-info', (req, res) => {
    var t1 = accountRepo.loadAccount(req.session.idAccount);
    var t2 = customerRepo.loadCustomer(req.session.idAccount);

    Promise.all([t1, t2]).then(([account, customer]) => {
        if (customer.length > 0) {
            req.session.idCustomer = customer[0].Customer_ID;
        }
        var vm = {
            accounts: account,
            customers: customer,
            layout: 'cus-noleftmenu.handlebars'
        };
        res.render('home/user-info', vm);
    });
});

router.post('/', (req, res) => {
    var user = {
        username: req.body.username,
        // password: SHA256(req.body.rawPWD).toString()
        password: req.body.rawPWD
    };
    accountRepo.login(user).then(rows => {
        if (rows.length > 0) {
            bookRepo.loadAll().then(rows2 => {
                var vm = {
                    name: req.body.username,
                    books: rows2,
                    layout: 'cus.handlebars'
                };
                req.session.isLogged = true;
                req.session.name = req.body.username;
                req.session.idAccount = rows[0].Account_ID;
                req.session.cart = [];
                res.render('home/index', vm);
            });
        } else {
            var vm = {
                showError: true,
                errorMsg: 'Login failed'
            };
            res.render('log/login', vm);
        }
    });
});

router.post('/user-info', (req, res) => {
    var account = {
        Username: req.body.username,
        Password: req.body.password
    };
    var customer = {
        Account_ID: req.session.idAccount,
        Customer_Name: req.body.fullname,
        Phone: req.body.phone,
        Email: req.body.email,
        //Gender
    };
    var t1 = accountRepo.update(account);
    var t2 = customerRepo.update(customer);

    Promise.all([t1, t2]).then(([account, customer]) => {
        // var vm = {
        //     accounts: account,
        //     customers: customer
        // };
        res.redirect('/home/user-info');
    });
});

module.exports = router;