<template>
    <div>
        <van-nav-bar title="优惠券" left-arrow  @click-left="onClickLeft" />
        <van-tabs line-height="0.0625rem" >
            <van-tab title="可使用的优惠券" >
                <div class="yhz">
                    <div><img src="../../../assets/me/yh11.png" ></div>
                    <div><img src="../../../assets/me/yh22.png" ></div>
                </div>
            </van-tab>
            <van-tab title="已使用/已过期">
                <div class="gqz"> 
                    <div><img src="../../../assets/me/guo11.png" ></div>
                    <div><img src="../../../assets/me/guo22.png" ></div>
                    <div><img src="../../../assets/me/guo33.png" ></div>
                </div>
            </van-tab>
        </van-tabs>
    </div>
</template>
<script>
import { NavBar,Icon } from 'vant';
import { Tab, Tabs } from 'vant';
import Vue from 'vue'
Vue.use(Icon);
Vue.use(NavBar);
Vue.use(Tab).use(Tabs);
export default{
        data(){
            return { }
        },
        methods: {
            onClickLeft() {
            this.$router.push({path:'/me'})
            },
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
/*使用的*/
.yhz>div{
    height:5.875rem;
    margin-top:1rem;
    text-align:center;
}
.yhz>div>img{
    width:22.25rem; height:5.875rem;
}
/*过期*/
.gqz>div{
    height:4.875rem;
    margin-top:1rem;
    text-align:center;
}
.gqz>div>img{
    width:22.25rem; height:4.875rem;
}
</style>


