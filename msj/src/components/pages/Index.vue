<template>	
  <div @scroll="handleScroll" class="bghz" id="bghz" ref="client">
    <div class="head-box">
      <img src="../../assets/index/head_top_01.jpg">
      <div class="pos">
        <span class="pos_icon"></span>
        <span v-text="province+city" class="pos_text"></span>
        <span class="pos_msg"></span>
      </div>
			<div :class="{'search_box':isTrue,'search_box_scroll':!isTrue}" ref="serch_relative">
				<search></search>
			</div>
      <div class="nav">
        <span @click="chaneClass" v-for="(prop,i) of navList" :key="i" :data-uid="prop.f_id">{{prop.z_uname}}</span>
      </div>
      <div class="zhekou">
        <em>生鲜美食全场8折</em>
        <span>立即查看</span>
      </div>
      <div class="waimai_list">
        <div class="list_item">
          <div class="item_box">
            <img src="../../assets/index/sao.png">
            <span>扫一扫</span>
          </div>
          <div class="item_box">
            <img src="../../assets/index/pay.png">
            <span>自助买单</span>
          </div>
          <div class="item_box">
            <img src="../../assets/index/vip.png">
            <span>会员码</span>
          </div>
          <div class="item_box">
            <img src="../../assets/index/waim.png">
            <span>外卖</span>
          </div>
        </div>
      </div>
    </div>
    <!--占位-->
    <div class="slot"></div>
    <div class="rela">
      <div class="links">
        <div class="links_box">
          <div class="link_item">
            <img src="../../assets/index/shiling.png">
            <span>时令蔬菜</span>
          </div>
          <div class="link_item">
            <img src="../../assets/index/xinxian.png">
            <span>新鲜水果</span>
          </div>
          <div class="link_item">
            <img src="../../assets/index/guozhi.png">
            <span>果汁饮品</span>
          </div>
          <div class="link_item">
            <img src="../../assets/index/roushi.png">
            <span>肉食禽类</span>
          </div>
          <div class="link_item">
            <img src="../../assets/index/haixian.png">
            <span>海鲜水产</span>
          </div>
          <div class="link_item">
            <img src="../../assets/index/rupin.png">
            <span>乳品烘焙</span>
          </div>
          <div class="link_item">
            <img src="../../assets/index/xiuxian.png">
            <span>休闲零食</span>
          </div>
          <div class="link_item">
            <img src="../../assets/index/riyong.png">
            <span>日用百货</span>
          </div>
          <div class="link_item">
            <img src="../../assets/index/liangyou.png">
            <span>粮油百货</span>
          </div>
          <div class="link_item">
            <img src="../../assets/index/huiyuan.png">
            <span>会员专场</span>
          </div>
        </div>
      </div>
    </div>
    <!-- 配送 -->
    <div class="peisong">
      <img src="../../assets/index/scps.jpg">
    </div>
    <!-- 超市配送水果配送 -->
    <div class="shuigpeis">
      <img src="../../assets/index/csps.jpg">
      <img src="../../assets/index/sgps.jpg">
    </div>
    <div class="fenlei">
      <div class="fenlei_img">
        <span>生蚝海鲜</span>
        <img src="../../assets/index/panz_03.png">
      </div>
    </div>
		<!-- 上拉刷新请求数据组件 -->
      <van-list
        v-model="loading"
        :finished="finished"
				loading-text="客官稍等,马上就来..."
				 finished-text="已经没有数据了,还没有喜欢的么"
				@load="onLoad"
				:offset="50"
				:immediate-check="false"
      >
				<ul class="fenlei_list">
					<li v-for="(item,index) of lists" :key="index">
						<img :src="item.z_pic">
						<span v-text="item.z_ftitle" class="feilei_title"></span>
						<span v-text="`销量${item.sales}`" class="xl"></span>
						<div class="price_box">
							<span class="_price"><i>￥</i>{{item.z_price}}</span>
							<img @click="addCart" src="../../assets/index/tj_car_03.png">
						</div>
					</li>
				</ul>
      </van-list>
  </div>
</template>
<script>
import search from '../Search';
import Vue from 'vue';
import { List } from 'vant';
Vue.use(List)
export default {
  data(){
    return {
			isTrue:true,
			screenWidth: document.documentElement.clientWidth,
			screenHeight:document.documentElement.clientHeight,
      lists:[],
      start:0,
      loading: false,
      finished: false,
			province:'',//获取城市
			city:'', //获取城市
      navList:[],
      dataType:1,
    }
  },
	components: {
	  search
	},
	mounted(){
		//动态获取屏幕的高度  去除底部的navbar的高度设置给最外层div的高度 /16转rem
		let _self = this.$refs.client;//获取当前操作的dom对象
		// console.log(this.screenHeight);
		_self.style.height = (this.screenHeight-48)/16+'rem';//给div动态设置高度
	},
  created () {
		//请求分类数据库信息
		this.axios.get('http://127.0.0.1:3000/index/nav').then(res=>{
      this.navList = res.data;
		}).catch(err=>{
			console.log(err);
		})
   //vue创建后加载数据调用requestData方法发送请求
	 this.requestData();
  //  https://restapi.amap.com/v3/ip?parameters 
  //  高德地图根据IP定位地理位置  请求方式get
   this.requestData();
	 //https://restapi.amap.com/v3/ip?parameters 高德地图根据IP定位地理位置  请求方式get

	 this.requestData();
  //  https://restapi.amap.com/v3/ip?parameters 
  //  高德地图根据IP定位地理位置  请求方式get

   this.requestData();
	 //https://restapi.amap.com/v3/ip?parameters 高德地图根据IP定位地理位置  请求方式get

	 // 1.拼接请求url key=""->高德地图秘钥,ip在国内可省略根据用户ip地址定位 output返回数据格式json/xml
	 let url = 'https://restapi.amap.com/v3/ip?key=ad7ac30d88f122c267ebd14cdf0bc5df&output=JSON';
	 this.axios.get(url).then((output)=>{
		// console.log(output);   高德地图返回定位信息
		this.province = output.data.province;
		this.city = output.data.city;
	 });
  },
  methods:{
		//点击列表请求分类数据
		chaneClass(e){
			let class_uid = e.target.dataset.uid;
      this.dataType = class_uid;
      this.lists = [];
			this.start = 0;
			this.finished = false;
      this.requestData();
		},
		requestData(){
      //请求数据方法 分页查询 传往后台start:开始值 count：查询数量3的倍数
      // console.log(this.dataType);
			var url = `http://127.0.0.1:3000/index/index?type=${this.dataType}&start=${this.start}&count=9`;
			this.axios.get(url).then(response=>{
        // console.log(response);
				const rows = response.data;
				if(rows == null || rows.length === 0){
					//表示数据已经请求完了请求回来的长度为0，将设置为没有更多了
					this.finished = true;
					return 
				}
				//处理请求回来的数据
				if(this.lists.length === 0){
					this.lists = rows;
				}else{
					this.lists = this.lists.concat(rows)
        }
        
			})
		},
    addCart(){
      // console.log(`111`);
    },
		//下拉加载数据
		onLoad() {
			// console.log(`调用我`);
		  setTimeout(() => {
				if(this.lists.length > 0){
					this.start = this.start + 9;
					this.requestData();
				}
        // 加载状态结束
        this.loading = false;
				if(this.lists.length >= 45){
					this.finished = true;
				}
      }, 2000);
    },
		//滚动条滚动事件处理函数
		handleScroll(e){
			//获取滚动条滚动的高度
			let scrollTop = e.target.scrollTop; //获取滚动条滚动距离
			// console.log(scrollTop);  
			let elem_top = this.$refs.serch_relative.offsetTop;//获取元素距离顶部的距离
			//当滚动条滚动高度 === 元素距离顶部高度的时候 定位
			if( scrollTop >= elem_top){
				this.isTrue = false;
			}
			if( scrollTop< 63){
				this.isTrue = true;
			}
		}
  },
}
</script>

<style scoped>
.search_box_scroll{
	width:100%;
	height:4rem;
	padding:1rem 0;
	position:fixed;
	top:0rem;
	background: black;
	z-index: 10000;
}
.search_box{
	width:100%;
	height:2rem;
	position:absolute;
	top:3.90625rem;
	background: transparent;
	z-index: 10000;
}
.price_box>img{
  width:1.59375rem;
  height:1.59375rem;
}
._price{
  color:#f7792e;
  font-size:0.6875rem;
  width:50%;
  line-height: 0.6875rem;
  font-weight: 600;
  line-height:2.25rem;
}
.price_box{
  width:100%;
  display:flex;
  justify-content: space-between;
  flex-flow: row nowrap;
  line-height:2.25rem;
  height:2.25rem;
  align-items: center;
  padding-right:0.375rem;
}
.xl{
  font-size:0.5625rem;
  color:#999;
}
.feilei_title{
  font-size:0.8125rem;
  color:#333;
  height:1.125rem;
  line-height: 1.125rem;
  width:100%;
  display:inline-block;
  letter-spacing: 0.05rem;
  font-weight: 600;
}
.fenlei_list>li>img{
  width:100%;
  height:6.5625rem;
}
.fenlei_list{
  width:100%;
  padding:0.625rem 1.25rem 0;
  display:flex;
  justify-content:space-between;
  flex-flow: row wrap;
}
.fenlei_list>li{
  width:6.4375rem;
  height:11.09375rem;
}
.fenlei_img>img{
  width:7.8125rem;
  height:5.375rem;
  margin-top:0.9375rem;
}
.fenlei_img>span{
  width:5.78125rem;
  height:1.5625rem;
  font-size:1.25rem;
  font-weight: 600;
  color:#fff;
  letter-spacing: 0.15625rem;
  margin-top:2.125rem;
}
.fenlei_img{
  width: 100%;
  height:100%;
  display:flex;
  justify-content: space-between;
  flex-flow:row nowrap;
  background:url(../../assets/index/fenlei_ban_03.jpg) no-repeat center center;
  background-size:cover;
  border-radius: 0.3rem;
  padding:0 2.6875rem;
}
.fenlei{
  width:100%;
  height:7.1875rem;
  padding:0 0.625rem;
  margin-top:0.625rem;
}
.shuigpeis>img{
  width:10.8125rem;
  height:100%;
  display: block;
  border-radius: 0.5rem;
  object-fit: contain;
}
.shuigpeis{
  width:100%;
  height:6.65625rem;
  padding:0 0.625rem;
  display:flex;
  justify-content: space-between;
  flex-flow: row nowrap;
  margin-top:0.9375rem;
}
.bottom_slot{
  width:100%;
  height:3rem;
}
.peisong{
  width:100%;
  height:4.8125rem;
  padding:0 0.625rem;
  margin-top:0.9375rem;
  
}
.peisong>img{
  width:100%;
  height:100%;
  border-radius:0.5rem;
  display: block;
}
.rela{
  position:relative;
  width:100%;
  height:11.25rem;
  /* background:rgba(150,150,150,.2); */
}
.link_item>span{
  font-size:0.75rem;
}
.link_item>img{
  width:2.1875rem;
  height:2.35rem;
}
.link_item{
  /* width:4.125rem; */
  height:3.9rem;
  display: flex;
  justify-content: space-between;
  flex-direction: column;
  align-items: center;
  margin:0 0.59375rem;
}
.links_box{
  width:100%;
  height:100%;
  display: flex;
  justify-content: space-around;
  align-items: center;
  flex-flow:row wrap;
  border-radius: 0.3rem;
  background:#fff;
  box-shadow:0px 10px 25px #969696;
}
.links{
  width:100%;
  height:11.25rem;
  padding:0 0.625rem;
  background-color:transparent;
  position:absolute;
}
.slot{
  width:100%;
  height:4.3rem;
  /* background: #eaeaea; */
}
.item_box>span{
  font-size:0.875rem;
  color:#333;
}
.item_box>img{
  width:2.0625rem;
  height:2.0625rem;
}
.item_box{
  width:4.4375rem;
  height:3.5625rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-direction: column;
}
.list_item{
  width:100%;
  height:100%;
  background-image:linear-gradient(to bottom,#fff,#fefefe,#eeeeee);
  border-radius: 0.3rem;
  box-shadow:0px 10px 25px #969696;
  display: flex;
  justify-content: space-around;
  align-items: center;
  flex-direction: row;
}
.waimai_list{
  width:100%;
  height:5.25rem;
  padding:0 0.625rem;
  position:absolute;
  top:16.25rem;
}
.zhekou>span{
  display: block;
  width:5.4375rem;
  height:1.75rem;
  background-color:#ff7d2f;
  border-radius: 2rem;
  text-align: center;
  line-height: 1.75rem;
  color:#fff;
}
.zhekou{
  width:100%;
  height:3.4375rem;
  position:absolute;
  top:11.875rem;
  padding-left:9.6rem;
  display: flex;
  justify-content: space-between;
  flex-direction: column;
  font-size:0.8125rem;
}
.zhekou>em{
  color:#ff7d2f;
  font-size:1.06rem;
  font-weight: 500;
}
.nav>span+span::before{
  content: '|';
  margin-right:0.8rem;
}
.nav>span{
  display:inline-block;
  width:3.5625rem;
  height:2rem;
  text-align: center;
  line-height: 2rem;
 
  color:#fff;
}
.nav{
  width:100%;
  height:2.44rem;
  line-height: 2.44rem;
  position:absolute;
  top:5.875rem;
}
.pos_msg{
  width:1.3rem;
  height:100%;
  background:url(../../assets/index/msg.png) no-repeat center center;
  background-size:contain;
}
.pos_text{
  width:19rem;
  height:100%;
  font-size:0.85rem;
  color:#fff;
  font-weight: 600;
  text-align: left;
  line-height: 2.81rem;
}
.pos_icon{
  width:1.3rem;
  height:100%;
  background:url(../../assets/index/pos.png) no-repeat center center;
  background-size:contain;
}
.pos{
  width:100%;
  padding:0 0.625rem;
  height:2.81rem;
  display:flex;
  justify-content:space-around;
  align-items: center;
  position:absolute;
  top:1rem;
}
.bghz{
  display:block;
  width:100%;
  height:auto;
  position:relative;
  background-color:#fff;
  overflow: scroll;
}
.head-box{
  width:100%;
  height:18rem;
}
.head-box>img{
  width:100%;
  height:100%;
}
</style>
