<template>
<div>
  <nav>
   <div class="nav-wrapper #81d4fa light-blue lighten-3">
      <router-link to="/" class="brand-logo">WithOK</router-link>
    </div>
  </nav>
  <div class="home-main">
    <div class="field">
      <button class="waves-effect waves-light btn-large #fbc02d yellow darken-2" v-on:click="guestLogin">今すぐ始める！</button>
    </div>
  </div> 
</div>
</template>
<script>
import axios from 'axios'
  export default {
    data(){
      return{
        email: 'example@email.com',
        password: 'guest'
      }
    },
    methods: {
      async guestLogin(){
        const sessionParams = {
          session:{
            email:this.email,
            password: this.password
          }
        };
        await this.$store.dispatch('auth/login', sessionParams)
        .then(response =>{
          this.$router.replace('/mypage/index');
        })
        .catch(error =>{
          alert(error.response.data.error.messages);
        });
      }
    }
  }
</script>
<style scoped>
</style>