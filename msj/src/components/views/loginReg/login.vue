<template>
	<div class="login_box">
	  <img src="../../../assets/login/login_icon_03.png" alt="">
	  <input class="ipt" type="text" v-model.lazy="uname" placeholder="请输入用户名">
	  <input class="ipt" type="password" v-model="upwd" placeholder="请输入密码">
		<span v-show="istrue">
			<slot name="rad"></slot>
		</span>
	  <span v-show="istrue" @click="login" class="loginBtn dl">登录</span>
	  <span @click="zc" class="loginBtn zz" :class="{dl:!istrue}">注册</span>
	</div>
</template>
<script>
	import { Toast } from 'vant';
	import Vue from 'vue'
	Vue.use(Toast);
	export default{
		props:{
				istrue:{
					type:Boolean,
					default:false
				}
			},
		data(){
			return {
			  uname:'',
			  upwd:''
			}
		},
		methods:{
			zc(){
				this.$emit('getDate',false);
				var s_name=this.uname
				var s_pwd=this.upwd
				var reg=/^\w{6,9}$/i
				if(!s_name){
					Toast("用户名不能为空")
					return;
				}
				else if(reg.test(s_name)==false){
					Toast("用户名是6~9位数字、字母组合")
					return;
				}
				if(!s_pwd){
					Toast("密码不能为空")
					 return;
					}
				 if(reg.test(s_pwd)==false){
					Toast("密码6~9位数字、字母组合")
					return;
				}
				var url='http://127.0.0.1:3000/login/reg';
				this.axios.post(url,{
						s_name:this.uname,
						s_pwd:this.upwd
				})
				.then(
					result=>{ 
						//用户名已存在
						if(result.data.code==400){
							Toast(result.data.msg)
							//this.uname=''
						}
	                    //用户名不存在
						if(result.data.code==200){
							Toast.success(result.data.msg)
							setTimeout(()=>{
								this.$emit('getDate',true);
							},3000)
						}	
					}
				)
				.catch(err=>{console.log(err)})		
			
	},
			login(){ 
				var url= 'http://127.0.0.1:3000/login/login';
				console.log(this.uname);
				console.log(this.upwd);
				this.axios.post(url,
					{
						uname:this.uname,
						upwd:this.upwd
					}
				)
				.then((response)=>{
					if(response.data.length>0){

						var sessionId = response.data[0].session_id;
						var uname = response.data[0].s_name;
						window.sessionStorage.setItem('sid',sessionId);
						window.sessionStorage.setItem('uname',uname);
						
						Toast.success('登陆成功');
						setTimeout(()=>{
								this.$router.go(-1)
							// this.$router.push({
								// name:this.page,
								// params:{
								// 	sid:sessionId,
								// 	uname:uname
								// }
							
							// })
						},3000)
					}else if(response.data.code == 404){
						Toast(response.data.msg);
					}else if(response.data.code == 400){
						Toast(response.data.msg);
					}
				})
				.catch((err)=>{
					
				})
			}
		}
	}
</script>

<style scoped>
	.login_box{
	  width:100%;
	  height:100%;
	  background:#fff;
	  border-radius: 2rem;
	  display:flex;
	  justify-content: space-around;
	  align-items: center;
	  flex-direction:column;
	  padding-top:2rem;
	}
	.login_box img{
	  width:4.53125rem;
	  height:1.4375rem;
	}
	.rad_box{
	  width: 14.9375rem;
	  height: 2.8125rem;
	  display:flex;
	  justify-content: space-between;
	  flex-direction: row; 
	  color:#666;
	  font-size: 0.625rem;
	  align-items: center;  
	  font-weight: 600;
	}
	.login_box .ipt{
	  width:14.9375rem;
	  height:2.8125rem;
	  border:none;
	  border-bottom:1px solid #ccc;
	  color:black;
	  font-size:1rem;
	  font-weight: 600;
	}
	.loginBtn{
	  width: 14.9375rem;
	  height: 2.8125rem;
	  text-align: center;
	  line-height: 2.8125rem;
	  border-radius: 3rem;
	  font-weight: 600;
	}
	.login_box	.dl{
	  color:#fff;
	  background-color:#333;
	}
	.zz{
	  color:#333;
	  background-color:#fff;
	}
</style>
