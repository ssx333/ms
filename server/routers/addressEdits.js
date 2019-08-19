// 这个借口是进入编辑地址时进行的请求id
const express = require("express")
const router = express.Router();
const pool = require("../pool.js");
router.get("/", (req, res) => {
	var obj = req.query.l_id;
	var sql = "SELECT * FROM msj_user_address where l_id=?";
	pool.query(sql, [obj], (err, result) => {
		if (err) {
			console.log(err);
			res.send({
				code: 0
			});
		} else {
			res.send(result);
		}
	})

})


module.exports = router;
