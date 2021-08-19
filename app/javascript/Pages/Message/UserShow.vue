<template>
<div class="body">
  <Header />
  <main class="columns columns-1">
    <div class="column column-1 is-3 box">
      <Sidebar />
    </div>
    <div class="column is-4 my-6">
      <div class="box py-6">
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
                <p class="title is-4">{{this.profileInfo.user.name}}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="box">
        <section>
          <div class="card-content">
            <div class="content">
              <h3>
                自己紹介
              </h3>
              <p>
                {{firstDetail}} <br/>
              </p>
            </div>
          </div>
          <b-collapse v-show="detailBool" :open="false" position="is-bottom" aria-id="contentIdForA11y1">
            <template #trigger="props">
              <a aria-controls="contentIdForA11y1">
                  <b-icon :icon="!props.open ? 'menu-down' : 'menu-up'"></b-icon>
                  {{ !props.open ? 'All options' : 'Fewer options' }}
              </a>
            </template>
            <p>
              {{secondDetail}} <br/> 
            </p>
          </b-collapse>
        </section>
      </div>
      <div class="box">
        <button class="button is-primary expanded" v-on:click="toMessage(id)">メッセージを作成しにいく</button>
      </div>
    </div>
    <div class="column is-5 my-6">
      <div class="tile is-ancestor">
        <div class="tile is-parent is-vertical">
          <div class="tile is-child card">
            <header class="card-header">
              <p class="card-header-title">年齢</p>
              <button class="card-header-icon" aria-label="more options">
                <span class="icon">
                  <b-icon icon="account-clock"></b-icon>
                </span>
              </button>
            </header>
            <div class="card-content">
              <div class="content">
                {{profileInfo.age}}
              </div>
            </div>
          </div>
          <div class="tile is-child card">
            <header class="card-header">
              <p class="card-header-title">居住地</p>
              <button class="card-header-icon" aria-label="more options">
                <span class="icon">
                  <b-icon icon="map-marker"></b-icon>
                </span>
              </button>
            </header>
            <div class="card-content">
              <div class="content">
                {{profileInfo.living}}
              </div>
            </div>
          </div>
          <div class="tile is-child card">
            <header class="card-header">
              <p class="card-header-title">見た目</p>
              <button class="card-header-icon" aria-label="more options">
                <span class="icon">
                  <b-icon icon="account-cowboy-hat"></b-icon>
                </span>
              </button>
            </header>
            <div class="card-content">
              <div class="content">
                {{profileInfo.look}}
              </div>
            </div>
          </div>
          <div class="tile is-child card">
            <header class="card-header">
              <p class="card-header-title">所属</p>
              <button class="card-header-icon" aria-label="more options">
                <span class="icon">
                  <b-icon icon="account-tie"></b-icon>
                </span>
              </button>
            </header>
            <div class="card-content">
              <div class="content">
                {{profileInfo.belongs}}
              </div>
            </div>
          </div>
        </div>
        <div class="tile is-parent is-vertical">
          <div class="tile is-child card">
            <header class="card-header">
              <p class="card-header-title">身長</p>
              <button class="card-header-icon" aria-label="more options">
                <span class="icon">
                  <b-icon icon="human-male-height"></b-icon>
                </span>
              </button>
            </header>
            <div class="card-content">
              <div class="content">
                {{profileInfo.height}}
              </div>
            </div>
          </div>
          <div class="tile is-child card">
            <header class="card-header">
              <p class="card-header-title">休日</p>
              <button class="card-header-icon" aria-label="more options">
                <span class="icon">
                  <b-icon icon="baguette"></b-icon>
                </span>
              </button>
            </header>
            <div class="card-content">
              <div class="content">
                {{profileInfo.holiday}}
              </div>
            </div>
          </div>
          <div class="tile is-child card">
            <header class="card-header">
              <p class="card-header-title">煙草</p>
              <button class="card-header-icon" aria-label="more options">
                <span class="icon">
                  <b-icon icon="smoking"></b-icon>
                </span>
              </button>
            </header>
            <div class="card-content">
              <div class="content">
                {{profileInfo.smoke}}
              </div>
            </div>
          </div>
          <div class="tile is-child card">
            <header class="card-header">
              <p class="card-header-title">お酒</p>
              <button class="card-header-icon" aria-label="more options">
                <span class="icon">
                  <b-icon icon="glass-wine"></b-icon>
                </span>
              </button>
            </header>
            <div class="card-content">
              <div class="content">
                {{profileInfo.drink}}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
</div>
</template>
<script>
import axios from "axios";
import Header from "../../Component/Header.vue";
import Sidebar from "../../Component/Sidebar.vue";
import PicSlide from "../../Component/PicSlide.vue";
export default {
  components: {
    Header,
    Sidebar,
    PicSlide,
  },
  data() {
    return {
      id: this.$route.params.id,
      profileInfo: {},
      firstDetail: "",
      secondDetail: "",
      detailBool: false
    }
  },
  created() {
    this.fetchProfile(this.id);
  },
  methods: {
    async fetchProfile(id) {
      const res = await axios.get(`/api/mypage/${id}`)
      try {
        this.profileInfo = res.data;
        this.firstDetail = res.data.detail.substr( 0, 100 );
        this.secondDetail = res.data.detail.substr( 101, 300 );
        if(res.data.detail.length > 100) {
          this.detailBool = true
        }
      } catch (error) {
        aleart("error")
      }
    },
    toMessage(id){
      this.$router.push({path: `/message/show/${id}`})
    }
  }
}
</script>