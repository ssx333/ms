const express=require("express")
const router=express.Router();
const pool=require("../pool.js");
router.get("/",(req,res)=>{
    var obj=req.query
if (obj.data_id == "") {
		var sql = "UPDATE msj_user_address SET l_name=?,l_phone=?,l_provinces=?,l_city=?, l_area=?,l_areaCode=?,l_coding=?,l_det_address=?,l_default=? WHERE l_id=?"
		pool.query(sql, [obj.name, obj.tel, obj.province, obj.city, obj.county, obj.areaCode, obj.postalCode, obj.addressDetail,false,obj.id], (err, result) => {
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
				var sql = "UPDATE msj_user_address SET l_name=?,l_phone=?,l_provinces=?,l_city=?, l_area=?,l_areaCode=?,l_coding=?,l_det_address=?,l_default=? WHERE l_id=?"
				// var sql="SELECT * FROM msj_user_address";
				pool.query(sql, [obj.name, obj.tel, obj.province, obj.city, obj.county, obj.areaCode, obj.postalCode, obj.addressDetail,true,obj.id], (err, result) => {
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








module.exports=router;