//引入express框架
const express=require('express');
const cors=require('cors');
const session=require("express-session")

//创建web服务器
const server=express();
//设置端口号
server.listen(3000);
//引入mockjs
// const Mock = require('mockjs');
//引入路由器
// 选择地址的接口
const indexRouter=require('./routers/index.js');
const cation=require('./routers/cation.js')
const cationRouter=require('./routers/cation.js')
const footp=require('./routers/footp.js')
const login = require('./routers/login.js')
const search = require('./routers/search.js')
//引入bodyParser中间件 
const bodyParser=require('body-parser');
// 选择地址的接口
const addressList=require('./routers/addressList.js')
//添加地址的接口
const addressEdit=require('./routers/addressEdit.js')
// 修改地址获取内容的接口
const addressEdits=require('./routers/addressEdits.js')
// 修改地址删除地址的接口
const addressEdits_del=require('./routers/addressEdits_del.js')
// 修改地址修改后保存的地址
const addressEdits_ins=require('./routers/addressEdits_ins.js')
//  创建购物车请求数据的接口 
const cart=require('./routers/cart.js')
// 购物车删除的接口
const cart_del=require('./routers/cart_del.js')
// 购物车商品数量变化的接口
const cart_num=require('./routers/cart_num.js')
// 购物车商品是否勾选
const cart_sit=require('./routers/cart_sit.js')

//设置中间件
server.use(bodyParser.urlencoded({
  extends:false
}));
server.use(bodyParser.json());
server.use(cors({
  origin:['http://127.0.0.1:8080','http://localhost:8080'],
  credentials:true
}))
server.use(session({
  secret:"128位字符串",
  resave:true,
  saveUninitialized:true
}))
//静态资源托管
server.use(express.static('public'));
server.use('/index',indexRouter);
server.use('/cation',cationRouter);
server.use('/cation',cation);
server.use('/footp',footp);
server.use('/search',search);
server.use('/login',login);
// 购物车数据请求的接口
server.use('/cart',cart);
server.use('/cart_num',cart_num);
server.use('/cart_sit',cart_sit);
server.use('/cart_del',cart_del);
server.use("/addresslist",addressList);
server.use("/addressedit",addressEdit);
server.use("/addressedits",addressEdits);
server.use("/addressedits_ins",addressEdits_ins);
server.use("/addressedits_del",addressEdits_del);
