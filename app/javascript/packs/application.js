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
import router from '../router/router.js'
import axios from 'axios'
import stylesheet from '../stylesheets/application.scss'
import Store from '../store/store.js'
import qs from 'qs'
import '@mdi/font/css/materialdesignicons.css';
import Buefy from 'buefy'
import 'buefy/dist/buefy.css'
Vue.use(Buefy);


Vue.prototype.$axios = axios
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)
Vue.use(VueRouter);


document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    axios,
    imagePath,
    images,
    store:Store,
    qs,
    stylesheet,
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
