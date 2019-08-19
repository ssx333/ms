// 修改数据库的的购物中商品单个购买的数量
const express=require("express")
const router=express.Router();
const pool=require("../pool.js");
router.get("/",(req,res)=>{
    var obj=req.query
    var x_count=obj.x_count
    var id=obj.id
    var sql="UPDATE msj_cart SET x_count=? WHERE x_id=?"
    pool.query(sql,[x_count,id],(err,result)=>{
        if(err){
            console.log(err)
        }else{
            res.send({code:1})
        }
    })
})

module.exports=router;