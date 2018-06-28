var express = require('express');

var router = express.Router();
var bookRepo = require('../repos/bookRepo');
var kindRepo = require('../repos/kindRepo');
var ordersRepo = require('../repos/ordersRepo');
var categoryRepo = require('../repos/categoryRepo');
var issuingHousesRepo = require('../repos/issuingHousesRepo');

router.get('/', (req, res) => {
    var t1 = bookRepo.loadAllBook();
    var t2 = kindRepo.loadAll();
    Promise.all([t1, t2]).then(([b, k]) => {
        var vm = {
            layout: 'mainAdmin.handlebars',
            book: b,
            kind: k
        };
        res.render('admin/managing-books', vm);
    });
});

router.get('/admin', (req, res) => {
    var t1 = bookRepo.loadAllBook();
    var t2 = kindRepo.loadAll();
    Promise.all([t1, t2]).then(([b, k]) => {
        var vm = {
            layout: 'mainAdmin.handlebars',
            book: b,
            kind: k
        };
        res.render('admin/managing-books', vm);
    });
});

router.get('/managing-books', (req, res) => {
    var t1 = bookRepo.loadAllBook();
    var t2 = kindRepo.loadAll();
    Promise.all([t1, t2]).then(([b, k]) => {
        var vm = {
            layout: 'mainAdmin.handlebars',
            book: b,
            kind: k
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

router.get('/deleteBook/:id', (req, res) => {
    bookRepo.delete(req.params.id).then(value => {
            console.log("deleted");
            res.redirect('/admin/managing-books');
        })
        .catch(err => {
            console.error(err);
        });
});



router.get('/managing-kinds', (req, res) => {
    var t1 = kindRepo.loadAllKind();
    var t2 = categoryRepo.loadAll();
    Promise.all([t1, t2]).then(([k, c]) => {
        var vm = {
            kind: k,
            category: c,
            layout: 'mainAdmin.handlebars'
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

router.get('/deleteKind/:id', (req, res) => {
    kindRepo.delete(req.params.id).then(value => {
            console.log("deleted");
            res.redirect('/admin/managing-kinds');
        })
        .catch(err => {
            console.error(err);
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
    var t1 = ordersRepo.loadInfobyOrderID(req.params.idOrder);
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

router.get('/addIssuingHouse', (req, res) => {
    var vm = {
        showAlert: false
    };
    res.render('admin/managing-issuingHouses', vm);
});

router.post('/addIssuingHouse', (req, res) => {
    var issuingHouse = {
        IssuingHouse_Name: req.body.issuingHouse_Name,
        Contact: req.body.contact,
        Address: req.body.address
    }
    issuingHousesRepo.add(issuingHouse);

    var vm = {
        IssuingHouse_Name: req.body.issuingHouse_Name,
        Contact: req.body.contact,
        Address: req.body.address,
        layout: 'mainAdmin.handlebars'
    }
    res.render('admin/managing-issuingHouses', vm);
});

router.get('/deleteIssuingHouse/:id', (req, res) => {
    issuingHousesRepo.delete(req.params.id).then(value => {
            res.redirect('/admin/managing-issuingHouses');
        })
        .catch(err => {
            console.error(err);
        });
});

router.post('/managing-orders', (req, res) => {
    var status = req.body.status;
    var idOrder = req.body.order_Id;

    ordersRepo.updateStatus(idOrder, status);

    ordersRepo.loadAllOrder().then(rows => {
        var vm = {
            layout: 'mainAdmin.handlebars',
            orders: rows
        };
        res.render('admin/managing-orders', vm);
    });
});

module.exports = router;