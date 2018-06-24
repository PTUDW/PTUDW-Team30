var express = require('express');

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
    var vm = {
        layout: 'cus-noleftmenu.handlebars'
    }
    res.render('buy/cart', vm);
});

router.get('/order', (req, res) => {
    var vm = {
        layout: 'cus-noleftmenu.handlebars'
    }
    res.render('buy/order', vm);
});

router.post('/order-success', (req, res) => {
    var vm = {
        layout: 'cus-noleftmenu.handlebars'
    }
    res.render('buy/order-success', vm);
});

router.get('/order-track', (req, res) => {
    var vm = {
        layout: 'cus-noleftmenu.handlebars'
    }
    res.render('buy/order-track', vm);
});

router.get('/order-detail', (req, res) => {
    var vm = {
        layout: 'cus-noleftmenu.handlebars'
    }
    res.render('buy/order-detail-cus', vm);
});

module.exports = router;