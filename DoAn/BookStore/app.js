var express = require('express');
var exphbs = require('express-handlebars');
var express_handlebars_sections = require('express-handlebars-sections');
var path = require('path');

var bookRepo = require('./repos/bookRepo');

var homeController = require('./controllers/homeController');
buyController = require('./controllers/buyController');
logController = require('./controllers/logController');
adminController = require('./controllers/adminController');

var app = express();

app.engine('hbs', exphbs({
    defaultLayout: 'main',
    layoutsDir: 'views/_layouts/',
    helpers: {
        section: express_handlebars_sections()
    }
}));
app.set('view engine', 'hbs');

app.use(express.static(path.resolve(__dirname, 'public')));

app.get('/', (req, res) => {
    res.redirect('/home');
});


app.use('/home', homeController);
app.use('/buy', buyController);
app.use('/log', logController);
app.use('/admin', adminController);

app.listen(3000, () => {
    console.log('Site running on port 3000');
});