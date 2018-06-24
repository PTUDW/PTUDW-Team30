var express = require('express');
var accountRepo = require('../repos/accountRepo');
var customerRepo = require('../repos/customerRepo');

var router = express.Router();

router.get('/login', (req, res) => {
    var vm = {
        layout: 'guess-noleftmenu.handlebars'
    };
    res.render('log/login', vm);
});

router.get('/register', (req, res) => {
    var vm = {
        layout: 'guess-noleftmenu.handlebars'
    };
    res.render('log/register', vm);
});

router.post('/register-success', (req, res) => {
    var account = {
        Username: req.body.username,
        Password: req.body.password
    };

    accountRepo.getMaxID().then(rows => {
        var customer = {
            Customer_Name: req.body.fullname,
            Phone: req.body.phone,
            Email: req.body.email,
            Gender: 1,
            Account_ID: rows[0].idmax + 1
        };
        accountRepo.add(account);
        customerRepo.add(customer);
        req.session.idAccount = customer.Account_ID;
    });
    var vm = {
        layout: 'cus-noleftmenu.handlebars'
    };
    res.render('log/register-success', vm);
});

router.get('/index', (req, res) => {
    res.render('home/index');
});

module.exports = router;