<template>
    <div class="navbar">
      <Item :txt="item.txt" :page='item.page'  @change='getVal' :sel='selected' v-for="(item,index) of tabbarDes" :key="index">
        <img class="img-sm" :src="item.normalImg" slot='normalImg'>
        <img class="img-sm" :src="item.activeImg" slot='activeImg'>
      </Item>
    </div>
</template>
<script>
import Item from "./Item"
export default {
  data(){
    return {
      selected:'index',
      tabbarDes:[
        {txt:'首页',page:'index',normalImg:require('../assets/images/index.png'),activeImg:require('../assets/images/index_active.png')},
        {txt:'分类',page:'cation',normalImg:require('../assets/images/fenlei.png'),activeImg:require('../assets/images/fenlei_active.png')},
        {txt:'食谱',page:'footp',normalImg:require('../assets/images/shipu.png'),activeImg:require('../assets/images/shipu_active.png')},
        {txt:'购物车',page:'cart',normalImg:require('../assets/images/car.png'),activeImg:require('../assets/images/car_active.png')},
        {txt:'我的',page:'me',normalImg:require('../assets/images/me.png'),activeImg:require('../assets/images/me_active.png')},
      ]
    }
  },
  components:{
    Item
  },
  methods:{
    getVal(res){
      this.selected = res;
    }
  },
  beforeCreate () {
    this.$router.push('/index');
  }
}
</script>
<style>
 .navbar{
  width:100%;
  height:3rem;
  border-top:1px solid #e2e2e2;
  position:fixed;
  bottom:0;
  z-index: 999;
  display:flex;
  justify-content: space-around;
  flex-flow: row nowrap;
  align-items: center;






  background:#fff;

  background-color: #fff;



  background-color: #fff;


  background-color: #fff;


  background:#fff;

}
.navbar>div{
  display:flex;
  justify-content: space-between;
  flex-flow: column nowrap;
  width:2.3rem;
  height:2.3rem;
  align-items: center;
}
.img-sm{
  width:1.25rem;
  height:1.25rem;
}
.navbar>div>span{
  font-size:0.68rem;
  color:#a3a3a3;
}
.font_color{
  color:#333333;
} 
</style>
