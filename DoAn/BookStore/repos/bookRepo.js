var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from book';
    return db.load(sql);
}

exports.loadAuthor = () => {
    var sql = 'select DISTINCT Author from book limit 5';
    return db.load(sql);
}

exports.loadPublisher = () => {
    var sql = 'select DISTINCT Publisher from book limit 5';
    return db.load(sql);
}

exports.single = proId => {
    var sql = `select * from book where Book_ID = ${proId}`;
    return db.load(sql);
}