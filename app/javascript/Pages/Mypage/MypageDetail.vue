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
          <PicSlide />
        </div>
      </div>
      <div class="tile">
        <div class="tile is-child box">
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
    </div>
    <div class="tile is-parent">
      <div class="tile">
        <div class="tile is-chile box">

          <label class="label">居住地</label>
          <div class="control">
            <input class="input" readonly>{{profileInfo.living}}</input>
          </div>

          <label class="label">身長</label>
          <div class="control">
            <input class="input" readonly>{{profileInfo.height}}</input>
          </div>

          <label class="label">見た目</label>
          <div class="control">
            <input class="input" readonly>{{profileInfo.look}}</input>
          </div>

          <label class="label">所属</label>
          <div class="control">
            <input class="input" readonly>{{profileInfo.belongs}}</input>
          </div>

          <label class="label">休日</label>
          <div class="control">
            <input class="input" readonly>{{profileInfo.holiday}}</input>
          </div>

          <label class="label">煙草</label>
          <div class="control">
            <input class="input" readonly>{{profileInfo.living}}</input>
          </div>

          <label class="label">飲酒</label>
          <div class="control">
            <input class="input" readonly>{{profileInfo.drink}}</input>
          </div>
        </div>
      </div>
    </div>
  </div>
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