import Vue from 'vue';
import Vuex from 'vuex';
import auth from './modules/auth.js';
import userinfo from './modules/userinfo.js'
Vue.use(Vuex);

const store = new Vuex.Store({
  modules: {
    auth,
    userinfo
  }
});

export default store; 