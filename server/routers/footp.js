//创建商品列表路由器
const express=require('express');
const router=express.Router();
//引入数据库连接池
const pool=require('../pool.js');
 //默认事件  下拉列表
router.get("/foot",(req,res)=>{
	var c_uid=req.query.c_uid;
  var sql11='SELECT * FROM msj_xiangqing where c_uid=?';
  pool.query(sql11,[c_uid],(err,result)=>{
    if(err){
      console.log(err)
    }else{
      res.send(result);
    }
  })
});
router.get("/footpl",(req,res)=>{
  var sql11='SELECT * FROM msj_c_pinglun';
  pool.query(sql11,[],(err,result)=>{
    if(err){
      console.log(err)
    }else{
      res.send(result);
    }
  })
});
//导出路由器
module.exports=router;