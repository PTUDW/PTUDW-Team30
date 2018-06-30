var express = require('express');
var exphbs = require('express-handlebars');
var express_handlebars_sections = require('express-handlebars-sections');
var path = require('path');
var bodyParser = require('body-parser');
var wnumb = require('wnumb');


var session = require('express-session');
var MySQLStore = require('express-mysql-session')(session);

var handleLayoutMDW = require('./middle-wares/handleLayout');
var handle404MDW = require('./middle-wares/handle404');

var homeController = require('./controllers/homeController'),
    buyController = require('./controllers/buyController'),
    logController = require('./controllers/logController'),
    adminController = require('./controllers/adminController');

var app = express();


app.engine('hbs', exphbs({
    defaultLayout: 'main',
    layoutsDir: 'views/_layouts/',
    helpers: {
        section: express_handlebars_sections(),
        number_format: n => {
            var nf = wnumb({
                thousand: ','
            });
            return nf.to(n);
        }
    }
}));

app.set('view engine', 'hbs');

app.use(express.static(path.resolve(__dirname, 'public')));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));

//---------- use session -----------

var sessionStore = new MySQLStore({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '',
    database: 'bookstore',
    createDatabaseTable: true,
    schema: {
        tableName: 'sessions',
        columnNames: {
            session_id: 'session_id',
            expires: 'expires',
            data: 'data'
        }
    }
});

app.use(session({
    key: 'session_cookie_name',
    secret: 'session_cookie_secret',
    store: sessionStore,
    resave: false,
    saveUninitialized: false
}));

app.get('/', (req, res) => {
    res.redirect('/home');
});

app.use(handleLayoutMDW);
// app.use(handle404MDW);

app.use('/home', homeController);
app.use('/buy', buyController);
app.use('/log', logController);
app.use('/admin', adminController);


app.listen(3000, () => {
    console.log('Site running on port 3000');
});