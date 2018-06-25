var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from orders';
    return db.load(sql);
}

exports.getMaxID = () => {
    var sql = `select MAX(Order_ID) AS idmax from orders`;
    return db.load(sql);
}

exports.adddetail = order => {
    var sql = `insert into orderdetail(Order_ID,Book_ID,Quantity) values('${order.Order_ID}', '${order.Book_ID}', '${order.Quantity}')`;
    return db.save(sql);
}

exports.add = order => {
    var sql = `insert into orders(Order_ID,Order_Date,Consignee,Consignee_Phone,Consignee_Address,Note,Total,Order_Status,Customer_ID)
	values('${order.Order_ID}', '${order.Order_Date}', '${order.Consignee}', '${order.Consignee_Phone}', '${order.Consignee_Address}', '${order.Note}', '${order.Total}'
	, '${order.Order_Status}', '${order.Customer_ID}')`;
    return db.save(sql);
}