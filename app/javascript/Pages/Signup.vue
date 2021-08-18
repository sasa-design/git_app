<template>
<div class="body">
  <Header />
  <section class="hero hero-1 is-fullheight">
    <div class="hero-body">
      <div class="is-vcentered mx-auto">
        <form>
          <div class="box">
            <b-field label="Name">
              <b-input v-model="name"></b-input>
            </b-field>

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
            <b-button type="is-success is-light" expanded v-on:click="signup()">新規登録</b-button>
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
      name: "",
      sex: "",
      email: "",
      password: "",
      error: "",
    }
  },
  methods: {
    async signup(){
      const userParams = {
        user:{
          name: this.name,
          email: this.email,
          password: this.password,
        }
      }
      try {
        const res = await axios.post("/api/users", userParams);
        alert(res.data.success);
        this.$router.push('/signin');
      } 
      catch(error) {
        alert(error.response.data.message)
      }
    }
  }
}
</script>
<style>

</style>