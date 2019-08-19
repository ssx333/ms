const express=require("express")
const router=express.Router();
const pool=require("../pool.js");
router.get("/",(req,res)=>{
    var obj=req.query.id
    var sql="DELETE FROM msj_user_address WHERE l_id =?"
    pool.query(sql,[obj],(err,result)=>{
        if(err){
            console.log(err)
        }else{
            res.send({code:1})
        }
    })
})

module.exports=router;