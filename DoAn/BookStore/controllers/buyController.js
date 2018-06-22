var express = require('express');

var router = express.Router();

router.get('/', (req, res) => {
    res.render('buy/cart');
});

router.get('/cart', (req, res) => {
    res.render('buy/cart');
});

router.get('/order', (req, res) => {
    res.render('buy/order');
});

router.post('/order-success', (req, res) => {
    res.render('buy/order-success');
});

router.get('/order-track', (req, res) => {
    res.render('buy/order-track');
});

router.get('/order-detail', (req, res) => {
    res.render('buy/order-detail-cus');
});

module.exports = router;