<template>
<div>
  <Header />
  <main class="columns columns-1 has-background-light">
    <div class="column column-1 is-3 box">
      <Sidebar />
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
                <input v-model="profileInfo.age" class="input" type="number" placeholder="Normal input">
              </div>
            </div>
            <footer class="card-footer">
              <p class="card-footer-item">年齢を入力!</p>
            </footer>
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
                <div class="select">
                  <select v-model="profileInfo.living">
                    <option value="" disabled selected></option>
                    <option>北海道</option>
                    <option>青森県</option>
                    <option>岩手県</option>
                    <option>宮城県</option>
                    <option>秋田県</option>
                    <option>山形県</option>
                    <option>福島県</option>
                    <option>茨城県</option>
                    <option>栃木県</option>
                    <option>群馬県</option>
                    <option>埼玉県</option>
                    <option>千葉県</option>
                    <option>東京都</option>
                    <option>神奈川県</option>
                    <option>新潟県</option>
                    <option>富山県</option>
                    <option>石川県</option>
                    <option>福井県</option>
                    <option>山梨県</option>
                    <option>長野県</option>
                    <option>岐阜県</option>
                    <option>静岡県</option>
                    <option>愛知県</option>
                    <option>三重県</option>
                    <option>滋賀県</option>
                    <option>京都府</option>
                    <option>大阪府</option>
                    <option>兵庫県</option>
                    <option>奈良県</option>
                    <option>和歌山県</option>
                    <option>鳥取県</option>
                    <option>島根県</option>
                    <option>岡山県</option>
                    <option>広島県</option>
                    <option>山口県</option>
                    <option>徳島県</option>
                    <option>香川県</option>
                    <option>愛媛県</option>
                    <option>高知県</option>
                    <option>福岡県</option>
                    <option>佐賀県</option>
                    <option>長崎県</option>
                    <option>熊本県</option>
                    <option>大分県</option>
                    <option>宮崎県</option>
                    <option>鹿児島県</option>
                    <option>沖縄県</option>
                  </select>
                </div>
              </div>
            </div>
            <footer class="card-footer">
              <p class="card-footer-item">居住地を選択!</p>
            </footer>
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
                <div class="select">
                  <select v-model="profileInfo.look">
                    <option disabled selected></option>
                    <option>細め</option>
                    <option>普通</option>
                    <option>ぽっちゃり</option>
                    <option>太め</option>
                  </select>
                </div>
              </div>
            </div>
            <footer class="card-footer">
              <p class="card-footer-item">見た目を選択!</p>
            </footer>
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
                <div class="select">
                  <select v-model="profileInfo.belongs">
                    <option disabled selected></option>
                    <option>学生</option>
                    <option>会社員</option>
                    <option>フリーター</option>
                    <option>その他</option>
                  </select>
                </div>
              </div>
            </div>
            <footer class="card-footer">
              <p class="card-footer-item">所属を選択!</p>
            </footer>
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
              <div>
                <input v-model="profileInfo.height" class="input" type="number" placeholder="Normal input">
              </div>
            </div>
            <footer class="card-footer">
              <p class="card-footer-item">身長を入力!</p>
            </footer>
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
                <div class="select">
                  <select v-model="profileInfo.holiday">
                    <option disabled selected></option>
                    <option>平日</option>
                    <option>休日</option>
                    <option>不定休</option>
                  </select>
                </div>
              </div>
            </div>
            <footer class="card-footer">
              <p class="card-footer-item">休日を選択!</p>
            </footer>
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
                <div class="select">
                  <select v-model="profileInfo.smoke">
                    <option disabled selected></option>
                    <option>吸う</option>
                    <option>吸わない</option>
                  </select>
                </div>
              </div>
            </div>
            <footer class="card-footer">
              <p class="card-footer-item">煙草について選択!</p>
            </footer>
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
                <div class="select">
                  <select v-model="profileInfo.drink">
                    <option disabled selected></option>
                    <option>よく飲む</option>
                    <option>時々飲む</option>
                    <option>飲まない</option>
                  </select>
                </div>
              </div>
            </div>
            <footer class="card-footer">
              <p class="card-footer-item">お酒について選択!</p>
            </footer>
          </div>
        </div>
      </div>
    </div>
    
    <div class="column is-4 my-6">
      <div class="box">
        <header>
          <label class="label">自己紹介</label>
          <span class="icon">
            <i class="fas fa-angle-down"></i>
          </span>
        </header>
        <div class="card-content">
          <div class="content">
            <b-input v-model="profileInfo.detail" maxlength="300" type="textarea"></b-input>
          </div>
        </div>
      </div>
      <div class="box">
        <b-button expanded type="is-primary" v-on:click="updateProfile()">編集完了</b-button>
      </div>
    </div>
  </main>
</div>
</template>
<script>
import axios from "axios"
import Header from "../../Component/Header.vue";
import Sidebar from "../../Component/Sidebar.vue";

export default {
  components: {
    Header,
    Sidebar,
  },
  data() {
    return {
      profileInfo: {
        age: '',
        sex: '',
        living: '',
        height: '',
        look: '',
        belongs: '',
        holiday: '',
        smoke: '',
        drink: '',
        detail: ''
      },
    }
  },
  computed: {
    userId(){
      return this.$store.getters['auth/currentUser'].id
    }
  },
  created() {
    this.fetchProfile()
  },
  methods: {
    async fetchProfile() {
      const res = await axios.get(`/api/mypage/${this.userId}`)
      try {
        this.profileInfo.age = res.data.age
        this.profileInfo.sex = res.data.sex
        this.profileInfo.living = res.data.living
        this.profileInfo.height = res.data.height
        this.profileInfo.look = res.data.look
        this.profileInfo.belongs = res.data.belongs
        this.profileInfo.holiday = res.data.holiday
        this.profileInfo.smoke = res.data.smoke
        this.profileInfo.drink = res.data.drink
        this.profileInfo.detail = res.data.detail
      }
      catch(error) {
        alert("error")
      }
    },
    async updateProfile(){
      await axios.put(`/api/mypage/${this.userId}`,{ profile: this.profileInfo});
      try{
        alert('変更が完了しました');
        this.$router.push("/mypage/detail")
      }
      catch{
        alert('変更に失敗しました');
      }
    }
  }
}
</script>
<style scoped>
</style>