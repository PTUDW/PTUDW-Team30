var db = require('../fn/db');
var config = require('../config/config');

exports.loadAll = () => {
    var sql = 'select * from book ORDER BY Publish_Date DESC limit 10';
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

exports.loadbyAuthor = (author, offset) => {
    var sql = `select * from book where Author = "${author}" limit ${config.PRODUCTS_PER_PAGE} offset ${offset}`;
    return db.load(sql);
}

exports.countAuthor = author => {
    var sql = `select count(*) as total from book where Author = "${author}"`;
    return db.load(sql);
}

exports.loadbyPublisher = (publisher, offset) => {
    var sql = `select * from book where Publisher = "${publisher}" limit ${config.PRODUCTS_PER_PAGE} offset ${offset}`;
    return db.load(sql);
}

exports.countPublisher = publisher => {
    var sql = `select count(*) as total from book where Publisher = "${publisher}"`;
    return db.load(sql);
}

exports.single = proId => {
    var sql = `select * from book where Book_ID = ${proId}`;
    return db.load(sql);
}

exports.add = (b) => {
    var sql = `insert into book(Book_Name,Author,Publisher,Publish_Date,Image,Price,Quantity,View_Number,Description,Kind_ID)
    		 values('${b.Book_Name}', '${b.Author}', '${b.Publisher}', '${b.Publish_Date}', '${b.Image}', '${b.Price}', '${b.Quantity}','${b.View_Number}', '${b.Description}', '${b.Kind_ID}')`;
    return db.save(sql);
}

exports.update = (b) => {
    var sql = `update book set Book_Name = '${b.book_Name}', Author = '${b.author}', Publisher = ${b.publisher}', Publish_Date = '${b.publish_Date}', Image = '${b.image}', Price = '${b.price}', Quantity = '${b.quantity}', Description = '${b.description}', Kind_ID = '${b.kind_Id}'
    where Book_ID = '${b.book_Id}'`;
    return db.save(sql);
}

exports.getKindById = id => {
    var sql = `select kind.Kind_ID kind.Kind_Name from kind, book where book.Kind_ID = ${id} and kind.Kind_ID = book.Kind_ID`;
    return db.load(sql);
}

exports.bestView = () => {
    var sql = `SELECT * FROM book ORDER BY View_Number DESC LIMIT 10`;
    return db.load(sql);
}

exports.bestSell = () => {
    var sql = `SELECT * FROM book ORDER BY Sold DESC LIMIT 10`;
    return db.load(sql);
}

exports.sameKind = (id, offset) => {
    var sql = `select * from book where Kind_ID = (select Kind_ID from kind where Kind_Name = "${id}") limit ${config.PRODUCTS_PER_PAGE} offset ${offset}`;
    return db.load(sql);
}

exports.countKind = id => {
    var sql = `select count(*) as total from book where Kind_ID = (select Kind_ID from kind where Kind_Name = "${id}")`;
    return db.load(sql);
}

exports.samePublisher = name => {
    var sql = `select * from book where Publisher = "${name}"`;
    return db.load(sql);
}

exports.getbyKind = id => {
    var sql = `select * from book where Kind_ID = ${id}`;
    return db.load(sql);
}

exports.updateView = (id, view) => {
    var sql = `update book set View_Number = '${view}'
    where Book_ID = '${id}'`;
    return db.save(sql);
}

exports.loadAllBook = () => {
    var sql = `select book.Book_ID,book.Book_Name,book.Author,book.Publisher,book.Publish_Date,book.Image,book.Price,Book.Quantity,book.View_Number,book.Description,kind.Kind_Name
            from book, kind where book.Kind_ID = kind.Kind_ID ORDER BY book.Book_ID ASC`;
    return db.load(sql);
}

exports.delete = (id) => {
    var sql = `delete from Book where Book_ID = ${id}`;
    return db.save(sql);
}

exports.searchBooks = (kind, pricemin, pricemax, publisher, author) => {
    var sql = `SELECT * from book where book.Book_Name LIKE "%${kind}%" AND (Price BETWEEN ${pricemin} AND ${pricemax}) AND book.Publisher LIKE "%${publisher}%" AND book.Author LIKE "%${author}%"`;
    return db.load(sql);
}


exports.updateSold = (id, qty) => {
    var sql = `update book set Sold = (Sold + ${qty})
    where Book_ID = '${id}'`;
    return db.save(sql);
}

exports.updateSQuantity = (id, qty) => {
    var sql = `update book set Quantity = (Quantity - ${qty})
    where Book_ID = '${id}'`;
    return db.save(sql);
}

exports.search = name => {
    var sql = `select * from book where Book_Name LIKE "%${name}%"`;
    return db.load(sql);
}

exports.getByName = name => {
    var sql = `select * from kind where Kind_Name = "${name}"`;
    return db.load(sql);
}