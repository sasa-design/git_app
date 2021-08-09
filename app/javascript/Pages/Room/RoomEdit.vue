<template>
<div>
  <Header />
  <div class="tile is-ancestor">
    <div class="tile is-parent">
      <Sidebar />
    </div>
    <div class="tile is-parent">
      <div class="tile">
        <div class="tile is-child box section"> 
          <label class="label">場所</label>
          <div class="select is-normal">
            <select v-model="roomInfo.area">
              <option disabled selected>場所</option>
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

          <label class="label">ジャンル</label>
          <div class="select is-normal">
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
    </div>
    <div class="tile is-parent is-vertical">
      <div class="tile">
        <div class="tile is-child box">
          
          <label class="label">アーティスト</label>
          <div class="control">
            <input v-model="roomInfo.artist" class="input" type="text" placeholder="Alexsandros">
          </div>

          <label class="label">日付</label>
          <div class="control">
            <input v-model="roomInfo.date" class="input" type="date">
          </div>
            
          <label class="label">時間</label>
          <div class="control">
            <input v-model="roomInfo.time" class="input" type="time">
          </div>
              
          <label class="label">詳細を入力できます！</label>
          <div class="control">
            <b-input v-model="roomInfo.comment" maxlength="140" type="textarea"></b-input>
          </div>
        </div>
      </div>
      <div class="tile">
        <div class="tile is-child box">
          <b-button type="is-success" v-on:click="roomUpdate(id)">ルーム作成</b-button>
        </div> 
      </div>
    </div>
  </div>
</div>
</template>
<script>
import axios from 'axios';
import Header from "../../Component/Header.vue";
import Sidebar from "../../Component/Sidebar.vue";
export default {
  components: {
    Header,
    Sidebar
  },
  data() {
    return {
      id: this.$route.params.id,
      roomInfo: {
        area: "",
        genre: "",
        artist: "",
        date: "",
        time: "",
        comment: "",
      },
    }
  },
  created () {
    this.fetchRoom(this.id)
  },
  methods: {
    async fetchRoom(id) {
      const res = await axios.get(`/api/rooms/${id}`)
      try {
        this.roomInfo.area = res.data.area
        this.roomInfo.genre = res.data.genre
        this.roomInfo.artist = res.data.artist
        this.roomInfo.date = res.data.date
        this.roomInfo.time = res.data.time
        this.roomInfo.comment = res.data.comment
      }
      catch(error) {
        aleart(error)
      }
    },
    async roomUpdate(id) {
      await axios.put(`/api/rooms/${id}`,{ room: this.roomInfo})
      try {
        aleart("変更完了")
        this.$router.push("/room/index")
      }
      catch(error) {
        aleart("変更に失敗しました")
      }
    }
  }
}
</script>
<style scoped>
</style>