var express = require('express');

var router = express.Router();
var bookRepo = require('../repos/bookRepo');
var kindRepo = require('../repos/kindRepo');
var ordersRepo = require('../repos/ordersRepo');
var issuingHousesRepo = require('../repos/issuingHousesRepo');

router.get('/', (req, res) => {
    bookRepo.loadAllBook().then(rows => {
        //console.log(rows);
        var vm = {
            layout: 'mainAdmin.handlebars',
            book: rows
        };
        res.render('admin/managing-books', vm);
    });
});

router.get('/managing-books', (req, res) => {
    bookRepo.loadAllBook().then(rows => {
        //console.log(rows);
        var vm = {
            layout: 'mainAdmin.handlebars',
            book: rows
        };
        res.render('admin/managing-books', vm);
    });
});



router.post('/managing-books', (req, res) => {
    var book = {
        Book_ID: req.body.book_Id,
        Book_Name: req.body.book_Name,
        Author: req.body.author,
        Publisher: req.body.publisher,
        Publish_Date: req.body.publish_Date,
        Image: req.body.image,
        Price: req.body.price,
        Quantity: req.body.quantity,
        Description: req.body.description,
        Kind_ID: req.body.kind_Id
    }
    bookRepo.add(book);

    var vm = {
        Book_ID: req.body.book_Id,
        Book_Name: req.body.book_Name,
        Author: req.body.author,
        Publisher: req.body.publisher,
        Publish_Date: req.body.publish_Date,
        Image: req.body.image,
        Price: req.body.price,
        Quantity: req.body.quantity,
        Description: req.body.description,
        Kind_ID: req.body.kind_Id,
        layout: 'mainAdmin.handlebars'
    }
    res.render('admin/managing-books', vm);
});

router.get('/managing-kinds', (req, res) => {
    kindRepo.loadAllKind().then(rows => {
        //console.log(rows);
        var vm = {
            layout: 'mainAdmin.handlebars',
            kind: rows
        };
        res.render('admin/managing-kinds', vm);
    });
});


router.post('/managing-kinds', (req, res) => {
    var kind = {
        Kind_Name: req.body.kind_Name,
        Description: req.body.description,
        Category_ID: req.body.category_Id,
    }
    kindRepo.add(kind);

    var vm = {
        Kind_Name: req.body.kind_Name,
        Description: req.body.description,
        Category_ID: req.body.category_Id,
        layout: 'mainAdmin.handlebars'
    }
    res.render('admin/managing-kinds', vm);
});

router.get('/managing-kinds', (req, res) => {
    kindRepo.single(req.query.id).then(k => {
        // console.log(c);
        var vm = {
            Kind: k
        };
        res.render('managing-kinds', vm);
    });
});


router.get('/managing-orders', (req, res) => {
    ordersRepo.loadAllOrder().then(rows => {
        //console.log(rows);
        var vm = {
            layout: 'mainAdmin.handlebars',
            orders: rows
        };
        res.render('admin/managing-orders', vm);
    });
});


router.get('/order-detail/:idOrder', (req, res) => {
    var t1 = ordersRepo.loadbyIDOrder(req.params.idOrder);
    var t2 = ordersRepo.getInfo(req.params.idOrder);

    Promise.all([t1, t2]).then(([order, orderdetail]) => {
        var vm = {
            orders: order,
            orderdetails: orderdetail,
            layout: 'mainAdmin.handlebars'
        };
        res.render('admin/order-detail', vm);
    });
});


router.get('/managing-issuingHouses', (req, res) => {
    issuingHousesRepo.loadAll().then(rows => {
        //console.log(rows);
        var vm = {
            layout: 'mainAdmin.handlebars',
            issuingHouse: rows
        };
        res.render('admin/managing-issuingHouses', vm);
    });

});

module.exports = router;