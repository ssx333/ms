<template>
  <div>
    <div v-show="showState==0">
      <van-nav-bar title="确认订单" fixed left-arrow @click-left="click_left" />
      <div style="width:100%;height:3rem;"></div>
      <div class="msj_address">收货地址:</div>
      <div class="address" @click="showState=1">
        <div class="msj_address_list">
          <div>{{currentAddress.name}} {{currentAddress.tel}}</div>
          <div>{{currentAddress.address}}</div>
        </div>
        <van-icon name="arrow" />
      </div>
    </div>
  <!-- 选择地址 -->
    <div v-show="showState==1">
      <van-nav-bar title="选择地址" fixed  left-arrow @click-left="showState=0" />
      <div style="width:100%;height:3rem;"></div>
      <van-address-list
       v-model="chosenAddressId"
        :list="list"
        @click="showState=2"
        @add="onAdd"
        @edit="onEdit"
        @select="selectaddress"
        
      />
    </div>
    <div v-show="showState==0" style="margin-top:0.5rem;">
      <div style="background:#eee;padding:0.5rem 0.5rem">商品详情</div>
    <div style="overflow-x: hidden;
        overflow-y: scroll;">
    <van-card
      :num="item.x_count"
      :price="item.x_price"
      :desc="item.x_name"  
      :title="item.x_title"
      :thumb="item.x_img_url"
      v-for="(item,i) of carts" :key="i"
    />
    <div style="width:100%;height:6rem;"></div>
    </div>
</div>
  <div v-show="showState==0">
    <van-submit-bar
  :price="amount"
  button-text="提交订单"
  @submit="onSubmit"
/>
  </div>

  </div>
</template>
<script>
import Vue from "vue";
import { NavBar, Icon, AddressList,AddressEdit,Card } from "vant";
Vue.use(NavBar)
  .use(Icon)
  .use(AddressList)
  .use(AddressEdit)
  .use(Card);
export default {
  data(){
    return{
      showState:0,
      chosenAddressId:1,
      currentAddress:"",
      list:[],
      carts:[],
      num:[]
      
    }
  },
  methods:{
    click_left(){
        this.$router.go(-1)
        // 返回时清空添加到vuex中的数据局
        this.$store.commit("delete")
    },
    onSubmit(){

    },
    onAdd(){
      // 添加地址触发的事件
      this.$router.push('/addressEdit')
      
    },
    onEdit(item,index){
      // 修改地址触发的事件
      // 传过去数据id值
    this.$router.push({path:'/addressEdits',query:{id:item.id}});
    },
    selectaddress(item,index){
      this.showState=0
      this.currentAddress = item
    },
    // 定义一个事件,在页面加载的时候调用这个事件
    ondown(){
        this.axios.get('http://127.0.0.1:3000/addresslist').then(res=>{
         for(var p of res.data){
        if(p.l_default==true){
          // 刚加载时默认将默认地址为第一位
        this.chosenAddressId=p.l_id,
        this.currentAddress={
        id:p.l_id,
        name:p.l_name,
        tel:p.l_phone,
        address:p.l_provinces+p.l_city+p.l_area+p.l_det_address
        }
        };
        // 将请求下来的数据加载到list 的列表上去
        this.list.push({
        id:p.l_id,
        name:p.l_name,
        tel:p.l_phone,
        address:p.l_provinces+p.l_city+p.l_area+p.l_det_address
        
      })
      var stt=sessionStorage.getItem("cart")
      }  
        }).catch(err=>{
          console.log(err)
        })
    },

  },
  created(){
    this.ondown();
    // 页面加载时从vuex中拿数据
    this.carts=this.$store.getters.cart
  },
  computed:{
      amount() {
        var amount=0;
        for (var p of this.carts) {
          amount+=p.x_price * p.x_count;
        }
      return amount*100;
    } 
  },

  // 最外面一层
}

</script>

<style>
.msj_address_list>div{
  padding:0.8rem 0;
}
body {
  background: #eee;
}
.address {
  padding: 0.3rem;
  background: #fff;
  /* line-height:; */
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.van-address-list__add{
  bottom: 3rem!important;
}
.msj_address{
  padding:0.3rem;background-color:white;color:grey;border-bottom:1px dashed #eee;
}
</style>


