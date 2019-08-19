<template>
	<div style="background: white;height: 619px; overflow-y: auto;">
		<div class="msj_c_head" ref="height1">
			<img src="../../assets/index/search.png" />
			<input placeholder="输入商品名称" />
			<button @click="c_click()">查看详情</button>
		</div>
		<div class="c_qaz">
			<ul>
				<li v-for="(lift,i) of qwe" :key="i" @click="dianji(i)">
					<img :src="lift.imgs" />
					<p :style="{'color': active==i?'#000':'#999'}">{{lift.text}}</p>
				</li>
			</ul>
		</div>
		<div class="c_wsx" v-for="(list,i) of c_foot" :key="i">
			<img :src="list.c_pic" />
			<p>{{list.c_title}}<span><img :src="list.c_pic_small" />{{list.c_subtitle}}</span></p>
			<p>{{list.c_memory}}</p>
		</div>
	</div>
</template>

<script>
	export default {
		data() {
			return {
				c_foot:[],
				qwe:[
						
					{
						imgs:require("../../assets/images/msj_c_s2.png"),
						text:"中餐美食"
					},
					{
						imgs:require("../../assets/images/msj_c_s3.png"),
						text:"西式快餐"
					},
					{
						imgs:require("../../assets/images/msj_c_s4.png"),
						text:"乳酪烘焙"
					},
					{
						imgs:require("../../assets/images/msj_c_s5.png"),
						text:"果汁饮品"
					}
				],
				active:{}
			}
		},
		created (){
		  // 默认事件  商品列表
		  var url="http://127.0.0.1:3000/footp/foot?c_uid="+1;
		  this.axios.get(url).then(res=>{
		   this.c_foot=res.data;
		   this.active=res.data[0].c_uid-1;
		  })
		  
		},
		methods: {
			c_click:function(){
				this.$router.push('/footpson1');
			},
			dianji:function(i){
				this.active=i;
				var c_asd=i+1;
				var url="http://127.0.0.1:3000/footp/foot?c_uid="+c_asd;
				this.axios.get(url).then(res=>{
				 this.c_foot=res.data;
				})
			}
		}
	}
</script>

<style>
	.msj_c_head {
		width: 100%;
		height: 3.75rem;
		background-color: #202020;
		position: fixed;
	}
	
	.msj_c_head>img {
		width:1rem !important;
		height:1rem !important;
		z-index: 10;
		margin-top: -0.25rem;
	}
	.msj_c_head>input{
		width:60%;
		height:2rem;
		outline: none;
		border: none;
		border-radius: 0.3rem;
		color:#999;
		font-size:0.7rem;
		background-color: #fff; 
		position: absolute;
		top: 50%;
		left: 10%;
		transform: translate(-10%,-50%);
		padding-left: 2.125rem;
	}
	.msj_c_head>button{
		border: none;
		border-radius: 0.3rem;
		background: #1989fa;
		color: white;
		height: 2rem;
		width: 20%;
		font-size: 0.125rem;
		position: absolute;
		top: 50%;
		right: 4%;
		transform: translate(-4%,-50%);
	}
	.c_qaz{
		position: relative;
		top: 4.6875rem;
		width: 21rem;
		margin: 0 auto;
		margin-left: -0.5rem;
	}
	.c_qaz>ul>li>img{
		height: 3.5625rem;
	}
	.c_qaz>ul{
		display: flex;
	}
	.c_qaz>ul>li{
		width: 3.5625rem;
		float: left;
		margin-left: 2rem;
	}
	.c_qaz>ul>li>p{
		font-size: 0.8125rem;
		margin-top: 0.75rem;
	}
	.c_wsx{
		position: relative;
		top: 7.1875rem;
		width: 21rem;
		height: 19.4375rem;
		margin: 0 auto;
	}
	.c_wsx>img{
		width: 21rem;
		height: 13.125rem;
		position: absolute;
		left: 50%;
		transform: translate(-50%,0);
	}
	.c_wsx>p{
		position: absolute;
		width: 21rem;
		bottom: 4.4375rem;
		font-weight: 1000;
	}
	.c_wsx>p>span>img{
		height: 0.75rem;
	}
	.c_wsx>p>span{
		color: #a3a3a3;
		font-weight: 400 !important;
		font-size: 0.625rem;
		float: right;
	}
	.c_wsx>p:last-child{
		font-weight: 400 !important;
		color: #a3a3a3;
		position: absolute;
		bottom: 1.5625rem;
		font-size: 0.6875rem;
		line-height: 1.125rem;
	}
</style>