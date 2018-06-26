var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from kind';
    return db.load(sql);
}

exports.loadbyCategory = () => {
    var sql = 'select * from category';
    return db.load(sql);
}


exports.add = (k) => {
    var sql = `insert into kind(Kind_Name,Description,Category_ID) values('${k.kind_Name}', '${k.description}', '${k.category_Id}')`;
    return db.save(sql);
}

exports.update = (k) => {
    var sql = `update Kind set Kind_Name = '${k.kind_Name}', Description = '${k.description}', Category_ID = '${k.category_Id}'
    where Kind_ID = '${k.kind_Id}'`;
    return db.save(sql);
}