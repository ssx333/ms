//创建商品列表路由器
const express=require('express');
var router=express.Router();
//引入数据库连接池
var pool=require('../pool.js');

router.post('/login',(req,res)=>{
	var obj = req.body;
	var s_name=obj.uname;
	var s_pwd=obj.upwd;
	var sql= 'SELECT s_name,s_pwd,session_id FROM msj_user WHERE s_name=? AND s_pwd=?';
	if(s_name == '' || s_pwd == ''){
		res.send({code:404,msg:'用户名密码不能为空'})
		return 
	}else{
		pool.query(sql,[s_name,s_pwd],(err,result)=>{
			if(err) throw err;
			if(result.length>0){
				res.send(result)
			}else{
				res.send({code:400,msg:'用户名密码错误'})
			}
		})
	}
})

//
//注册用户名验证
router.post("/reg",(req,res)=>{
	var obj=req.body;
	var s_name=obj.s_name;
	var s_pwd=obj.s_pwd;
	console.log(s_name)
	var reg1=/^\w{6,9}$/i
	if(!reg1.test(s_name)){
		res.send({ code:400,msg:"用户名格式不正确"})
		return;
	}
	if(!s_pwd){
		res.send({ code:400,msg:"密码不能为空"})
		return;
	}
	if(!reg1.test(s_pwd)){
		res.send({ code:400,msg:"密码格式不正确"})
		return;
	}
    var sql1='select s_name from msj_user where s_name=?'
    pool.query(sql1,[s_name],(err,result)=>{
        if(err)throw err
        if(result.length>0){
            res.send({code:400,msg:"用户名已存在"})
        }else{
		   //用户不存在
				var sql2='INSERT INTO msj_user VALUES (null,?,?,null,null,null,1)'
				pool.query(sql2,[s_name,s_pwd],(err,result)=>{
					if(err) throw err;
					if(result.affectedRows>0){
						var sql3='SELECT s_id FROM msj_user WHERE s_name=? AND s_pwd=?'
						pool.query(sql3,[s_name,s_pwd],(err,result)=>{
							if(err) throw err;
							if(result.length>0){
							res.send({code:200,msg:"注册成功"})
							}
						})
						
					}else{
						res.send({code:400,msg:"注册失败，请重新输入信息"})
					}
				})
			

        }
    })
})

module.exports = router;