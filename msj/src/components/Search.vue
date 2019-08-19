<template>
  <div class="search">
      <van-icon @click="searchBtn" class="icon_img" name="search" />
      <input placeholder="输入商品名称" type="text" v-model="context">
  </div>
</template>
<script>
	import { Icon } from 'vant'
	import Vue from 'vue'
	Vue.use(Icon);
	export default {
		data(){
			return {
				context:'',
				pt:[],
			}
		},
		methods:{
			searchBtn(){
				//搜索功能实现
				let url = 'http://127.0.0.1:3000/search/search?';
				this.axios.get(url,{params:{'text':this.context}}).then(res=>{	
					this.pt=res.data;	
					this.$emit("seat",this.pt);		 
					this.$store.commit('setSearchData',res.data);
					//获取vuex数据仓库的数据
					//console.log(this.$store.getters.searchData);
					if(this.$store.getters.searchData.length>0){
						  this.$router.push('/cation');
					}else{
						return
					}

				}).catch(err=>{
					console.log(err);
				})
			}
		}
	}
</script>
<style scoped>
.search .icon_img{
  display:block;
  width:2.1875rem;
  height:2rem;
	background:#fff;
	padding-left:1.0625rem;
	object-fit:cotain;
	border-top-left-radius: 0.3rem;
	border-bottom-left-radius: 0.3rem;
	line-height: 2rem;
	font-size:1.2rem;
}
.search input{
  width:20.125rem;
  height:100%;
  outline: none;
  border: none;
  border-top-right-radius: 0.3rem;
  border-bottom-right-radius: 0.3rem;
  color:#999;
  font-size:0.7rem;
  background-color: #fff; 
}
input::-webkit-input-placeholder{
  color:#999;
}
.search{
  width:100%;
	height:2rem;
  padding:0 0.625rem;
	display:flex;
	justify-content: space-between;
	flex-flow: row nowrap;
}
</style>
