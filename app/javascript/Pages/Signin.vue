<template>
<div>
<nav>
<div class="nav-wrapper #81d4fa light-blue lighten-3">
  <ul class="hide-on-med-and-down">
    <li>
      <router-link to="/" class="brand-logo">WithOK</router-link>
    </li>
  </ul>
  <ul class="right hide-on-med-and-down">
    <li><router-link to="/" class="sign-icon">Top</router-link></li>
  </ul>
</div>
</nav>
<div class="home-main">
  <div class="field">
  <form class="col" @submit.prevent="login">
    <div class="input-field">
      <label for="first_name">email</label>
      <input id="first_name" type="email" class="validate" required="required" style="color:white" v-model="email">
    </div>
    <div  class="input-field">
      <label for="first_name">password</label>
      <input id="first_name" type="password" class="validate" required="required" style="color:white" v-model="password">
    </div>
    <div>
      <button class="waves-effect waves-light btn-large #fbc02d yellow darken-2" type="submit">ログイン</button>
    </div>
  </form>
  </div>
</div>
</div>
</template>
<script>

export default {
  name: 'Signin',
  data(){
    return{
      email: '',
      password: '',
    }
  },
  methods: {
    async login() {
      const sessionParams = {
        session: {
          email: this.email,
          password: this.password
        }
      };
      await this.$store.dispatch('auth/login', sessionParams)
      .then(response =>{
        this.$router.replace('/mypage/index');
      })
      .catch(error => {
        alert(error.response.data.error.messages);
      });
    },
  },
}
</script>