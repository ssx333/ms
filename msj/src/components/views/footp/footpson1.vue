<template>
	<div style="background-color: white;" class="test">
		<div class="msj_c_head" ref="height1">
			<img src="../../../assets/images/msj_left.png" @click="goto1"/>
			<span>商品详情</span>
		</div>
		<div class="msj_c_img" ref="height">
			<img src="../../../assets/images/msj_c_details.png" />
		</div>
		<div class="msj_c_text" ref="height2">
			<p>澳洲深海龙虾&nbsp;鲜活虾</p>
			<p>400g&nbsp;16-20只&nbsp;原装进口</p>
			<p>¥169.0&nbsp;<span>/500g</span></p>
			<img src="../../../assets/images/msj_c_details1.png" />
			<button @click="c_click">查看食谱</button>
		</div>
		<div class="msj_c_commentz" ref="height3" style="background-color: white;">
			<div class="msj_c_comment">
				<div class="msj_c_comment1">
					<img src="../../../assets/images/msj_c_details2.png" />
					<span>评论</span>
				</div>
				<input type="text" placeholder="请输入" v-model="content" ref="input1" />
				<button @click="postComment(),getTime()">发表</button>
			</div>
			<div class="msj_c_comment2" v-for="item in list" :key="item.id">
				<div class="c_text">
					<img src="../../../assets/images/msj_c_1_03.png" />
					<span>评论人：{{uname}}</span>
					<span>{{item.nowTime}}</span>
				</div>
				<p>{{item.content}}</p>
			</div>
		</div>
	</div>
</template>

<script>
	export default {
		data() {
			return {
				clientHeight: '',
				clientHeight1:"",
				clientHeight2:"",
				clientHeight3:"",
				list:[
					{
						id:Date.now(),
						user:"q",
						content:"123",
						nowTime:""
					},
					{
						id:Date.now(),
						user:"w",
						content:"1234",
						nowTime:""
					},
					{
						id:Date.now(),
						user:"e",
						content:"12345",
						nowTime:""
					},
				],
				user:"",
				content:"",
				uname:""
			}
		},
		mounted(){
			this.clientHeight = `${document.documentElement.clientHeight}`;
			this.clientHeight1=this.$refs.height.clientHeight;
			this.clientHeight2=this.$refs.height1.clientHeight;
			this.clientHeight3=this.$refs.height2.clientHeight;
			this.uname=window.sessionStorage.getItem('uname');
			var mn=this.clientHeight/32;
			var mb=this.clientHeight1/32;
			var mv=this.clientHeight2/32;
			var mc=this.clientHeight3/32;
			var mq=mn-mb-mv-mc;
			this.$refs.height3.style.height=mq*2-3-0.375+"rem";
			window.onresize = function(){
				this.clientHeight = `${document.documentElement.clientHeight}`;
				this.clientHeight1=this.$refs.height.clientHeight;
				this.clientHeight2=this.$refs.height1.clientHeight;
				this.clientHeight3=this.$refs.height2.clientHeight;
			};
		},
		watch: {
			clientHeight: function() {
				this.changeFixed(this.clientHeight,this.clientHeight1,this.clientHeight2,this.clientHeight3)
			}
		},
		created(){
			this.loadComments()
			this.getTime()
		},
		methods: {
			c_click(){
				this.$router.push('/footpson');
			},
			changeFixed(clientHeight,clientHeight1,clientHeight2,clientHeight3) { 
				var mn=clientHeight/32;
				var mb=clientHeight1/32;
				var mv=clientHeight2/32;
				var mc=clientHeight3/32;
				var mq=mn-mb-mv-mc;
				this.$refs.height3.style.height=mq*2-3-0.375+"rem";
			},
			postComment(){
				var input1=this.$refs.input1;
				if(input1.value==""||input1.value==undefined||input1.value==null){
					input1.placeholder="请输入文本";
				}else if(this.uname==null){
					this.content="";
					input1.placeholder="请登录";
				}else{
					var comment={id:Date.now(),user:this.user,content:this.content,nowTime:this.nowTime}
					var list=JSON.parse(localStorage.getItem("cmts")||"[]")
					list.unshift(comment)
					localStorage.setItem("cmts",JSON.stringify(list))
					this.user=this.content=this.nowTime=""
					this.loadComments()
				}
			},
			loadComments(){
				var list=JSON.parse(localStorage.getItem("cmts")||"[]")
				this.list=list
			},
			getTime(){
				this.nowTime=new Date().toLocaleString();
			},
			goto1(){
				this.$router.go(-1);
			},
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
		width: 0.8125rem;
		height: 0.61rem;
		position: absolute;
		top: 43%;
		left: 6%;
		transform: translate(-43%.-6%);
	}

	.msj_c_head>span {
		color: white;
		font-size: 1.125rem;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%,-50%);
	}

	.msj_c_img>img {
		width: 100%;
		height: 100%;
		position: relative;
		top: 3.75rem;
	}

	.msj_c_text {
		width: 100%;
		height: 7rem;
		border-bottom: 0.375rem solid #f3f3f3;
		position: relative;
		top: 3.75rem;
	}

	.msj_c_text>p:first-child {
		font-size: 1.125rem;
		font-weight: 800;
		position: absolute;
		top: 1.1875rem;
		left: 1rem;
	}

	.msj_c_text>p:nth-child(2) {
		font-size: 0.75rem;
		color: #a3a3a3;
		font-weight: 400;
		position: absolute;
		top: 3.1875rem;
		left: 1rem;
	}
	.msj_c_text>button{
		border: none;
		border-radius: 0.25rem;
		background: #1989fa;
		color: white;
		height: 1.125rem;
		font-size: 0.125rem;
		position: absolute;
		bottom: 0.375rem;
		left: 9rem;
	}
	.msj_c_text>p:nth-child(3) {
		font-size: 1rem;
		color: #f97a2e;
		font-weight: 800;
		position: absolute;
		top: 5rem;
		left: 1rem;
	}

	.msj_c_text>p:nth-child(3)>span {
		font-size: 0.6875rem;
		color: #666666;
		font-weight: 400;
	}

	.msj_c_text>img {
		height: 2.78rem;
		position: absolute;
		top: 2.5rem;
		right: 0.6875rem;
	}

	.msj_c_commentz {
		position: relative;
		top: 3.75rem;
		width: 100%;
		overflow-y: auto;
	}

	.msj_c_comment {
		width: 100%;
		height: 3.25rem;
		position: relative;
		border-bottom: 0.03rem solid #e2e2e2;
	}
	.msj_c_comment>input{
		width: 50%;
		height: 50%;
		position: absolute;
		top: 1rem;
		left: 9rem;
		border: none;
		border-radius: 0.375rem;
		background-color: #e2e2e2;
		padding-left: 0.625rem;
	}
	.msj_c_comment>button{
		border: none;
		border-radius: 0.375rem;
		background-color: #e2e2e2;
		position: absolute;
		top: 1.125rem;
		right: 3.125rem;
		color: white;
		line-height: 1.125rem;
	}
	.msj_c_comment1 {
		position: absolute;
		top: 1.0625rem;
		left: 1rem;
	}

	.msj_c_comment1>img {
		height: 1rem;
	}

	.msj_c_comment1>span {
		font-size: 0.75rem;
		margin-left: 0.5rem;
	}

	.msj_c_comment2 {
		width: 100%;
		height: 5.9375rem;
		border-bottom: 0.03rem solid #e2e2e2;
		position: relative;
		background: white;
	}

	.c_text>img {
		height: 2.0625rem;
		position: absolute;
		top: 0.6875rem;
		left: 0.875rem;
	}

	.c_text>span {
		color: #666666;
		position: absolute;
		top: 1.1875rem;
	}

	.c_text>span:nth-child(2) {
		left: 3.75rem;
	}

	.c_text>span:nth-child(3) {
		right: 1.1875rem;
	}

	.msj_c_comment2>p {
		font-weight: 800;
		position: absolute;
		top: 4rem;
		left: 0.875rem;
	}
</style>
