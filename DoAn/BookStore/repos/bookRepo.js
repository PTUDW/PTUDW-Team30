var db = require('../fn/db');

exports.loadAll = () => {
	var sql = 'select * from book';
	return db.load(sql);
}