<template>
    <div class="me">
        <!--上部 -->
        <div class="one">
            <!--如果没有登录的话 显示上面的内容-->
        <div v-if="!isLogin">
            <div class="img">
                    <img src="../../assets/me/bg.png">
            </div>
            <div class="bg">
                    <img src="../../assets/me/av.png">
                    <span class="bgs">美食网</span>
            </div>
            <div class="bgx">
            <span  @click="jumpl">请登录/注册</span>
            </div>
      </div>
       <div v-else>
            <div class="img">
                <img src="../../assets/me/bg.png">
            </div>
            <div class="bg">
                <img src="../../assets/me/default.png">
            </div>
            <div class="bgx">
            <span>{{uname}}</span>
            </div>
        </div>
        </div>
        <!--中间 -->      
        <div class="two">
               <ul class="lis1">
                 <li> 
                    <div>
                    <span>3</span>
                    <div @click="jumpto">收藏</div>
                    </div>
                </li>
                <li>
                    <div>
                    <span>0</span>
                    <div>关注</div> 
                    </div>
                </li>
                <li>
                    <div>
                    <span>0</span>
                    <div>粉丝</div>
                     </div>
                    </li>
                <li> 
                  <div>
                      <span>2</span>
                     <div @click="jumpy">优惠券</div> 
                  </div>
                </li>
            </ul>
        </div> 
        <!--下部 -->
        <div class="thr">
            <ul class="lis2">
                <li>
                    <div class="thr_z">
                        <div class="left">
                    <img src="../../assets/me/img1.png">
                    最近浏览
                    </div>
                    <img src="../../assets/me/right.png" class="right">
                    </div>
                </li>
                <li>
                    <div class="thr_z">
                        <div class="left">
                    <img src="../../assets/me/img2.png">
                    采购清单
                        </div>
                    <img src="../../assets/me/right.png" class="right">
                    </div>
                    </li>
                <li >
                    <div class="thr_z" >
                        <div class="left" >
                    <img src="../../assets/me/img3.png">
                    <span @click="jumpy">优惠券</span>
                        </div>
                    <img src="../../assets/me/right.png" class="right">
                    </div>
                </li>
                <li>
                    <div class="thr_z">
                        <div class="left">
                    <img src="../../assets/me/img4.png">
                    <span @click="jumpo">订单</span>
                        </div>
                    <img src="../../assets/me/right.png" class="right">
                    </div>
                </li>
                <li>
                    <div class="thr_z">
                        <div class="left">
                    <img src="../../assets/me/img5.png">
                    帮助中心
                        </div>
                    <img src="../../assets/me/right.png" class="right">
                    </div>
                </li>
                    <div class="thr_z">
                        <div class="btn">
                        <van-button @click="jumpout" round  size="large" type="black">退出登录</van-button>
                        </div>
                    </div>
                
            </ul>
        </div>
    </div>
</template>
<script>
import { Icon, Button,Dialog} from 'vant'
import Vue from 'vue'
Vue.use(Button).use(Icon).use(Dialog);
export default {
    data(){
        return{
           isLogin:false,
		   uname:''
        }
    },
    created(){
       let sid=window.sessionStorage.getItem('sid');
			 if(sid == 1){
				 this.isLogin = true;
			this.uname = window.sessionStorage.getItem('uname');
			 }else{
				 this.isLogin = false;
			 }

    },
    methods:{
        jumpto(){
            this.$router.push('/shoucang');
        },
       jumpy(){
           this.$router.push('/youhui');
       },
       jumpo(){
           this.$router.push('/order');
       },
       jumpl(){
           this.$router.push('/login');
       },
       jumpout(){
            let sid=window.sessionStorage.getItem('sid')
            if(!sid){
                Dialog.confirm({
               message:'请先登录'
           }).then(
              ()=>{ this.$router.push('/login')}
           ).catch(err=>{ console.log(err)})
            }else{
               Dialog.confirm({
               message:'是否要退出登录'
           }).then(
              ()=>{window.sessionStorage.removeItem('sid')
                // 第一种： location.reload() this.$router.go(0)
                this.$router.replace({
                    path:'/fclass'
                })
              }
           ).catch(err=>{ console.log(err)})
           }
        
       }
    }
}
</script>
<style scoped>
    /*上部 */
    .me{ width:100%;height:38.625rem;}
    .img{position:relative}
    img{width:100%;  height:8.78rem; }
    .bg img{
        width:4.875rem;height:4.875rem;
        position: absolute;
        /* top:5.125rem;
        left:9rem; */
        margin:-3.875rem auto 0 9rem;
        text-align:center;
        border-radius:0.6rem;
    }
    .bgs{
        position: absolute;
        /* top:5.19rem;
        left:9.5rem; */
        margin:-3.81rem auto 0 9.5rem;
        text-align:center;
        z-index:2;
        color:#fff;
        line-height:5rem;
       font-weight:500;
       font-size:1.25rem;
    }
    .bgx{
        text-align:center;
        margin-top:1.6875rem;
        font-weight:500;
    }
    /*中间*/
    /*背景*/
    .two{
        width:21.53125rem;height:4.0625rem;
        background-color: #000;
        margin:1.25rem auto 0.96875rem auto; 
        border-radius:0.5rem;
    }
    /*文字*/
    ul.lis1{
      width:100%;height:100%;
      color:#fff;
      display:flex;
      justify-content: space-around;
    }
    ul.lis1 li{
      display:flex;
      justify-content: space-around;
      flex-direction: column;
      text-align:center;
    }
    ul.lis1 li div div{
        margin-top:0.25rem;
    }
    /*下部*/
    .thr{
        width: 21.0625rem;
        display: flex;
      justify-content:space-around;
      margin:0 auto;
    }
    .thr ul li{
      width:21.0625rem;height:2.875rem;
       border-bottom: 0.05rem solid rgb(227,232,236); 
    padding:1rem 0 0 0.625rem 0; 
     line-height:2.875rem; 
    }
    .thr ul li .thr_z{
     display:flex;
    justify-content: space-between;
    color:rgb(84,88,92);
    font-weight:550;
    align-items: center;
    }
   .thr ul li .thr_z .left{
        padding-left:1rem;
    }
    .thr ul li .thr_z .left img{
        margin-right:0.25rem;
    }
    .thr img{ 
        width:0.875rem;height:0.875rem;
    }
    .thr .right{
        width:0.625rem;height:1.125rem;
    }
    .btn{
        border-bottom:0rem;
        margin:0 auto;
    }
</style>
