<template>
  <div id="app">
    <router-view/>
    <Footer/>
  </div>
</template>

<script>
import router from './router/router.js';
import Footer from './Component/Footer.vue'
export default {
  name: 'App',
  components: {
    Footer
  },
}
</script>

<style scoped>

</style>
