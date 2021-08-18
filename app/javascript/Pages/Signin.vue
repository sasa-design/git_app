<template>
<div class="body">
  <Header />
  <section class="hero hero-1 is-fullheight">
    <div class="hero-body">
      <div class="is-vcentered mx-auto">
        <form>
          <div class="box">
            
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
          <div>
            <b-button class="has-text-white has-back has-background-success"  expanded v-on:click="login()">ログイン</b-button>
          </div>
        </form>
      </div>
    </div>
  </section>
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
        alert(error.response.data.error.messages);
      }
    }
  }
}
</script>
<style>

</style>