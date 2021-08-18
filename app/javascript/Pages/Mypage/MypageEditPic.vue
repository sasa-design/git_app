<template>
<div class="body">
  <Header />
  <main class="columns columns-1 has-background-light">
    <div class="column column-1 is-3 box">
      <Sidebar />
    </div>
    <div class="column is-4 my-6">
      <div class="box">
        <div class="card">
          <div class="card-image">
            <figure class="image is-4by3">
              <img :src="header_image" alt="Placeholder image">
            </figure>
          </div>
          <div class="card-content">
            <div class="media">
              <div class="media-left">
                <figure class="image is-48x48">
                  <img class="is-rounded" :src="rounded_image" alt="Placeholder image">
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
          <b-button type="is-primary" expanded v-on:click="imageUpdate()">Upload</b-button>
        </div>
        <div class="file has-name is-boxed">
          <label class="file-label">
            <input class="file-input" v-on:change="setImage()" type="file" name="resume">
            <span class="file-cta">
              <span class="file-icon">
                <i class="fas fa-upload"></i>
              </span>
              <span class="file-label">
                Choose a file…
              </span>
            </span>
            <span class="file-name">
              {{uploadedImage}}
            </span>
          </label>
        </div>
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
      header_image: "https://bulma.io/images/placeholders/1280x960.png",
      rounded_image: "https://bulma.io/images/placeholders/96x96.png"
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
    this.fetchImage();
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
      this.header_image = res.data.image
      this.rounded_image = res.data.image
    },
    async imageUpdate() {
      try {
        const res = await axios.put(`/api/users/${this.userId}`,{imageFile: this.imageFile })
        alert("アップロード完了")
        this.imageFile = {},
        this.uploadedImage = "";
        this.fetchImage();
      }
      catch{
        alert("アップロードに失敗しました")
      }
    }
  }
}
</script>
<style>
</style>