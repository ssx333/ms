<template>
	<div class="app_c">
		<div class="msj_c_head" ref="height1">
			<img src="../../../assets/images/msj_left.png" @click="plm" />
			<span>食谱</span>
		</div>
		<img src="../../../assets/images/foot_c_qq.png" />
		<div class="app_c_o1">
			<div class="app_c_tou">
				<span>香煎深海虾</span>
				<img src="../../../assets/images/foot_c_qq06.png" />
			</div>
			<div class="app_c_ft">
				<img src="../../../assets/images/foot_c_qq01.png" />
				<span>适宜肤色没有光华，失去红润、手脚冰凉的人群。黄鱼含有丰富的蛋白质、矿物质和维生素，对人体有很好的补益作用</span>
			</div>
			<div class="app_c_wei">
				<div class="app_c_wei1">
					<img src="../../../assets/images/foot_c_qq03.png" />
					<span>深海虾</span>
					<span>500g</span>
				</div>
				<div class="app_c_wei1 app_c_wei2">
					<span>大头蒜</span>
					<span>若干</span>
				</div>
				<div class="app_c_wei1 app_c_wei2">
					<span>大葱</span>
					<span>50g</span>
				</div>
				<div class="app_c_wei1 app_c_wei2">
					<span>生姜</span>
					<span>50g</span>
				</div>
				<div class="app_c_wei1 app_c_wei2">
					<span>橄榄油</span>
					<span>若干</span>
				</div>
				<div class="app_c_wei1 app_c_wei2">
					<span>盐</span>
					<span>若干</span>
				</div>
			</div>
		</div>
		<img src="../../../assets/images/foot_c_qq02.png" />
		<img src="../../../assets/images/foot_c_qq02.png" />
		<div class="app_c_pl">
			<div class="c_pl">
				<div class="app_c_oo">
					<p>1</p>
					<div class="app_c_das"></div>
					<span>将小黄鱼去除内脏和鳃，洗净；葱白洗净切段，葱叶切丝；姜洗净，部分切末</span>
				</div>
				<div class="app_c_oo">
					<p>2</p>
					<div class="app_c_das"></div>
					<span>在盛小黄鱼的大碗中放入盐、味精、料酒、葱段、姜片和花椒、腌制两小时</span>
				</div>
				<div class="app_c_oo">
					<p>3</p>
					<div class="app_c_das"></div>
					<span>捡去花椒、葱段、姜片，在盆中撒入干面粉，将鱼身裹匀</span>
				</div>
				<div class="app_c_oo">
					<p>4</p>
					<div class="app_c_das"></div>
					<span>往锅内倒油，烧热，调中火，逐条下入小黄鱼，炸至金黄色即可捞出</span>
				</div>
				<div class="app_c_oo">
					<p>5</p>
					<span>调大火，将油烧热，把油再次倒入，复炸一遍，使外皮焦脆即可捞出</span>
				</div>
			</div>
			<div class="c_poiu">
				<img src="../../../assets/images/foot_c_qq05.png" />
			</div>
		</div>
	</div>
</template>

<script>
	export default {
		methods: {
			plm(){
				this.$router.go(-1);
			}
		}
	}
</script>

<style>
	.app_c>img{
		width: 100%;
		position: relative;
		top: 3.75rem;
	}
	.app_c{
		position: relative;
		background: #393939;
		width: 100%;
		height: 38.6875rem;
		overflow-y: auto;
	}
	.msj_c_head {
		width: 100%;
		height: 3.75rem;
		background-color: #202020;
		position: fixed;
		z-index: 100;
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
	.app_c_o1{
		width: 20.1875rem;
		height: 22.4375rem;
		z-index: 10;
		background: white;
		position: absolute;
		top: 14.9375rem;
		left: 1.5625rem;
		border-radius: 0.625rem;
	}
	.app_c_tou{
		width: 100%;
		text-align: center;
		margin-top: 2.125rem;
		font-size: 1.3125rem;
	}
	.app_c_tou>img{
		height: 0.75rem;
		padding-left: 0.375rem;
	}
	.app_c_ft{
		color: #a3a3a3;
		font-size: 0.75rem;
		width: 15.4375rem;
		margin: 0 auto;
	}
	.app_c_ft>span{
		display: inline-block;
		width: 14.1875rem;
		line-height: 1.25rem;
		margin-top: 1.625rem;
		margin-left: 0.625rem;
	}
	.app_c_ft>img{
		height: 0.625rem;
		position: relative;
		top: -2.5rem;
		
	}
	.app_c_wei{
		height: 11.25rem;
		width: 15.375rem;
		margin: 1.125rem auto;
	}
	.app_c_wei1{
		height: 1.875rem;
		border-bottom: 1px solid #e2e2e2;
		font-size: 0.6875rem;
	}
	.app_c_wei1>img{
		height: 0.6875rem;
	}
	.app_c_wei1>span{
		line-height: 1.875rem;
	}
	.app_c_wei1>span:nth-child(2){
		margin-left: 0.5rem;
	}
	.app_c_wei1>span:nth-child(3){
		float: right;
	}
	.app_c_wei2>span:nth-child(1){
		margin-left: 1.1875rem;
	}
	.app_c_wei2>span:nth-child(2){
		float: right;
	}
	.app_c>img:nth-child(4){
		width: 0.8125rem;
		height: 3.1875rem;
		z-index: 20;
		margin-top: 0px;
		margin-left: 4.8125rem;
		margin-top: 12.25rem;
	}
	.app_c>img:nth-child(5){
		width: 0.8125rem;
		height: 3.1875rem;
		z-index: 20;
		float: right;
		margin-right: 4.8125rem;
		margin-top: 12.25rem;
	}
	.app_c_pl{
		width: 20.1875rem;
		height: 22.4375rem;
		z-index: 10;
		background: white;
		position: absolute;
		top: 38.1875rem;
		left: 1.5625rem;
		border-radius: 0.625rem;
		margin-bottom: 1.8125rem;
	}
	.c_pl{
		width: 15.375rem;
		height: 15.125rem;
		margin: 2rem auto;
	}
	.app_c_oo{
		width: 100%;
		height: 3.25rem;
	}
	.app_c_oo>p{
		width: 0.875rem;
		height: 0.875rem;
		border-radius: 50%;
		background: #f97a2e;
		color: white;
		text-align: center;
		font-size: 0.5rem;
	}
	.app_c_oo>span{
		display: inline-block;
		width: 14.2rem;
		font-size: 0.6875rem;
		color: #bababa;
		margin-left: 1.375rem;
		position: relative;
		top: -1rem;
		line-height: 1.125rem;
	}
	.app_c_das{
		position: absolute;
		width: 0.0625rem;
		height: 2.375rem;
		border-left: 1px dashed #f97a2e;
		margin-left: 0.4rem;
	}
	.c_poiu{
		width: 13.9375rem;
		height: 2.25rem;
		background: #f97a2e;
		border-radius: 1.25rem;
		margin: 0 auto;
	}
	.c_poiu>img{
		height: 0.8125rem;
		position: relative;
		top: 50%;
		left: 50%;
		transform: translate(-50%,-50%);
	}
</style>
