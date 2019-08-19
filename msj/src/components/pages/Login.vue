<template>
  <div class="login_cotain" ref="clientHeight">
    <div class="login_module">
      <login :istrue="isTue" @getDate="data">
          <div slot="rad" class="rad_box">
            <label for="jz">
            <input class="rad" type="checkbox" id="jz" v-model="isChange" > 
            记住密码</label>
            <span class="wjmm">忘记密码？</span>
          </div>
      </login>
    </div>
  </div>
</template>
<script>
import login from '../views/loginReg/login.vue'
export default {
  data(){
    return {
      isChange:false,
      isTue:true
    }
  },
  methods:{
    data(res){
      this.isTue = res;
    }
  },
  mounted(){
    //动态获取视口的高度设置给div 的style
    this.$refs.clientHeight.style.height = document.documentElement.clientHeight+'px';
  },
	components:{
		login
  },
  created () {
    
  }
}
</script>
<style scoped>
.login_cotain{
  width:100%;
  background:url(../../assets/login/login_bg.jpg) no-repeat center center;
}
.login_module{
  width:100%;
  height:21.65625rem;
  padding:0 1.875rem;
  position:absolute;
  top:8.28125rem;
}

</style>
