var db = require('../fn/db');

exports.loadAll = () => {
    var sql = `select * from kind`;
    return db.load(sql);
}

exports.loadAllKind = () => {
    var sql = `select kind.Kind_ID,kind.Kind_Name,kind.Description,category.Category_Name from kind, category
                where kind.Category_ID = category.Category_ID ORDER BY kind.Kind_ID ASC`;
    return db.load(sql);
}

exports.load5 = () => {
    var sql = `select DISTINCT Kind_Name from kind limit 5`;
    return db.load(sql);
}

// exports.loadbyCategory = () => {
//     var sql = 'select * from category';
//     return db.load(sql);
// }

exports.single = id => {
    var sql = `select * from kind where Kind_ID = ${id}`;
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

exports.singleId = (id) => {
    return new Promise((resolve, reject) => {
        var sql = `select * from kind where Kind_ID = ${id}`;
        db.load(sql).then(rows => {
            if (rows.length === 0) {
                resolve(null);
            } else {
                resolve(rows[0]);
            }
        }).catch(err => {
            reject(err);
        });
    });
}

exports.delete = (id) => {
    var sql = `delete from Kind where Kind_ID = ${id}`;
    return db.save(sql);
}