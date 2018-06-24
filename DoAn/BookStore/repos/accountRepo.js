var db = require('../fn/db');

exports.add = acc => {
    var sql = `insert into account(Username, Account_Password,Account_Type,Account_Status) values('${acc.Username}', '${acc.Password}', '2', '2')`;
    return db.save(sql);
}

exports.login = user => {
    var sql = `select * from account where Username = '${user.username}' and Account_Password = '${user.password}'`;
    return db.load(sql);
}

//Load user by id

exports.loadAccount = id => {
    var sql = `select * from account where Account_ID = '${id}'`;
    return db.load(sql);
}

exports.update = (acc) => {
    var sql = `update account set Account_Password = '${acc.Password}' where UserName = '${acc.Username}'`;
    return db.save(sql);
}


exports.getMaxID = () => {
    var sql = `select MAX(Account_ID) AS idmax from account`;
    return db.load(sql);
}

// exports.add = (c) => {
//     var sql = `insert into categories(catname) values('${c.CatName}')`;
//     return db.save(sql);
// }

// exports.delete = (id) => {
//     var sql = `delete from categories where CatId = ${id}`;
//     return db.save(sql);
// }