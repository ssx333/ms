//创建商品列表路由器
const express=require('express');
const router=express.Router();
//引入数据库连接池
const pool=require('../pool.js');
 //默认事件  下拉列表
router.get("/sata",(req,res)=>{
  var sql1='SELECT * FROM msj_family';
  pool.query(sql1,[],(err,result)=>{
    if(err){
      console.log(err)
    }else{
      res.send(result);
      
    }
  })
}) 
//点击事件 下拉列表+分类列表+商品列表
router.get("/base",(req,res)=>{
  var z_uid=req.query.z_uid;
  var output={
    product:{},
    specs:[],
    pics:[]
  }
   var sql1=`select * from msj_family where z_uid=?`;
    pool.query(sql1,[z_uid],(err,result)=>{
      if(err) console.log(err);
      output.product=result[0];
      var z_family_id=output.product["z_uid"];
      var sql2=`select * from msj_laptop_family where z_family_id=?`;
      pool.query(sql2,[z_family_id],(err,result)=>{
        if(err) console.log(err);
        output.specs=result;
        t=result[0];
        var z_ftb_id=t["z_pid"];
        var sql3=`select * from msj_laptop_family_ftb where z_ftb_id=?`;
        pool.query(sql3,[z_ftb_id],(err,result)=>{
          if(err) console.log(err);
          output.pics=result;
          res.send(output);
        })
      })
    }) 
}) 
  //点击事件 商品列表
router.get("/fen",(req,res)=>{
  var l_id=req.query.l_id;
  var sql4="select * from msj_laptop_family_ftb where z_ftb_id=?";
  pool.query(sql4,[l_id],(err,result)=>{
    if(err) console.log(err);
    res.send(result);
  })
})
//向购物车查询数据
router.get("/stater",(req,res)=>{
  var x_product_id=req.query.x_product_id;
  var sql6="SELECT * FROM msj_cart WHERE x_product_id = ?";
  pool.query(sql6,[x_product_id],(err,result)=>{
    if(err) console.log(err);
    res.send(result[0])
  })
})
//向购物车插入数据
router.get("/catr",(req,res)=>{
  var x_product_id=req.query.x_product_id;
  var x_img_url=req.query.x_img_url;
  var x_title=req.query.x_title;
  var x_name=req.query.x_name;
  var x_price=req.query.x_price;
  var x_uid=req.query.x_uid;
  var x_count=req.query.x_count;
  var x_is_checked=req.query.x_is_checked;
  var sql5="insert into msj_cart set  x_uid=?,x_product_id=?,x_img_url=?,x_title=?,x_name=?,x_price=?,x_count=?,x_is_checked=?";
  pool.query(sql5,[x_uid,x_product_id,x_img_url,x_title,x_name,x_price,x_count,x_is_checked],(err,result)=>{
    if(err) console.log(err);
      res.send(result)
    
  })
})
//修改购物车 商品数量
router.get("/upse",(req,res)=>{
  var x_id=req.query.x_id;
  var x_count=req.query.x_count;
  var sql7="UPDATE msj_cart SET x_count=? WHERE x_id=?";
  pool.query(sql7,[x_count,x_id],(err,result)=>{
    if(err) console.log(err);
    res.send(result);
  })
})
router.get("/type",(req,res)=>{
  var z_uid=req.query.z_uid;
  var sql8="SELECT * FROM msj_family WHERE z_uid=?";
  pool.query(sql8,[z_uid],(err,result)=>{
    if(err) console.log(err);
    res.send(result);
  })
})
//导出路由器
module.exports=router;