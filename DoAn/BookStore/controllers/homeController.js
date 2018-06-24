var express = require('express');
var categoryRepo = require('../repos/categoryRepo');
var bookRepo = require('../repos/bookRepo');
var accountRepo = require('../repos/accountRepo');

var config = require('../config/config.js');

var router = express.Router();

// router.get('/', (req, res) => {
//     categoryRepo.loadAll().then(rows => {
//         var vm = {
//             categories: rows
//         };
//         res.render('home/index', vm);
//     });
// });

router.get('/', (req, res) => {
    var t1 = categoryRepo.loadAll();
    var t2 = bookRepo.loadAuthor();
    var t3 = bookRepo.loadPublisher();

    Promise.all([t1, t2, t3]).then(([category, author, publisher]) => {
        var vm = {
            categories: category,
            authors: author,
            publishers: publisher
        };
        res.render('home/index', vm);
    });
});

router.get('/home', (req, res) => {
    res.render('home/index');
});

router.get('/home-customer', (req, res) => {
    res.render('home/index-customer');
});

router.get('/about', (req, res) => {
    res.render('home/about');
});

router.get('/view-product', (req, res) => {
    res.render('home/view-product');
});

router.get('/books-by-category', (req, res) => {
    res.render('home/books-by-category');
});

router.get('/user-info', (req, res) => {
    res.render('home/user-info');
});

router.post('/', (req, res) => {
    var user = {
        username: req.body.username,
        // password: SHA256(req.body.rawPWD).toString()
        password: req.body.rawPWD
    };
    accountRepo.login(user).then(rows => {
        if (rows.length > 0) {
            var vm = {
                name: req.body.username
            };
            req.session.isLogged = true;
            req.session.name = req.body.username;
            res.render('home/index-customer', vm);
        } else {
            var vm = {
                showError: true,
                errorMsg: 'Login failed'
            };
            res.render('log/login', vm);
        }
    });
});

module.exports = router;