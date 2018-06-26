var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from category';
    return db.load(sql);
}

exports.loadbyID = id => {
    var sql = `select * from category where Category_ID= ${id}`;
    return db.load(sql);
}