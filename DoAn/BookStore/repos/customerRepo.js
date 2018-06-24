var db = require('../fn/db');

exports.loadCustomer = AccountID => {
    var sql = `select * from customer where Account_ID = '${AccountID}'`;
    return db.load(sql);
}

exports.update = (cus) => {
    var sql = `update customer set Customer_Name = '${cus.Customer_Name}', Phone = '${cus.Phone}', Email = '${cus.Email}'
    where Account_ID = '${cus.Account_ID}'`;
    return db.save(sql);
}

exports.add = (cus) => {
    var sql = `insert into customer(Customer_Name,Phone,Email,Gender,Account_ID) values('${cus.Customer_Name}', '${cus.Phone}', '${cus.Email}','1','${cus.Account_ID}')`;
    return db.save(sql);
}