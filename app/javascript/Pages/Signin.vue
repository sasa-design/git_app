<template>
<div>
<nav>
<div class="nav-wrapper">
  <ul class="hide-on-med-and-down">
    <li><router-link to="/" class="brand-logo">WithOK</router-link></li>
  </ul>
  <ul class="right hide-on-med-and-down">
    <li><router-link to="/signup" class="sign-icon">新規登録</router-link></li>
    <li><router-link to="/mypage" class="sign-icon">ゲストログイン</router-link></li>
  </ul>
</div>
</nav>
<div class="home-main">
  <div class="field">
  <form class="col" @submit.prevent="signin">
    <div class="input-field">
      <label for="first_name">email</label>
      <input id="first_name" type="email" class="validate" required="required" v-model="email">
    </div>
    <div  class="input-field">
      <label for="first_name">password</label>
      <input id="first_name" type="password" class="validate" required="required" v-model="password">
    </div>
    <div>
      <button class="waves-effect waves-light btn-large" v-on:click="login">ログイン</button>
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