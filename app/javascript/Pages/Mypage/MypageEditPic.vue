<template>
<div>
  <Header />
  <main class="columns has-background-light">
    <div class="column is-3 box">
      <Sidebar />
    </div>
    <div class="column is-4 my-6">
      <div class="box">
      <div class="card">
        <div class="card-image">
          <figure class="image is-4by3">
            <img src="https://bulma.io/images/placeholders/1280x960.png" alt="Placeholder image">
          </figure>
        </div>
        <div class="card-content">
          <div class="media">
            <div class="media-left">
              <figure class="image is-48x48">
                <img class="is-rounded" src="https://bulma.io/images/placeholders/96x96.png" alt="Placeholder image">
              </figure>
            </div>
            <div class="media-content">
              <p class="title is-4">{{this.userName}}</p>
            </div>
          </div>
        </div>
      </div>
      </div>
    </div>
    <div class="column is-5 my-6">
      <div class="box">
        <div class="buttons">
          <b-button type="is-primary" expanded v-on:click="imageUpdate()">Expanded</b-button>
        </div>
        <input type="file" v-on:change="setImage()">
      </div>
      <div class="box">
        <b-carousel>
          <b-carousel-item v-for="(carousel, i) in carousels" :key="i">
            <section :class="`hero is-medium is-${carousel.color}`">
              <div class="hero-body has-text-centered">
                <h1 class="title">{{carousel.text}}</h1>
              </div>
            </section>
          </b-carousel-item>
        </b-carousel>
      </div>
    </div>
  </main>
</div>
</template>
<script>
import axios from 'axios'
import Header from '../../Component/Header.vue';
import Sidebar from '../../Component/Sidebar.vue';
import PicSlide from '../../Component/PicSlide.vue';
export default {
  components: {
    Header,
    Sidebar,
    PicSlide,
  },
  data() {
    return {
      uploadedImage: '',
      imageFile: {},
      carousels: [
        { image: 'https://bulma.io/images/placeholders/256x256.png', color: 'primary' },
        { image: 'https://bulma.io/images/placeholders/256x256.png', color: 'info' },
        { image: 'Slide 3', color: 'success' },
        { image: 'Slide 4', color: 'warning' },
      ]
    }
  },
  computed: {
    userId(){
      return this.$store.getters['auth/currentUser'].id
    },
    userName(){
      return this.$store.getters['auth/currentUser'].name
    },
  },
  created() {

  },
  methods: {
    deleteDropFile() {
      this.dropFile = ""
    },
    setImage(){
            let file = event.target.files[0]
            let reader = new FileReader()
            reader.onload = () => {
                this.uploadedImage = event.target.result
                this.imageFile.image = this.uploadedImage
            }
            reader.readAsDataURL(file)
    },
    async fetchImage() {
      const res = await axios.get(`/api/users/${this.userId}`)
      try {
        this.carousels[0].image = res.data.image
        this.carousels[1].image = res.data.image
      }
      catch(error) {
        aleart("データの所得に失敗しました")
        this.$router.push("/mypage/detail")
      }
    },
    async imageUpdate() {
      const res = await axios.put(`/api/users/${this.userId}`,{imageFile: this.imageFile })
      try {
        aleart("アップロード完了")
        this.imageFile = {},
        this.uploadedImage = res.data;
        this.$router.push("/mypage/detail")
      }
      catch(error){
        aleart(error)
      }
    }
  }
}
</script>
<style>
</style>