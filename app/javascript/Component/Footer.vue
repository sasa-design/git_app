<template>
   <div>
     <nav>
       <div class="nav-wrapper">
         <ul id="nav-mobile" class="right">
           <li><router-link to="/signup">新規登録</router-link></li>
           <li><router-link to="/signin">ログイン</router-link></li>
           <li><a v-on:click="logout">ログアウト</a></li>
         </ul>
       </div>
     </nav>
   </div>
</template>

<script>
import axios from 'axios'

  export default {
    name: 'Footer',

    methods: {
      async logout(){
        await this.$store.dispatch('auth/logout')
        .then(response =>{
          alert('ログアウトしました')
          this.$router.replace('/')
        })
        .catch(error => {
          alert('ログアウトに失敗しました')
        });
      },
    },
  }
</script>