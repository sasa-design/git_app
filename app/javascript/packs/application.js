// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require('@rails/ujs').start();
require('@rails/activestorage').start();
require('channels');

import Vue from 'vue'
import App from '../app.vue'
import VueRouter from 'vue-router'
import router from '../router/router'
import stylesheet from '../stylesheets/application.scss'
import js from 'materialize-css/dist/js/materialize.min.js'
import Store from '../store/store.js'
import icon from 'material-design-icons/iconfont/material-icons.css'
import qs from 'qs'


Vue.use(VueRouter);

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    store:Store,
    qs,
    js,
    stylesheet,
    icon,
    router,
    created() {
      const userString = localStorage.getItem('currentUser');
      if (userString) {
        const userData = JSON.parse(userString);
        this.$store.commit('auth/SET_CURRENT_USER', userData);
      }
    },
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})
