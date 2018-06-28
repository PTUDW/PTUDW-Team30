var express = require('express');
var cartRepo = require('../repos/cartRepo');
var bookRepo = require('../repos/bookRepo');
var ordersRepo = require('../repos/ordersRepo');

var router = express.Router();

router.get('/', (req, res) => {
    if (req.session.isLogged == false) {
        var vm = {
            layout: 'guess-noleftmenu.handlebars'
        }
        res.render('log/login', vm);
    } else {
        var vm = {
            layout: 'cus-noleftmenu.handlebars'
        }
        res.render('buy/cart', vm);
    }
});

router.get('/cart', (req, res) => {
    var arr_p = [];
    for (var i = 0; i < req.session.cart.length; i++) {
        var cartItem = req.session.cart[i];
        var p = bookRepo.single(cartItem.ProId);
        arr_p.push(p);
    }
    var items = [];
    var totalPrice = new Int16Array();

    Promise.all(arr_p).then(result => {
        for (var i = result.length - 1; i >= 0; i--) {
            var pro = result[i][0];
            var item = {
                Product: pro,
                Quantity: req.session.cart[i].Quantity,
                Amount: pro.Price * req.session.cart[i].Quantity
            };
            items.push(item);
            totalPrice = +totalPrice + (+item.Amount);
        }
        var vm = {
            items: items,
            total: totalPrice,
            layout: 'cus-noleftmenu.handlebars'
        };
        res.render('buy/cart', vm);
    });
});

router.post('/order', (req, res) => {
    if (req.session.cart.length > 0) {
        var arr_p = [];
        var qty = req.body.qty;
        for (var i = req.session.cart.length - 1; i >= 0; i--) {
            req.session.cart[i].Quantity = qty[i];
            var cartItem = req.session.cart[i];
            var p = bookRepo.single(cartItem.ProId);
            arr_p.push(p);
        }
        var items = [];
        var totalPrice = new Int16Array();
        ordersRepo.getMaxID().then(rows => {
            Promise.all(arr_p).then(result => {
                for (var i = result.length - 1; i >= 0; i--) {
                    var pro = result[i][0];
                    var item = {
                        Product: pro,
                        Quantity: req.session.cart[i].Quantity,
                        Amount: pro.Price * req.session.cart[i].Quantity
                    };
                    items.push(item);
                    totalPrice = +totalPrice + (+item.Amount);
                }
                var vm = {
                    items: items,
                    total: totalPrice,
                    orderid: rows[0].idmax + 1,
                    layout: 'cus-noleftmenu.handlebars'
                };
                res.render('buy/order', vm);
            });
        });
    } else {
        var vm = {
            layout: 'cus-noleftmenu.handlebars'
        };
        res.render('buy/cart', vm);
    }
});

router.post('/order-success', (req, res) => {
    for (var i = 0; i < req.session.cart.length; i++) {
        var cartItem = req.session.cart[i];
        var orderdetail = {
            Order_ID: req.body.orderid,
            Book_ID: cartItem.ProId,
            Quantity: cartItem.Quantity
        }
        bookRepo.updateSold(cartItem.ProId, cartItem.Quantity);
        bookRepo.updateSQuantity(cartItem.ProId, cartItem.Quantity);
        ordersRepo.adddetail(orderdetail);
    }
    var order = {
        Order_ID: req.body.orderid,
        Order_Date: req.body.clock,
        Consignee: req.body.fullname,
        Consignee_Phone: req.body.phone,
        Consignee_Address: req.body.address,
        Note: req.body.note,
        Total: req.body.total,
        Order_Status: 0,
        Customer_ID: req.session.idCustomer
    }
    ordersRepo.add(order);

    var vm = {
        Order_ID: req.body.orderid,
        Order_Date: req.body.clock,
        Consignee: req.body.fullname,
        Consignee_Phone: req.body.phone,
        Consignee_Address: req.body.address,
        Note: req.body.note,
        Total: req.body.total,
        Order_Status: 0,
        layout: 'cus-noleftmenu.handlebars'
    }
    req.session.cart = [];
    res.render('buy/order-success', vm);
});

router.get('/order-track/:idCustomer', (req, res) => {
    ordersRepo.loadbyID(req.params.idCustomer).then(rows => {
        var vm = {
            orders: rows,
            layout: 'cus-noleftmenu.handlebars'
        }
        res.render('buy/order-track', vm);
    })
});

router.get('/order-detail/:idCustomer/:idOrder', (req, res) => {
    var t1 = ordersRepo.loadbyIDOrder(req.params.idOrder);
    var t2 = ordersRepo.getInfo(req.params.idOrder);

    Promise.all([t1, t2]).then(([order, orderdetail]) => {
        var vm = {
            orders: order,
            orderdetails: orderdetail,
            layout: 'cus-noleftmenu.handlebars'
        };
        res.render('buy/order-detail-cus', vm);
    });
});

router.post('/add', (req, res) => {
    if (req.session.isLogged == false) {
        var vm = {
            layout: 'guess-noleftmenu.handlebars'
        }
        res.render('log/login', vm);
    } else {
        if (req.body.qty > 1) {
            var item = {
                ProId: req.body.bookid,
                Quantity: req.body.qty
            };
        } else {
            var item = {
                ProId: req.body.bookid,
                Quantity: 1
            };
        }
        cartRepo.add(req.session.cart, item);
        bookRepo.loadAll().then(rows => {
            var vm = {
                books: rows,
                layout: 'cus.handlebars'
            };
            res.render('home', vm);
        });
    }
});

router.post('/remove', (req, res) => {
    cartRepo.remove(req.session.cart, req.body.ProId);
    res.redirect('cart');
});

module.exports = router;