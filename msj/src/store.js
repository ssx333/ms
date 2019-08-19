import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    //全局搜索请求数据库的结果放在这里
    searchData:[],
    //储存传入详情页的数据结果
    cativle:{},
    cart:[]
  },
  mutations: {
    //写入操作必须经过mutations
    setSearchData(state,value){
      state.searchData = value;
    },
    //传入详情页的数据
    increment(state,row){
      state.cativle=row;
    },
    add:(state,value)=>{
      // 添加
      state.cart.push(value)
    
    },
    delete:(state)=>{
      // 移除
      state.cart.splice(0) 
    }

  },
  actions: {

  },
  getters:{
    //获取searchData的值
    searchData(state){
      return state.searchData;
    },
    //获取cativle的数值
    cativle(state){
      return state.cativle;
    },
    cart:(state)=>{
      return state.cart;
    }
  }
})
