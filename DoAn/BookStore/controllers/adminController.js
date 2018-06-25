var express = require('express');

var router = express.Router();
var bookRepo = require('../repos/bookRepo');
var kindRepo = require('../repos/kindRepo');
var ordersRepo = require('../repos/ordersRepo');
var issuingHousesRepo = require('../repos/issuingHousesRepo');

router.get('/', (req, res) => {
    bookRepo.loadAll().then(rows => {
        console.log(rows);
        var vm = {
        	layout:'mainAdmin.handlebars',
            book: rows
        };
        res.render('admin/managing-books', vm);
    });
});

router.get('/managing-books', (req, res) => {
	bookRepo.loadAll().then(rows => {
        console.log(rows);
        var vm = {
        	layout:'mainAdmin.handlebars',
            book: rows
        };
        res.render('admin/managing-books', vm);
    });
});

router.get('/managing-kinds', (req, res) => {
	kindRepo.loadAll().then(rows => {
        console.log(rows);
        var vm = {
        	layout:'mainAdmin.handlebars',
            kind: rows
        };
        res.render('admin/managing-kinds', vm);
    });
});

router.get('/managing-orders', (req, res) => {
	ordersRepo.loadAll().then(rows => {
        console.log(rows);
        var vm = {
        	layout:'mainAdmin.handlebars',
            orders: rows
        };
        res.render('admin/managing-orders', vm);
    });
});

router.get('/order-detail', (req, res) => {
    res.render('admin/order-detail');
});

router.get('/managing-issuingHouses', (req, res) => {
    issuingHousesRepo.loadAll().then(rows => {
        console.log(rows);
        var vm = {
        	layout:'mainAdmin.handlebars',
            issuingHouse: rows
        };
        res.render('admin/managing-issuingHouses', vm);
    });
});

module.exports = router;