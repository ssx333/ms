<template>
	<div>
		<van-nav-bar
  title="购物车"
  fixed
  @click-left="onClickLeft"
  
/>
<div style="width:100%;height:3rem"></div>
		<!-- 购物车内容 -->
		<table></table>
		<div class="msj_details">
			<van-swipe-cell v-for="(item,i) of cart " :key="i" class="msj_margin_top">

				<div class="msj_details_top">
					<!-- 前面的选择对勾 -->
					<van-checkbox v-model="item.x_is_checked" checked-color="#07c160" @click="cart_sit(!item.x_is_checked,item.x_id)"></van-checkbox>
					<!-- 中间的内容部分 -->
					<div class="msj_details_img">
						<div><img :src="item.x_img_url" alt=""></div>
						<div>
							<div class="msj_title">{{item.x_title}}</div>
							<p class="msj_small">{{item.x_name}}</p>
							<p class="msj_pic"><span>￥</span>{{item.x_price.toFixed(2)}}</p>
						</div>
					</div>
					<!-- 右边数量选择 -->
					<div class="msj_delete_right">
						<span @click="dianji(1,i,item.x_id)">+</span>
						<i class="msj_input">{{item.x_count}}</i>
						<span @click="dianji(-1,i,item.x_id)">-</span>
					</div>
				</div>

				<template slot="right" class="msj_delete_right">
					<van-button type="danger" text="删除" size="small" round @click="delete_list(i,item.x_id)" />
				</template>
			</van-swipe-cell>

		</div>
		<table></table>
		<div style="width: 100%;height:6rem;"></div>
		<van-submit-bar :price="total" button-text="去结算" @submit="router_link">
			<van-checkbox v-model="checkbox" @click="chock()">全选</van-checkbox>
		</van-submit-bar>

	</div>
</template>
<script>
	import Vue from "vue"
	import {
		SwipeCell,
		Button,
		Cell,
		CellGroup,
		Checkbox,
		CheckboxGroup,
		SubmitBar,
		Dialog,
		Toast
	} from 'vant';

	Vue.use(Cell).use(CellGroup).use(Button).use(SwipeCell).use(Checkbox).use(CheckboxGroup).use(SubmitBar).use(Toast);
	export default {
		data() {
			return {
				checkbox: false,
				list: {},
				cart: [],
				sum:0,
				stt:''

			}
		},

		methods: {
			cart_sit(m,n){
				if(m==true){
					m=1
				}else{
					m=0
				}
				this.axios.get('http://127.0.0.1:3000/cart_sit',{params:{x_default:m,id:n}}).then(res=>{
      			}).catch(err=>{
					  console.log(err)
				  })
			},
			onClickLeft(){
			},
			router_link(){
				// 遍历保存当前勾选的商品并将信息传到下一个页面
				var str=0;
				for (var num of this.cart) {
					// 判断是否没有选中商品,没有的化不会往下一步进行
					if(num.x_is_checked==true){
						// this.carts.push(num)
						this.$router.push({path:'/addressList'});
						// sessionStorage.setItem("cart",this.carts.join(''))
						str+=num.x_price
						// 将数据插入到vuex 中
						// 通知数据仓库添加到数据仓库
						this.$store.commit("add",num)
					}
				}
				
					// 没有选中商品进行提示	
					if(this.stt==null){
							Dialog.confirm({
							title: '未登录',
							message: '是否去登录'
							}).then(() => {
							// on confirm
							}).catch(() => {
							// on cancel
							});
					}else{
						if(str==0){
							Toast('请选中要购买的商品')
						}
					}
        			
				
			},
			dianji: function(e, m,id) {
				// 判断数量最小值为1 然后根据传入的数字进行数量加减
				if (this.cart[m].x_count > 1 || e > 0) {
					this.cart[m].x_count += e
					var x_count=this.cart[m].x_count
			this.axios.get('http://127.0.0.1:3000/cart_num',{params:{x_count:x_count,id:id}}).then(res=>{
      			}).catch(err=>{
					  console.log(err)
				  })
				}
			},
			chock() {
				for (var p of this.cart) {
					p. x_is_checked= !this.checkbox

				}

			},
			delete_list(e,id) {
				Dialog.confirm({
					message: '移出购物车'
				}).then(() => {
					// on confirm
					this.cart.splice(e, 1)
					this.axios.get('http://127.0.0.1:3000/cart_del',{params:{id:id}}).then(res=>{
         			if(res.data.code){
						 
         			 	}
      				})
				}).catch(() => {
					// on cancel
				});
			},


		},
		computed: {
			total() {
				var sum = 0;
				for (var p of this.cart) {
					if (p.x_is_checked == false) {
						this.checkbox= false
					}
					if (p.x_is_checked == true) {
						sum += p.x_price * p.x_count;
					}
				}
				return sum * 100;
			}
		},
		created(){
			// 页面打开时加载购物车数据
			// 页面加载的时候判断是否登录获取id值,然后根据id值请求数据
			// if(){}else{
				// 弹出登录要求,然后跳转页面

			// }
			// localStorage.getItem(key)
			
		this.stt=window.sessionStorage.getItem('sid');
		console.log(this.stt)
		if(this.stt==null){
			console.log(123)
			Dialog.confirm({
			title: '未登录',
			message: '是否去登录'
			}).then(() => {
			 this.$router.push('/login');
			}).catch(() => {
			// on cancel
			});
		}else{
		// 登录后查询stt的id下的购物车
		this.axios.get('http://127.0.0.1:3000/cart',{params:{id:this.stt}}).then(res=>{
		this.cart=res.data
		this.cart.checked=res.data.x_is_checked
      })
		}
			
	
		},
	}
</script>
<style>
/* 顶部导航的样式 */
.van-nav-bar{
	background: black!important;
}
.van-nav-bar__title,.van-nav-bar__text,.van-nav-bar .van-icon{
	color:white!important;
}

	/* 购物车内具体内容 */
	.msj_details {
		width: 95%;
		background: #ffffff;
		margin: 0.5rem auto 0.5rem auto;
		border-top:1px solid #eee;
		border-bottom:1px solid #eee;
		border-radius: 1rem;
	}

	.msj_details_top {
		display: flex;
		justify-content: space-around;
		height: 4rem;
	}

	/* 具体内容中图片和介绍 */
	.msj_details_img {
		display: flex;
		width: 65%;
	}

	/* 大标题 */
	.msj_title {
		font-size: 0.8rem;
		margin: 0.5rem 0 0 1rem;
	}

	.msj_small {
		font-size: 0.6rem;
		margin: 0.5rem 0 0 1rem;
	}

	.msj_pic {
		color: #f97a2e;
		font-size: 0.9rem;
		margin: 0.5rem 0 0 1rem;
	}

	.msj_pic>span {
		font-size: 0.7rem;
	}

	.msj_details_img>div>img {
		height: 4rem;
	}

	/* span 数字文本框的样式 */
	.msj_input {
		display: inline-block;
		width: 1.3rem;
		height: 1.3rem;
		line-height: 1.3rem;
		text-align: center;
	}

	.msj_details_choose> {
		line-height: 4rem;
	}

	/* 右边划出删除居中 */
	.van-swipe-cell__right {
		line-height: 4rem;
	}

	/* 加减数量居中 */
	.msj_delete_right {
		margin-top: 1.3rem;
	}

	.msj_delete_right>span {
		display: inline-block;
		width: 1.3rem;
		height: 1.3rem;
		line-height: 1.3rem;
		background: #e76f2a;
		text-align: center;
		border-radius: 50%;

	}

	.msj_margin_top {
		margin: 1rem 0;
	}

	.van-submit-bar {
		bottom: 3rem !important;
	}
</style>
