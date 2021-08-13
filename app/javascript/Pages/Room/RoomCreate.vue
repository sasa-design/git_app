<template>
<div>
  <main class="columns has-background-light">
    <div class="column is-3 box">
      <Sidebar />
    </div>
    <div class="column is-9 my-6">
      <div class="tile is-ancestor">
        <div class="tile is-parent is-vertical">
          <div class="tile is-child card">
            <header>
              <label class="label">場所</label>
              <span class="icon">
                <i class="fas fa-angle-down"></i>
              </span>
            </header>
            <div class="card-content">
              <div class="content">
                <div class="select">
                  <select v-model="roomInfo.area">
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
            <footer>
              <p>場所を選択!</p>
            </footer>
          </div>
          <div class="tile is-child card">
            <header>
              <label class="label">ジャンル</label>
              <span class="icon">
                <i class="fas fa-angle-down"></i>
              </span>
            </header>
            <div class="card-content">
              <div class="content">
                <div class="select">
                  <select v-model="roomInfo.genre">
                    <option disabled selected>ジャンル</option>
                    <option>邦ロック</option>
                    <option>洋楽</option>
                    <option>k-pop</option>
                    <option>j-pop</option>
                  </select>
                </div>
              </div>
            </div>
            <footer>
              <p>ジャンルを選択!</p>
            </footer>
          </div>
          <div class="box">
            <header>
              <label class="label">自己紹介</label>
              <span class="icon">
                <i class="fas fa-angle-down"></i>
              </span>
            </header>
            <div class="card-content">
              <div class="content">
                <b-input v-model="roomInfo.comment" maxlength="140" type="textarea"></b-input>
              </div>
            </div>
          </div>
        </div>

        <div class="tile is-parent is-vertical">
          <div class="tile is-child card">
            <header>
              <label class="label">アーティスト</label>
              <span class="icon">
                <i class="fas fa-angle-down"></i>
              </span>
            </header>
            <div class="card-content">
              <div class="content">
                <input v-model="roomInfo.artist" class="input" type="text" placeholder="Normal input">
              </div>
            </div>
            <footer>
              <p>アーティストを入力!</p>
            </footer>
          </div>

          <div class="tile is-child card">
            <header>
              <label class="label">日付</label>
              <span class="icon">
                <i class="fas fa-angle-down"></i>
              </span>
            </header>
            <div class="card-content">
              <div class="content">
                <input v-model="roomInfo.date" class="input" type="date">
              </div>
            </div>
            <footer>
              <p>日付を選択!</p>
            </footer>
          </div>

          <div class="tile is-child card">
            <header>
              <label class="label">時間</label>
              <span class="icon">
                <i class="fas fa-angle-down"></i>
              </span>
            </header>
            <div class="card-content">
              <div class="content">
                <input v-model="roomInfo.time" class="input" type="time">
              </div>
            </div>
            <footer>
              <p>時間を選択!</p>
            </footer>
          </div>

          <div class="tile is-child box">
              <b-button type="is-success" v-on:click="roomCreate()">ルーム作成</b-button>
          </div> 
        </div>
      </div>
    </div>
  </main>
</div>
</template>
<script>
import axios from 'axios'
import Header from "../../Component/Header.vue";
import Sidebar from "../../Component/Sidebar.vue";
export default {
  components: {
    Header,
    Sidebar,
  },
  data() {
    return {
      roomInfo: {
        area: "",
        genre: "",
        artist: "",
        date: "",
        time: "",
        comment: "",
        user_id: "",
      },
    }
  },
  computed: {
    userId(){
      return this.$store.getters['auth/currentUser'].id
    }
  },
  methods: {
    async roomCreate() {
      this.roomInfo.user_id = this.userId
      await axios.post('/api/rooms', { room: this.roomInfo })
      try {
        alert("登録完了");
        this.$router.push({path: '/mypage/detail'});
      }
      catch(error) {
        alert("登録失敗");
        console.log(error);
      }
    }
  }
}
</script>
<style scoped>
</style>