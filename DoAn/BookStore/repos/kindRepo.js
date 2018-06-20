var db = require('../fn/db');


exports.loadAll = () => {
	var sql = 'select * from kind';
	return db.load(sql);
}