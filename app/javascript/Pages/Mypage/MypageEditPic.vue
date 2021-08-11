<template>
<div>
  <Header />
  <div class="tile is-ancestor">
    <div class="tile is-parent">
      <Sidebar />
    </div>
    <div class="tile is-parent is-vertical">
      <div class="tile">
        <div class="tile is-child box">
        </div>
      </div>
      <div class="tile">
        <div class="tile is-parent is-vertical">
          <figure class="image is-128x128">
            <img src="https://bulma.io/images/placeholders/256x256.png">
          </figure>
        </div>
      </div>
    </div>
    <div class="tile is-parent is-vertical">
      <div class="tile"> 
        <div class="tile is-child box">
          <div class="buttons">
            <b-button type="is-primary" expanded v-on:click="imageUpdate()">Expanded</b-button>
          </div>
          <input type="file" v-on:change="setImage()">
        </div>
      </div>
      <div class="tile">
        <div class="tile is-child box">
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
    </div>
  </div>
</div>
</template>
<script>
import axios from 'axios'
import Header from '../../Component/Header.vue';
import Sidebar from '../../Component/Sidebar.vue';
export default {
  components: {
    Header,
    Sidebar
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
    }
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