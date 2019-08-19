<template>
  <div class="scg">
    <div class="lan_shu">
       <search class="lan_cty" @seat="search"></search>
    </div>  
    <!-- 上部导航栏 -->
    <div class="su_tb">
      <div class="su_xin">
        <span class="su_hai hai">海鲜水产</span>
        <img src="../../assets/images/fen-2.png" alt="" class="su_imag" @click="su_hove">
        <div class="hove_stf" :class="{'show':flag,'ctmd':!flag}" >
          <table></table>
          <p v-for="(list,i) of p1" :key="i" v-text="list.z_uname" @click="ba_cn(list.z_uid)"></p>
        </div>
      </div>
      <div class="qn_you">
        <img src="../../assets/images/fen-1.png" alt="" class="qn_img">
        <span class="hai">千库超市</span>
      </div> 
    </div>
   <!-- 分类 -->
    <div class="en_yu">  
        <span :style="{'color': active==list.z_pid?'#000':'#999'}" v-for="(list,i) of p2" :key="i" v-text="list.z_pname" @click="si_su(list.z_pid)"></span>
        <p class="base_sou" v-text="pg.z_uname"></p>
    </div>
    <div class="base" :style="height">
      <div class="en_ctu" v-for="(elem,i) of pt" :key="i">
      <img :src="elem.z_pic" class="en_img1" @click="kou_yu(elem)">
        <div class="en_heng">
        <p class="en_ao gao" v-text="elem.z_ftitle"></p>
        <p class="en_gao gao" v-text="elem.z_fname"></p>
        <p class="en_qian" v-text="`￥${elem.z_price.toFixed(2)}`"></p>
      </div>
      <div class="en_zong">
        <img src="../../assets/images/fen-3.png" alt="" class="en_img2" @click="gou_wu(elem)">
      </div> 
    </div>
    </div>  
  </div> 
</template>
<script>
import search from '../Search';
import Vue from "vue";
import { Toast } from 'vant';
Vue.use(Toast);
export default {
    components: {
    "search":search
  },
  
  data(){  
    return {
      isTrue:false,
      flag:true,
      p1:[],
      p2:[],
      pg:[],
      active:{},
      pt:[],
      height:{
         height:'',
      },  
      context:'',   
    } 
  },
   
  destroyed(){
     this.pt = null;
    this.$store.commit('setDate',[])
  },
  created (){
    this.hh();  
    if(this.pt.length  == 0 && this.$store.getters.searchData.length == 0 ){
      var url="http://127.0.0.1:3000/cation/base?z_uid="+1;
      this.axios.get(url).then(output=>{
      this.p2=output.data.specs;
      this.pt=output.data.pics;
      this.active=output.data.specs[0].z_pid;
    })
    }else{
      this.pt=this.$store.getters.searchData;
      this.yu=this.pt[0].z_type;
      var url="http://127.0.0.1:3000/cation/type?z_uid="+this.yu;
      this.axios.get(url).then(result=>{
        this.pg=result.data[0];
        console.log(this.pg);
      })
    }
   
    //默认事件  商品列表
    //默认事件  下拉列表
    var url="http://127.0.0.1:3000/cation/sata";
     this.axios.get(url).then(result=>{
       this.p1=result.data;   
    })
  },
  methods:{
  search:function(pt){
    this.pt=pt;
  },
    //动态获取浏览器的高
    hh(){
     this.height.height=(window.innerHeight)/23.9+"rem";
    },
    //点击事件 下拉列表显示隐藏
    su_hove:function(){
      this.flag=!this.flag;
    },
    //点击事件 下拉列表+分类列表+商品列表
   ba_cn:function(id){
     this.flag=!this.flag;      
     var url="http://127.0.0.1:3000/cation/base?z_uid="+id;
      this.axios.get(url).then(output=>{
      this.p2=output.data.specs;
      this.pt=output.data.pics;
      this.active=output.data.specs[0].z_pid; 
     })   
   },
  
   //点击事件 商品列表
   si_su:function(id){
    this.active=id;
     var url="http://127.0.0.1:3000/cation/fen?l_id="+id;
     this.axios.get(url).then(result=>{
       this.pt=result.data; 
     })    
   },
   //点击事件 向详情页传递数据
   kou_yu:function(elem){
     console.log(elem)
    this.$store.commit('increment',elem);

     this.$router.push('/footpson1'); 
   },
   //点击事件 向购物车插入数据
 gou_wu:function(elem){
     this.f1=elem.z_fid;
     this.f2=elem.z_fname;
     this.f3=elem.z_ftitle;
     this.f4=elem.z_pic;
     this.f5=elem.z_price;
     var uid=1;
     var count=1;
     var ch=1;
     //查询购物车数据库 判断商品是否已存在
  var url="http://127.0.0.1:3000/cation/stater?x_product_id="+this.f1;
  this.axios.get(url).then(result=>{
    this.lg=result.data.x_count;
    this.ld=result.data.x_id;
    if(result.data.x_product_id>0){
      //商品已存在
      this.lg++;
        //console.log(v);
      var url="http://127.0.0.1:3000/cation/upse?x_id="+this.ld+"&x_count="+this.lg;
      //console.log(url);
      this.axios.get(url).then(result=>{   
      })
      Toast.success({
        message:"添加成功",
        duration:1000
      })
       
    }else{
      //商品没有存在 插入数据
      var url="http://127.0.0.1:3000/cation/catr?x_uid="+uid+"&x_product_id="+this.f1+"&x_img_url="+this.f4+"&x_title="+this.f3+"&x_name="+this.f2+"&x_price="+this.f5+"&x_count="+count+"&x_is_checked="+ch;
        this.axios.get(url).then(result=>{ 
            if(result.data.affectedRows==1){
              Toast.success({
                message:"添加成功",
                duration:1000,   
              });
            }else{
              Toast.fail({
                message:"添加失败",
                duration:1000,
              });
            }    
        }) 
      }
   })       
  } 
 }, 
}
</script>
<style scoped>
.base_sou{
position: absolute;
 top: 9.2rem;
 left: 1.3rem;
}
.sear{
  width: 2rem;
  height: 2rem;
  border: 1px solid red;
  position: relative;
  top: 1rem;
  left: 1rem;
  z-index: 100;
}
.en_yu>span:nth-child(1){
  color: #000;
} 
.scg{
  background: #fff;
}
/* 搜索框 */
.base{
 overflow: hidden;
 overflow-y: auto;
}
.lan_shu{
  width: 100%;
  height: 4rem;
  background: #000;
}
 .lan_cty{
  position: relative;
  top: 1rem;
 }
/* 上部导航栏 */
 .su_tb{
  width: 93%;
  height: 3.3rem;
  background: #000;
  display: flex;
  justify-content: space-between;
  border-radius: 0.4rem;
  margin: 0.5rem auto 0 auto;
  position: relative;
  z-index: 10;
 }
 .hai{
  color: #fff;
  line-height: 3.5rem;
  font-size: 0.91rem;
  display: inline-block;
 }
 .su_hai{
   margin-left: 1.5rem;
 } 
 .su_imag{
  width: 1rem;
  height: 0.52rem; 
  margin-left: 0.5rem;
 }
 .su_xin{
   width: 40%;
 }
 .hove_stf{
  width: 5rem;
  background-color:#000;
  text-align: center;
  border-radius: 4px;
  position: absolute;
  top: 3.2rem;
  left: 3rem;
  transition: all .2s linear;
 }
 .hove_stf>p{
  margin: 1rem 0.3rem 0 0.7rem; 
  font-size: 0.91rem;
  color: #fff;
 }
 .ctmd{
   height:10rem;
   overflow: hidden;
   
 }
 .show{
   height: 0;
   overflow: hidden;
   
 }
 .qn_img{
  width: 0.65rem;
  height: 0.75rem;
  margin-right: 0.5rem;
 }
 .qn_you{
  width: 28%; 
 }
/* 分类 */
.en_yu{
  width: 100%;
  height: 3rem;
  border-bottom: 0.02rem solid #e2e2e2;
}
.en_yu>span{
  display: inline-block;
  font-size: 0.91rem;
  color: #999;
  margin: 1.5rem 0.2rem 0 1rem;
}
.en_ctu{
  width: 93%;
  height: 6rem;
  border-bottom: 0.02rem solid #e2e2e2;
  margin: auto;
  position: relative;
}
.en_img1{
  height: 4rem; 
  margin-top: 1rem;
}
.en_heng{
  position: absolute;
  top: 1.5rem;
  left: 5rem;
}
.en_ao{
  font-size: 0.91rem; 
   
}
.gao{
 margin-bottom: 0.6rem; 
}
.en_gao{
  font-size: 0.6rem;
  color: #a3a3a3;
}
.en_qian{
  font-size: 0.8rem;
  color: #f97a2e;
}
.en_img2{
  width: 1.2rem;
}
.en_zong{
  position: absolute;
  top: 2rem;
  right: 1.2rem;
  width: 4.5rem;
  height: 2.2rem;
  border-radius:5rem;
  background: #f3f3f3;
  text-align: center;
  line-height: 2.5rem;

} 
</style>

