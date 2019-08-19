import Vue from 'vue'
import Router from 'vue-router'
import index from './components/pages/Index.vue'
import cart from './components/pages/Cart.vue'
import fclass from './components/pages/Fclass.vue'
import me from './components/pages/Me.vue'
import footp from './components/pages/Footp.vue'
import shoucang from './components/views/me/Shoucang.vue'
import addressList from './components/views/add/addressList.vue'
import addressEdit from './components/views/add/addressEdit.vue'
import addressEdits from './components/views/add/addressEdits.vue'
import footpson from './components/views/footp/footpson.vue'
import footpson1 from './components/views/footp/footpson1.vue'
import youhui from './components/views/me/Youhui.vue'
import order from './components/views/me/Order.vue'
import login from './components/pages/Login.vue'
import Cation from './components/pages/Cation.vue'
Vue.use(Router)
export default new Router({
	mode:'history',
	routes: [
		{path: '/',redirect: '/index'},
		{path:'/index',component:index},
		{path:'/fclass',component:fclass},
		{path:'/me',name:'Me',component:me},
		{path:'/footp',component:footp},
		{path:'/cart',component:cart},
		{path:'/shoucang',component:shoucang},
		{path:'/Cation',component:Cation},
		{path:'/addressList',component:addressList},
		{path:'/addressEdit',component:addressEdit},
		{path:'/addressEdits',component:addressEdits},
		{path:'/footpson',component:footpson},
		{path:'/footpson1',component:footpson1},
		{path:'/youhui',component:youhui},
		{path:'/order',component:order},
		{path:'/login',component:login}
	 ]
})
