const express = require("express")
const router = express.Router();
const pool = require("../pool.js");
router.get("/", (req, res) => {
	var obj = req.query
	// 对接收到的数据进行判断
	// 如果接收的值的是选择的默认地址就修改所有的其他的默认地址为false
	if (obj.id == "") {
		var sql = "INSERT INTO msj_user_address VALUES(NULL,?,?,?,?,?,?,?,?,?)"
		pool.query(sql, [obj.name, obj.tel, obj.province, obj.city, obj.county, obj.areaCode, obj.postalCode, obj.addressDetail,
			false
		], (err, result) => {
			if (err) {
				console.log(err)
			} else {
				res.send({
					code: 1
				})
			}
		})
	} else {
		// 判断传过来的id是不是为空的,不为空就是默认值
		// 需要修改其他是默认值的
		var str = "UPDATE msj_user_address SET l_default = false WHERE l_default = true;"
		pool.query(str, [], (err, result) => {
			if (err) {
				console.log(err)
			} else {
				var sql = "INSERT INTO msj_user_address VALUES(NULL,?,?,?,?,?,?,?,?,?)"
				// var sql="SELECT * FROM msj_user_address";
				pool.query(sql, [obj.name, obj.tel, obj.province, obj.city, obj.county, obj.areaCode, obj.postalCode, obj.addressDetail,
					true
				], (err, result) => {
					if (err) {
						console.log(err)
					} else {
						res.send({
							code: 1
						})
					}
				})

			}
		})

	}
})
module.exports = router;
