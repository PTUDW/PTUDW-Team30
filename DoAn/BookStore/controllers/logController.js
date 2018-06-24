var express = require('express');
var accountRepo = require('../repos/accountRepo');

var router = express.Router();

router.get('/login', (req, res) => {
    res.render('log/login');
});

router.get('/register', (req, res) => {
    res.render('log/register');
});

router.post('/register-success', (req, res) => {
    res.render('log/register-success');
});

router.get('/index', (req, res) => {
    res.render('home/index');
});

module.exports = router;