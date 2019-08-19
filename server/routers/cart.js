const express = require("express")
const router = express.Router();
const pool = require("../pool.js");
router.get("/", (req, res) => {
	var x_uid=req.query.id;
	var sql = "SELECT * FROM msj_cart where x_uid";
	pool.query(sql, [x_uid], (err, result) => {
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
