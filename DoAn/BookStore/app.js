var express = require('express');
var exphbs = require('express-handlebars');
var express_handlebars_sections = require('express-handlebars-sections');
var path = require('path');

var bookRepo = require('./repos/bookRepo');

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
    res.redirect('/home/index');
});

app.get('/home/index', (req, res) => {
    var vm = {
        layout: false
    };
    res.render('home/index', vm);
});

app.get('/admin/managing-books', (req, res) => {
    bookRepo.loadAll().then(rows => {
        console.log(rows);
        var vm = {
            layout: false,
            book: rows
        };
        res.render('admin/managing-books', vm);
    });
});

app.listen(3000, () => {
    console.log('Site running on port 3000');
});