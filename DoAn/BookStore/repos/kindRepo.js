var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from kind';
    return db.load(sql);
}

exports.loadbyCategory = () => {
    var sql = 'select * from category';
    return db.load(sql);
}