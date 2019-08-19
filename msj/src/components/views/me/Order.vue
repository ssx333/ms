<template>
    <div>
     <van-nav-bar title="我的订单" left-arrow @click-left="onClickLeft" />
     <van-tabs v-model="active" :swipe-threshold=5 title-active-color="#f44" line-height="0.0625rem">
         <div  v-if="!islogin">
         </div>
        <van-tab title="全部" v-else>
            <div class="ye_qu">
              <div class="qu" >
                <div class="title">
                    <div class="title_left">
                        <img src="../../../assets/me/shop.png" class="left">
                        <span>千库美食铺</span>
                        <img src="../../../assets/me/xiala.png" class="right">
                    </div>
                    <span class="jy"></span>
                </div>
                <div class="content">
                    <img src="../../../assets/images/small.png" class="leftImg">
                    <div class="right_cont">
                        <span class="sp_title">澳洲深海小黄鱼</span>
                        <span class="sp_small">高蛋白质/低脂肪</span>  
                    </div>
                    <div class="sp_price">￥169.00
                        <span class="sp_count">x1</span>
                    </div>
                </div>
                <div class="heji">共1件商品&nbsp;合计:￥169.00 </div>
                <div class="btn">
                    <van-button round  plain size="small">查看订单</van-button>
                    <van-button round  plain size="small">删除订单</van-button>
                </div>
             </div>
            </div>
            <div class="ye_qu">
              <div class="qu" >
                <div class="title">
                    <div class="title_left">
                        <img src="../../../assets/me/shop.png" class="left">
                        <span>千库美食铺</span>
                        <img src="../../../assets/me/xiala.png" class="right">
                    </div>
                    <span class="jy"></span>
                </div>
                <div class="content">
                    <img src="../../../assets/images/small.png" class="leftImg">
                    <div class="right_cont">
                        <span class="sp_title">澳洲深海小黄鱼</span>
                        <span class="sp_small">高蛋白质/低脂肪</span>  
                    </div>
                    <div class="sp_price">￥169.00
                        <span class="sp_count">x1</span>
                    </div>
                </div>
                <div class="heji">共1件商品&nbsp;合计:￥169.00 </div>
                <div class="btn">
                    <van-button round  plain size="small">查看订单</van-button>
                    <van-button round  plain size="small">删除订单</van-button>
                </div>
             </div>
            </div>
        </van-tab>
        <van-tab title="待付款">
            <div class="no_or">
                <img src="../../../assets/me/order.png" >
                <span class="sp1">您还没有相关的订单</span><br>
                <span class="sp2">可以去看看有哪些想买的</span>
            </div>
        </van-tab>
        <van-tab title="待发货">
            <div class="no_or">
                <img src="../../../assets/me/order.png" >
                <span class="sp1">您还没有相关的订单</span><br>
                <span class="sp2">可以去看看有哪些想买的</span>
            </div>
        </van-tab>
        <van-tab title="待收货">
            <div class="no_or">
                <img src="../../../assets/me/order.png" >
                <span class="sp1">您还没有相关的订单</span><br>
                <span class="sp2">可以去看看有哪些想买的</span>
            </div>
        </van-tab>
        <van-tab title="待评价">
            <div class="no_or">
                <img src="../../../assets/me/order.png" >
                <span class="sp1">您还没有相关的订单</span><br>
                <span class="sp2">可以去看看有哪些想买的</span>
            </div>
        </van-tab>
     </van-tabs>
    </div>
</template>
<script>
import { Tab, Tabs,NavBar,Icon, Button,Dialog} from 'vant'
import Vue from 'vue'
Vue.use(Button).use(Icon).use(NavBar).use(Tab).use(Tabs).use(Dialog);
export default {
    data(){
        return{
            active:0,
            sid:'',
            islogin:false
        }
    },
    methods:{
        onClickLeft(){
             this.$router.push({path:'/me'})
        }
    },
    created(){
        this.sid=window.sessionStorage.getItem('sid');
        if(this.sid==null){
            console.log(123)
			Dialog.confirm({
			title: '未登录',
			message: '是否去登录'
			}).then(() => {
			 this.$router.push('/login');
			}).catch(() => {
			
			});
        }else{
            this.islogin=true
        }
    }
}
</script>
<style scoped>
.van-nav-bar__title{ color:#fff}
.van-nav-bar{
    background-color: rgb(155, 149, 149);
}
.van-nav-bar .van-icon{
    color:rgb(90, 87, 87);
}
/*没有相关信息时显示*/
.no_or{
    display: flex;
    flex-direction: column;
    text-align:center;
    margin-top:5rem;
    display:none;
}
.no_or img{
    width:25%;
    margin:0 auto;
}
.no_or .sp1{
    font-size:0.9rem;
    margin-top:1rem;
}
.no_or .sp2{
    font-size:0.5rem;
    color:#ccc;
}
/*全部*/
.ye_qu{
    height:14.21875rem;
    margin-top:0.875rem;
    display:flex;
    flex-direction: column;
    margin-bottom:0.65625rem;
}
.qu{
    padding:0.75rem 0.5625rem 1rem 0.5625rem; 
}
.title{
    width:22.25rem;height:1.71875rem;
    display:flex;
    justify-content:space-between;
    align-items: center;
}
.title .left{
    width:1.1875rem;height:1.0625rem;
    margin-right:0.6875rem;
}
.title .right{
    width:0.46875rem;height:0.6875rem;
    margin-left:1rem;
}
.jy{
    color:#f44;
    font-weight:550;
}
/*商品内容*/
.content{
    width:22.28125rem;height:6.9375rem;
    margin: 1.21875rem  0 0.65625rem 0;
    height: 5.6875rem;
    display:flex;
    justify-content: space-between;
}
.content .leftImg{
    width:5.15625rem;height: 5.15625rem;
    margin-right:0.25rem;
}
.right_cont{
    display:flex;
    flex-direction: column;
    margin-left: 0.3125rem ;
}
.sp_title{
    width:11.8125rem;height: 2rem;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
}
.sp_small{
    margin-top:0.5rem;
    color:#ccc;
    font-size:0.9rem;
}
.sp_price{
    display:flex;
    flex-direction: column;
    text-align: right;
}
.sp_count{
    margin-top:1rem;
    color:#ccc;
}
/*合计*/
.heji{
    height:1.75rem;
    text-align:right;
    line-height:1.75rem;
    border-top: 0.05rem solid rgb(227,232,236);
    border-bottom: 0.05rem solid rgb(227,232,236);
}
/*按钮*/
.btn{
    margin-top:1rem;
    text-align:right;
}
</style>
