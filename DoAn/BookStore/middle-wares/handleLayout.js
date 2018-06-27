var categoryRepo = require('../repos/categoryRepo');
var bookRepo = require('../repos/bookRepo');
var kindRepo = require('../repos/kindRepo');

module.exports = (req, res, next) => {

    if (req.session.isLogged === undefined) {
        req.session.isLogged = false;
    }
    if (req.session.isleftMenu === undefined) {
        req.session.isleftMenu = true;
    }

    var t1 = categoryRepo.loadAll();
    var t2 = bookRepo.loadAuthor();
    var t3 = bookRepo.loadPublisher();
    var t4 = kindRepo.loadAll();
    var t5 = kindRepo.load5();

    Promise.all([t1, t2, t3, t4, t5]).then(([category, author, publisher, kind, kind5]) => {
        res.locals.layoutVM = {
            categories: category,
            authors: author,
            publishers: publisher,
            kinds: kind,
            kind5: kind5,
            username: req.session.name,
            idCustomer: req.session.idCustomer
        };
        next();
    });
};