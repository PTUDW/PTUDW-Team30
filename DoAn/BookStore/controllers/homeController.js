var express = require('express'),
    SHA256 = require('crypto-js/sha256');
var categoryRepo = require('../repos/categoryRepo');
var bookRepo = require('../repos/bookRepo');
var accountRepo = require('../repos/accountRepo');
var customerRepo = require('../repos/customerRepo');
var kindRepo = require('../repos/kindRepo');

var config = require('../config/config.js');

var router = express.Router();

router.get('/', (req, res) => {
    if (req.session.isLogged == true) {
        req.session.isLogged == false;
        req.session.destroy();
    }
    var t1 = bookRepo.loadAll();
    var t2 = bookRepo.bestView();
    var t3 = bookRepo.bestSell();
    Promise.all([t1, t2, t3]).then(([book, bestview, bestsell]) => {
        var vm = {
            books: book,
            bestviews: bestview,
            bestsells: bestsell
        }
        res.render('home/index', vm);
    });
});

router.get('/home', (req, res) => {
    var t1 = bookRepo.loadAll();
    var t2 = bookRepo.bestView();
    var t3 = bookRepo.bestSell();
    Promise.all([t1, t2, t3]).then(([book, bestview, bestsell]) => {
        var vm = {
            books: book,
            bestviews: bestview,
            bestsells: bestsell
        }
        res.render('home/index', vm);
    });
});

router.get('/home-customer', (req, res) => {
    var t1 = bookRepo.loadAll();
    var t2 = bookRepo.bestView();
    var t3 = bookRepo.bestSell();
    Promise.all([t1, t2, t3]).then(([book, bestview, bestsell]) => {
        var vm = {
            books: book,
            bestviews: bestview,
            bestsells: bestsell,
            layout: 'cus.handlebars'
        }
        res.render('home/index', vm);
    });
});

router.get('/about', (req, res) => {
    res.render('home/about');
});

router.get('/view-product/:book_id', (req, res) => {
    var bookid = req.params.book_id;
    bookRepo.single(bookid).then(rows => {
        bookRepo.updateView(bookid, +rows[0].View_Number + 1);
        var t1 = bookRepo.getbyKind(rows[0].Kind_ID);
        var t2 = bookRepo.samePublisher(rows[0].Publisher);
        Promise.all([t1, t2]).then(([bkind, bpublisher]) => {
            if (req.session.isLogged == true) {
                var vm = {
                    book: rows[0],
                    bkinds: bkind,
                    bpublishers: bpublisher,
                    layout: 'cus.handlebars'
                }
            } else {
                var vm = {
                    book: rows[0],
                    bkinds: bkind,
                    bpublishers: bpublisher,
                    layout: 'main.handlebars'
                }
            }
            res.render('home/view-product', vm);
        });
    });
});

router.post('/books-by-search', (req, res) => {
    var kind, pricemin, pricemax, publisher, author;
    if (req.body.searchPrice.length > 3) {
        pricemin = req.body.searchPrice.substring(1, 3);
        pricemax = req.body.searchPrice.substring(7, 9);
        if (pricemin == 00)
            pricemin = +0;
    } else {
        pricemin = 0;
        pricemax = 99999;
    }
    if (req.body.searchKind === "All") {
        kind = "";
    } else kind = req.body.searchKind;
    if (req.body.searchPublisher === "All") {
        publisher = "";
    } else publisher = req.body.searchpublisher;
    if (req.body.searchAuthor === "All") {
        author = "";
    } else author = req.body.searchAuthor;
    bookRepo.searchBooks(kind, pricemin, pricemax, publisher, author).then(rows => {
        if (req.session.isLogged == true) {
            var vm = {
                books: rows,
                layout: 'cus.handlebars'
            }
        } else {
            var vm = {
                books: rows,
                layout: 'main.handlebars'
            }
        }
        res.render('home/books-by-search', vm);
    });
});

router.post('/books-by-name', (req, res) => {
    var name = req.body.name;
    bookRepo.search(name).then(rows => {
        if (req.session.isLogged == true) {
            var vm = {
                books: rows,
                layout: 'cus.handlebars'
            }
        } else {
            var vm = {
                books: rows,
                layout: 'main.handlebars'
            }
        }
        res.render('home/books-by-name', vm);
    });
});

router.get('/books-by-category/:kind_name', (req, res) => {

    var page = req.query.page;
    if (!page) {
        page = 1;
    }
    if (page <= 1)
        var pageb = 1;
    else var pageb = page - 1;

    var pagea = +page + 1;
    var offset = (page - 1) * config.PRODUCTS_PER_PAGE;

    var kindname = req.params.kind_name;

    var p1 = bookRepo.sameKind(kindname, offset);
    var p2 = bookRepo.countKind(kindname);
    Promise.all([p1, p2]).then(([rows, countRows]) => {
        var total = countRows[0].total;
        var nPages = total / config.PRODUCTS_PER_PAGE;
        if (total % config.PRODUCTS_PER_PAGE > 0) {
            nPages++;
        }
        if (page === total)
            pagea = total;
        var numbers = [];
        for (i = 1; i <= nPages; i++) {
            numbers.push({
                value: i,
                isCurPage: i === +page
            });
        }
        if (req.session.isLogged == false) {
            var vm = {
                books: rows,
                page_numbers: numbers,
                pageb: pageb,
                pagea: pagea,
                layout: 'main.handlebars'
            }
            res.render('home/books-by-category', vm);
        } else {
            var vm = {
                books: rows,
                page_numbers: numbers,
                pageb: pageb,
                pagea: pagea,
                layout: 'cus.handlebars'
            }
            res.render('home/books-by-category', vm);
        }
    });
});

router.get('/books-by-author/:author', (req, res) => {
    var author = req.params.author;
    var page = req.query.page;
    if (!page) {
        page = 1;
    }
    if (page <= 1)
        var pageb = 1;
    else var pageb = page - 1;
    var pagea = +page + 1;
    var offset = (page - 1) * config.PRODUCTS_PER_PAGE;

    var p1 = bookRepo.loadbyAuthor(author, offset);
    var p2 = bookRepo.countAuthor(author);
    Promise.all([p1, p2]).then(([rows, countRows]) => {
        var total = countRows[0].total;
        var nPages = total / config.PRODUCTS_PER_PAGE;
        if (total % config.PRODUCTS_PER_PAGE > 0) {
            nPages++;
        }
        if (page === total)
            pagea = total;
        var numbers = [];
        for (i = 1; i <= nPages; i++) {
            numbers.push({
                value: i,
                isCurPage: i === +page
            });
        }
        if (req.session.isLogged == false) {
            var vm = {
                books: rows,
                page_numbers: numbers,
                pageb: pageb,
                pagea: pagea,
                layout: 'main.handlebars'
            }
            res.render('home/books-by-author', vm);
        } else {
            var vm = {
                books: rows,
                page_numbers: numbers,
                pageb: pageb,
                pagea: pagea,
                layout: 'cus.handlebars'
            }
            res.render('home/books-by-author', vm);
        }
    });
});

router.get('/books-by-publisher/:publisher', (req, res) => {
    var publisher = req.params.publisher;
    var page = req.query.page;
    if (!page) {
        page = 1;
    }
    if (page <= 1)
        var pageb = 1;
    else var pageb = page - 1;
    var pagea = +page + 1;
    var offset = (page - 1) * config.PRODUCTS_PER_PAGE;

    var p1 = bookRepo.loadbyPublisher(publisher, offset);
    var p2 = bookRepo.countPublisher(publisher);
    Promise.all([p1, p2]).then(([rows, countRows]) => {
        var total = countRows[0].total;
        var nPages = total / config.PRODUCTS_PER_PAGE;
        if (total % config.PRODUCTS_PER_PAGE > 0) {
            nPages++;
        }
        if (page === total)
            pagea = total;
        var numbers = [];
        for (i = 1; i <= nPages; i++) {
            numbers.push({
                value: i,
                isCurPage: i === +page
            });
        }
        if (req.session.isLogged == false) {
            var vm = {
                books: rows,
                page_numbers: numbers,
                pageb: pageb,
                pagea: pagea,
                layout: 'main.handlebars'
            }
            res.render('home/books-by-publisher', vm);
        } else {
            var vm = {
                books: rows,
                page_numbers: numbers,
                pageb: pageb,
                pagea: pagea,
                layout: 'cus.handlebars'
            }
            res.render('home/books-by-publisher', vm);
        }
    });
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
            layout: 'cus-noleftmenu.handlebars',
        };
        res.render('home/user-info', vm);
    });
});

router.post('/', (req, res) => {
    var user = {
        username: req.body.username,
        password: SHA256(req.body.rawPWD).toString()
    };
    accountRepo.login(user).then(rows => {
        if (rows.length > 0) {
            if (rows[0].Account_Type === 1) {
                var vm = {
                    layout: 'mainAdmin.handlebars'
                }
                res.render('admin/managing-books', vm);
            } else {
                var t1 = bookRepo.loadAll();
                var t2 = bookRepo.bestView();
                var t3 = bookRepo.bestSell();
                Promise.all([t1, t2, t3]).then(([book, bestview, bestsell]) => {
                    var vm = {
                        name: req.body.username,
                        books: book,
                        bestviews: bestview,
                        bestsells: bestsell,
                        layout: 'cus.handlebars'
                    }
                    req.session.isLogged = true;
                    req.session.name = req.body.username;
                    req.session.idAccount = rows[0].Account_ID;
                    req.session.cart = [];
                    res.render('home/index', vm);
                });
            }
        } else {
            var vm = {
                showError: true,
                errorMsg: 'Login failed',
                layout: 'guess-noleftmenu.handlebars'
            };
            res.render('log/login', vm);
        }
    });
});

router.post('/user-info', (req, res) => {
    var account = {
        Username: req.body.username,
        Password: SHA256(req.body.password).toString()
    };
    var customer = {
        Account_ID: req.session.idAccount,
        Customer_Name: req.body.fullname,
        Phone: req.body.phone,
        Email: req.body.email,
        //Gender
    };
    accountRepo.update(account);
    customerRepo.update(customer);
    res.redirect('user-info');
});

module.exports = router;