<template>
  <div class="icon-box" @click="changePage">
    <span v-show="!bol">
      <slot class="img-sm" name="normalImg"></slot>
    </span>
    <span v-show="bol">
      <slot class="img-sm" name="activeImg"></slot>
    </span>
    <span :class="{'fontColor':bol}" v-text="txt"></span>
  </div>
</template>
<script>
export default {
  name:"Item",
  props:{
    txt:{type:String},
    page:{type:String},
    sel:{type:String}
  },
  computed:{
    bol(){
      if(this.sel == this.page){
        return true;
      }else{
        return false;
      }
    }
  },
  methods:{
    changePage(){
      this.$router.push('/'+this.page);
      this.$emit('change',this.page)
    }
  }
}
</script>

<style>
  .icon-box{
    flex-grow: 1;
    display:flex;
    justify-content: space-around;
    align-items: center;
    flex-direction: column;
  }
  .icon-box span{
    font-size:0.68rem;
    color:#a3a3a3;
  }
  .icon-box .fontColor{
    color:#333333;
  }
</style>
