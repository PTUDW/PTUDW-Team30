var db = require('../fn/db');

exports.loadAll = () => {
	var sql = 'select * from issuingHouse';
	return db.load(sql);
}