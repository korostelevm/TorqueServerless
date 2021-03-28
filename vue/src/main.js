import Vue from 'vue'
import App from './App.vue'
import './components/_globals'
Vue.use(vueCustomElement);

// const Home = { template: '<div>This is Home</div>' }
// const Foo = { template: '<div>This is Foo</div>' }
// const Bar = { template: '<div>This is Bar {{ $route.params.id }}</div>' }


Vue.prototype.$api = '/api'

Vue.prototype.$dispatch = function(channel, o) {
  window.dispatchEvent(new CustomEvent(`express-lambda-ui:${channel}`, {
    detail: o, 
  }));
}

Vue.mixin({
  methods: {
    get_auth_header: function() {
      try{
        var user = JSON.parse(sessionStorage.getItem('user'))
        return user.id_token
      }catch(e){
        console.warn(e)
        return null
      }
    },
  }
})


Vue.config.productionTip = false
Vue.customElement('express-lambda-ui', App);
