var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from issuingHouse';
    return db.load(sql);
}

exports.add = (ih) => {
    var sql = `insert into issuinghouse(IssuingHouse_Name,Contact,Address) 
    			values('${ih.IssuingHouse_Name}', '${ih.Contact}', '${ih.Address}')`;
    return db.save(sql);
}

exports.update = (ih) => {
    var sql = `update issuinghouse set IssuingHouse_Name = '${ih.issuingHouse_Name}', Contact = '${ih.contact}', Address = '${ih.address}'
    where IssuingHouse_ID = '${k.issuingHouse_Id}'`;
    return db.save(sql);
}

exports.delete = (id) => {
    var sql = `delete from IssuingHouse where IssuingHouse_ID = ${id}`;
    return db.save(sql);
}

exports.single = Id => {
    var sql = `select * from IssuingHouse where IssuingHouse_ID = ${id}`;
    return db.load(sql);
}

exports.search = name => {
    var sql = `select * from IssuingHouse where IssuingHouse_Name LIKE "%${name}%"`;
    return db.load(sql);
}