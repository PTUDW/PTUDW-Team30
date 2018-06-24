var db = require('../fn/db');

exports.loadAll = () => {
	var sql = 'select * from orders';
	return db.load(sql);
}