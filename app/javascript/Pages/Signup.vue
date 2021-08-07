<template>
<div class="posi">
  <Header />
  <div class="main">
    <div class="tile is-acestor">
      <div class="tile is-parent is-vertical">
        <form>
          <div class="tile is-child box">
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
          
            <b-field label="Password">
              <b-input type="password"
                password-reveal
                v-model="password"
              >
              </b-input>
            </b-field>  
          </div>
          <div class="tile is-child">
            <b-button type="submit" v-on:click="signup()">新規登録</b-button>
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
        alert("登録完了");
        this.$router.push('/signin');
      } 
      catch(error) {
        alert(error)
      }
    }
  }
}
</script>
<style>

.main{
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  margin-left: auto;
  margin-right: auto;
}
</style>