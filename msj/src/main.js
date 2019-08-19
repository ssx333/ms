import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import vuex from 'vuex'
import 'vant/lib/index.css'
import 'vant/lib/icon/local.css'
Vue.config.productionTip = false
Vue.prototype.axios=axios
Vue.use(vuex);
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
