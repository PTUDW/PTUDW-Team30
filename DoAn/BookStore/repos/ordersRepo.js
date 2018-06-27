var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from orders';
    return db.load(sql);
}

exports.loadAllOrder = () => {
    var sql = `select orders.Order_ID,orders.Order_Date, orders.Order_Status,orders.Consignee,orders.Consignee_Phone,orders.Consignee_Address,orders.Note,orders.Total,customer.Customer_Name
                 from orders, customer where orders.Customer_ID = customer.Customer_ID order by orders.Order_ID ASC`;
    return db.load(sql);
}

exports.loadbyID = id => {
    var sql = `select * from orders  where Customer_ID = ${id} ORDER BY Order_ID DESC`
    return db.load(sql);
}

exports.loadbyIDOrder = id => {
    var sql = `select * from orders where Order_ID= ${id}`;
    return db.load(sql);
}

exports.loaddetailbyID = id => {
    var sql = `select * from orderdetail where Order_ID = ${id}`;
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

exports.getInfo = id => {
    var sql = `select book.Book_Name, book.Price, book.Image, orderdetail.Quantity
    from book INNER JOIN orderdetail ON orderdetail.Book_ID = book.Book_ID
    where orderdetail.Order_ID = ${id}`;
    return db.load(sql);
}