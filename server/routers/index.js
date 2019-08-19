//创建商品列表路由器
const express=require('express');
var router=express.Router();
//引入数据库连接池
var pool=require('../pool.js');
//首页加载数据功能
router.get('/index',function(req,res){
  var obj=req.query;
  var start=obj.start;
  var count=obj.count;
  var sql=`SELECT * FROM msj_laptop_family_ftb WHERE z_type=${obj.type} LIMIT ${start},${count}`;
  pool.query(sql,function(err,result){
    if(err){throw err};
    res.send(result);
  });
});
//搜索框
// router.get('/search',function(req,res){
// 	var obj = req.query;
	
// });
//搜索分类
router.get('/nav',(req,res)=>{
	var sql= 'SELECT * FROM msj_family';
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.send(result);
	})
})
//导出路由器
module.exports=router;