const express = require('express');
const router = express.Router();
//引入数据库连接池
var pool=require('../pool.js');

//全局搜索框
router.get('/search',(req,res)=>{
	var str=req.query.text;
	var arr=str.match(/([鱼]|[肉]|[菜]|[水果]|[鸡])/g);
	if( arr == null || arr == undefined){
		res.send({code:404,msg:'抱歉，没有找到您需要的商品'})
		return 
	}else if(arr.length > 0){
		var dc =  arr[0];
	}
	//console.log(dc);
	//这里用到模糊查询
	var sql=`SELECT * FROM msj_laptop_family_ftb WHERE z_ftitle LIKE '%${dc}%'`;
	pool.query(sql,(err,result)=>{
		if(err){throw err}
		res.send(result); 
	});
});
module.exports = router;