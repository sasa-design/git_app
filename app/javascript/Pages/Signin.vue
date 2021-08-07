<template>
<div class="background">
  <Header />
  <div class="main">
    <div class="tile is-acestor">
      <div class="tile is-parent is-vertical">
        <form>
          <div class="tile is-child box">
            
            <b-field label="メールアドレス">
              <b-input type="email"
                placeholder="watashi@email.com"
                maxlength="30"
                v-model="email"  
              >
              </b-input>
            </b-field>
          
            <b-field label="パスワード">
              <b-input type="password"
                password-reveal
                v-model="password"
              >
              </b-input>
            </b-field>  
          </div>
          <div class="tile is-child">
            <b-button type="submit" v-on:click="login()">ログイン</b-button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
</template>
<script>
import Header from '../Component/Header.vue';
import axios from 'axios';
export default {
  components: {
    Header
  },
  data(){
    return {
      email: "",
      password: "",
      error: "",
    }
  },
  methods: {
    async login() {
      const sessionParams = {
        session: {
          email: this.email,
          password: this.password
        }
      }
      try{
        await this.$store.dispatch("auth/login", sessionParams)
        alert("ログインに成功しました")
        this.$router.push("/mypage/detail");
      } catch(error){
        alert(error);
      }
    }
  }
}
</script>
<style>
.background {
  Width: 100%;
}
</style>