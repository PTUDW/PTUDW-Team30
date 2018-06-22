var express = require('express');

var router = express.Router();

router.get('/', (req, res) => {
    res.render('home/index');
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

module.exports = router;