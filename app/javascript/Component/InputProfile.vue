<template>
<div class="tile is-parent">
      <div class="tile">
        <div class="tile is-child box section"> 

          <label class="label">居住地</label>
          <div class="select is-normal">
            <select v-model="profileInfo.living">
                <option value="" disabled selected>居住地・選択してください</option>
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

          <label class="label">見た目</label>
          <div class="select is-normal">
            <select v-model="profileInfo.look">
                <option disabled selected>体型・選択してください</option>
                <option>細め</option>
                <option>普通</option>
                <option>ぽっちゃり</option>
                <option>太め</option>
            </select>
          </div>

          <label class="label">所属</label>
          <div class="select is-normal">
            <select v-model="profileInfo.belongs">
                <option disabled selected>属性・選択してください</option>
                <option>学生</option>
                <option>会社員</option>
                <option>フリーター</option>
                <option>その他</option>
            </select>
          </div>

          <label class="label">休日</label>
          <div class="select is-normal">
            <select v-model="profileInfo.holiday">
                <option disabled selected>休日・選択してください</option>
                <option>平日</option>
                <option>休日</option>
                <option>不定休</option>
            </select>
          </div>

          <label class="label">煙草</label>
          <div class="select is-normal">
            <select v-model="profileInfo.smoke">
                <option disabled selected>煙草・選択してください</option>
                <option>吸う</option>
                <option>非喫煙者の前では吸わない</option>
                <option>吸わない</option>
            </select>
          </div>

          <label class="label">お酒</label>
          <div class="select is-normal">
            <select v-model="profileInfo.drink">
                <option disabled selected>お酒・選択してください</option>
                <option>よく飲む</option>
                <option>時々飲む</option>
                <option>あまり飲まない</option>
                <option>飲まない</option>
            </select>
          </div>

        </div>
      </div>
    </div>
    <div class="tile is-parent is-vertical">
      <div class="tile">
        <div class="tile is-child box">
          
          <label class="label">年齢</label>
          <div class="control">
            <input v-model="profileInfo.age" class="input" type="number" placeholder="Normal input">
          </div>
          
          <label class="label">身長</label>
          <div class="control">
            <input v-model="profileInfo.height" class="input" type="number" placeholder="Normal input">
          </div>
          

          <label class="label">自己紹介</label>
          <div class="control">
            <b-input v-model="profileInfo.detail" maxlength="300" type="textarea"></b-input>
          </div>
          
        </div>
      </div>
      <div class="tile">
        <div class="tile is-child box">
            <b-button type="is-success" v-on:click="updateProfile()">編集完了</b-button>
        </div> 
      </div>
    </div>
</template>
<script>
export default {
  data() {
      return {
          profileInfo: {
              id: '',
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
  created () {
    this.setProfile()
  },
  methods: {
    async setProfile() {
      const res = await axios.get("/api/mypage")
      try {
        this.profileInfo.id = res.data.id
        this.profileInfo.age = res.data.age
        this.profileInfo.sex = res.data.sex
        this.profileInfo.living = res.data.living
        this.profileInfo.height = res.data.height
        this.profileInfo.look = res.data.look
        this.profileInfo.belongs = res.data.belongs
        this.profileInfo.holiday = res.data.holiday
        this.profileInfo.smoke = res.data.smoke
        this.profileInfo.drink = res.data.drink
        this.profileInfo.detail = res.data.drink
      }
      catch(error) {
        aleart("error")
      }
    }
    async updateProfile(){
      await axios.put(`/api/mypage/${userId}`,{ profile: this.profileInfo})
      try{
      alert('変更が完了しました');
        this.$router.push("/mypage/detail")
      }
      catch{
        alert('変更に失敗しました');
        console.log(error);
      }
    } 
  }
}
</script>