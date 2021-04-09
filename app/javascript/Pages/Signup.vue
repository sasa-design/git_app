<template>
<div>
<nav>
<div class="nav-wrapper">
  <ul class="hide-on-med-and-down">
    <li>
      <router-link to="/" class="brand-logo">WithOK</router-link>
    </li>
  </ul>
</div>
</nav>
<div class="home-main">
    <div class="field">
      <form class="col">
        <div class="text-red" v-if="error">{{ error }}</div>
          <div class="input-field">
            <label for="name">name</label>
            <input id="name" type="text" class="validate" v-model="name" required="required">
          </div>
          <div class="input-field">
            <label for="email_name">email</label>
            <input id="email_name" type="email" class="validate" v-model="email" required="required">
          </div>
          <div class="input-field">
            <label for="password_name">password</label>
            <input id="password_name" type="password" class="validate" v-model="password" required="required">
          </div>
          <div>
            <button type="submit" class="waves-effect waves-light btn-large" v-on:click="signup">新規登録</button>
          </div>
      </form>
    </div>
</div>
</div>
</template>

<script>
import axios from 'axios'
import router from'../router/router.js';
  export default {
    name: 'Signup',
    data() {
      return {
        name: '',
        email: '',
        password: '',
        error: ''
      }
    },
    methods: {
      async signup() {
        await axios.post('/api/users', {user:{ name: this.name, email: this.email, password: this.password }})
        .then(response =>{
          alert='登録が完了しました'
          this.$router.replace('/login');
        })
        .catch(error => {
          alert(err.response.data.error.messages);
        });
      },
    }
  }
</script>