var express = require('express');

var router = express.Router();

router.get('/', (req, res) => {
    res.render('admin/index-admin');
});


router.get('/managing-books', (req, res) => {
    res.render('admin/managing-books');
});

router.get('/managing-kinds', (req, res) => {
    res.render('admin/managing-kinds');
});

router.get('/managing-orders', (req, res) => {
    res.render('admin/managing-orders');
});

router.get('/order-detail', (req, res) => {
    res.render('admin/order-detail');
});

router.get('/managing-issuingHouses', (req, res) => {
    res.render('admin/managing-issuingHouses');
});

module.exports = router;