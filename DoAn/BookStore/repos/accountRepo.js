var db = require('../fn/db');

exports.add = user => {
    var sql = `insert into account(f_Username, f_Password, f_Name, f_Email, f_DOB, f_Permission) values('${user.username}', '${user.password}', '${user.name}', '${user.email}', '${user.dob}', ${user.permission})`;
    return db.save(sql);
}

exports.login = user => {
    var sql = `select * from account where Username = '${user.username}' and Account_Password = '${user.password}'`;
    return db.load(sql);
}