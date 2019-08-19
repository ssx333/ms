// 修改数据库的的购物中商品是否默认勾选
const express=require("express")
const router=express.Router();
const pool=require("../pool.js");
router.get("/",(req,res)=>{
    var obj=req.query
    var x_default=obj.x_default
    var id=obj.id
    if(x_default==1){
        var sql="UPDATE msj_cart SET x_is_checked=true where x_id=?"
        pool.query(sql,[id],(err,result)=>{
            if(err){
                console.log(err)
            }else{
                res.send({code:1})
            }
        })
    }else{
        var sql="UPDATE msj_cart SET x_is_checked=false where x_id=?"
        pool.query(sql,[id],(err,result)=>{
            if(err){
                console.log(err)
            }else{
                res.send({code:1})
            }
        })
    }
})

module.exports=router;