<template>
<div>
  <Header />
  <main class="columns has-background-light">
    <div class="column is-3 box">
      <Sidebar />
    </div>
    <div class="column is-4 my-6">
      <div class="box py-6">
        <PicSlide />
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
          <footer class="card-footer">
              <router-link to="/mypage/edit/pro" class="card-footer-item">Edit</router-link>
          </footer>
        </section>
      </div>
    </div>
    <div class="column is-5 my-6">
      <div class="tile is-ancestor">
        <div class="tile is-parent is-vertical">
          <div class="tile is-child card">
            <header>
              <label class="label">年齢</label>
              <span class="icon">
                <i class="fas fa-angle-down"></i>
              </span>
            </header>
            <div class="card-content">
              <div class="content">
                {{profileInfo.age}}
              </div>
            </div>
            <footer>
              <p>何歳？</p>
            </footer>
          </div>
          <div class="tile is-child card">
            <header>
              <label class="label">居住地</label>
              <span class="icon">
                <i class="fas fa-angle-down"></i>
              </span>
            </header>
            <div class="card-content">
              <div class="content">
                {{profileInfo.living}}
              </div>
            </div>
            <footer>
              <p>どこに住んでる？</p>
            </footer>
          </div>
          <div class="tile is-child card">
            <header>
              <label class="label">見た目</label>
              <span class="icon">
                <i class="fas fa-angle-down"></i>
              </span>
            </header>
            <div class="card-content">
              <div class="content">
                {{profileInfo.look}}
              </div>
            </div>
            <footer>
              <p>どんな見た目？</p>
            </footer>
          </div>
          <div class="tile is-child card">
            <header>
              <label class="label">所属</label>
              <span class="icon">
                <i class="fas fa-angle-down"></i>
              </span>
            </header>
            <div class="card-content">
              <div class="content">
                {{profileInfo.belongs}}
              </div>
            </div>
            <footer>
              <p>どの属性？</p>
            </footer>
          </div>
        </div>
        <div class="tile is-parent is-vertical">
          <div class="tile is-child card">
            <header>
              <label class="label">身長</label>
              <span class="icon">
                <i class="fas fa-angle-down"></i>
              </span>
            </header>
            <div class="card-content">
              <div class="content">
                {{profileInfo.height}}
              </div>
            </div>
            <footer>
              <p>身長は何ｃｍ？</p>
            </footer>
          </div>
          <div class="tile is-child card">
            <header>
              <label class="label">休日</label>
              <span class="icon">
                <i class="fas fa-angle-down"></i>
              </span>
            </header>
            <div class="card-content">
              <div class="content">
                {{profileInfo.holiday}}
              </div>
            </div>
            <footer>
              <p>休日はいつ？</p>
            </footer>
          </div>
          <div class="tile is-child card">
            <header>
              <label class="label">煙草</label>
              <span class="icon">
                <i class="fas fa-angle-down"></i>
              </span>
            </header>
            <div class="card-content">
              <div class="content">
                {{profileInfo.smoke}}
              </div>
            </div>
            <footer>
              <p>煙草は吸う？</p>
            </footer>
          </div>
          <div class="tile is-child card">
            <header>
              <label class="label">お酒</label>
              <span class="icon">
                <i class="fas fa-angle-down"></i>
              </span>
            </header>
            <div class="card-content">
              <div class="content">
                {{profileInfo.drink}}
              </div>
            </div>
            <footer>
              <p>お酒はどのくらい飲む？</p>
            </footer>
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
      profileInfo: {},
      firstDetail: "",
      secondDetail: "",
      detailBool: false
    }
  },
  computed: {
    userId(){
      return this.$store.getters['auth/currentUser'].id
    }
  },
  created() {
    this.fetchProfile();
  },
  methods: {
    async fetchProfile() {
      const res = await axios.get(`/api/mypage/${this.userId}`)
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
    }
  }
}
</script>