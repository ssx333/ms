<template>
    <div>
        <van-nav-bar title="收藏" left-arrow  @click-left="onClickLeft" />
        
        <van-tabs line-height="0.0625rem" >
            <van-tab title="全部宝贝">
                <spro :leftImg="require('../../../assets/images/small.png')" r_title="澳洲深海小黄鱼" r_small="高蛋白质/低脂肪" :r_price="169.0"></spro>
                <spro :leftImg="require('../../../assets/images/small.png')" r_title="澳洲深海小黄鱼" r_small="高蛋白质/低脂肪" :r_price="169.0"></spro>
                <spro :leftImg="require('../../../assets/images/small.png')" r_title="澳洲深海小黄鱼" r_small="高蛋白质/低脂肪" :r_price="169.0"></spro>
            </van-tab>
            <van-tab title="失效宝贝">
                <div class="zht"> 暂无内容哦！</div>
            </van-tab>
        </van-tabs>
    </div>
</template>
<script>
import Spro from "./Spro.vue"
import { NavBar,Icon } from 'vant';
import { Tab, Tabs } from 'vant';
import Vue from 'vue'
Vue.use(Icon);
Vue.use(NavBar);
Vue.use(Tab).use(Tabs);
    export default{
        data(){
            return{ }
        },
        components:{
            "spro":Spro
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
.van-tabs__line{
    height:0.3125rem;
}
.zht{
    text-align: center;
    margin-top:2rem;
    color:#ddd;
}

</style>
