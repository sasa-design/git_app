<template>
<div>
    <Header />
    <main class="columns has-background-light">
        <div class="column is-3 box">
            <Sidebar />
        </div>
        <div class="column is-4 my-6">
            <div class="box">
                <b-message title="Info" type="is-info" has-icon aria-close-label="Close message">
                    お互いにいいねをするとメッセージができるようになります！！
                </b-message>
                <button class="button is-primary" v-on:click="likeUser()">
                    <span class="icon">
                        <b-icon icon="heart"></b-icon>
                    </span>
                </button>
            </div>
            <div class="box">
                <header class="card-header">
                    <p class="card-header-title">コメント</p>
                    <button class="card-header-icon" aria-label="more options">
                        <span class="icon">
                        <b-icon icon="comment"></b-icon>
                        </span>
                    </button>
                </header>
                <div class="card-content">
                    <div class="content">
                        <b-input v-model="roomInfo.comment" maxlength="140" type="textarea"></b-input>
                    </div>
                </div>
            </div>        
        </div>
        <div class="column is-5 my-6">
            <div class="tile is-ancestor">
                <div class="tile is-parent is-vertical">
                    <div class="tile is-child card">
                        <header class="card-header">
                            <p class="card-header-title">場所</p>
                            <button class="card-header-icon" aria-label="more options">
                                <span class="icon">
                                    <b-icon icon="map-marker"></b-icon>
                                </span>
                            </button>
                        </header>
                        <div class="card-content">
                            <div class="content">
                                {{roomInfo.area}}
                            </div>
                        </div>
                        <footer class="card-footer">
                            <p class="card-footer-item">どこで？</p>
                        </footer>
                    </div>
                    <div class="tile is-child card">
                        <header class="card-header">
                            <p class="card-header-title">ジャンル</p>
                            <button class="card-header-icon" aria-label="more options">
                                <span class="icon">
                                    <b-icon icon="credit-card"></b-icon>
                                </span>
                            </button>
                        </header>
                        <div class="card-content">
                            <div class="content">
                                {{roomInfo.genre}}
                            </div>
                        </div>
                        <footer class="card-footer">
                            <p class="card-footer-item">どのジャンル？</p>
                        </footer>
                    </div>
                    <div class="tile is-child card">
                        <header class="card-header">
                            <p class="card-header-title">時間</p>
                            <button class="card-header-icon" aria-label="more options">
                                <span class="icon">
                                    <b-icon icon="av-timer"></b-icon>
                                </span>
                            </button>
                        </header>
                        <div class="card-content">
                            <div class="content">
                                {{roomInfo.time}}
                            </div>
                        </div>
                        <footer class="card-footer">
                            <p class="card-footer-item">時間帯は？</p>
                        </footer>
                    </div>
                </div>
                <div class="tile is-parent is-vertical">
                    <div class="tile is-child card">
                        <header class="card-header">
                            <p class="card-header-title">アーティスト</p>
                            <button class="card-header-icon" aria-label="more options">
                                <span class="icon">
                                    <b-icon icon="microphone"></b-icon>
                                </span>
                            </button>
                        </header>
                        <div class="card-content">
                            <div class="content">
                                {{roomInfo.artist}}
                            </div>
                        </div>
                        <footer class="card-footer">
                            <p class="card-footer-item">アーティスト名は？</p>
                        </footer>
                    </div>
                    <div class="tile is-child card">
                        <header class="card-header">
                            <p class="card-header-title">日付</p>
                            <button class="card-header-icon" aria-label="more options">
                                <span class="icon">
                                    <b-icon icon="calendar-range"></b-icon>
                                </span>
                            </button>
                        </header>
                        <div class="card-content">
                            <div class="content">
                                {{roomInfo.date}}
                            </div>
                        </div>
                        <footer class="card-footer">
                            <p class="card-footer-item">いつ？</p>
                        </footer>
                    </div>
                    <div class="tile is-child box">
                        <b-button tag="router-link" :to="{path: `/room/user/${roomInfo.user.id}`}" expanded type="is-primary">プロフィール詳細へ</b-button>
                    </div>
                </div>  
            </div>
        </div>
    </main>
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
      roomInfo: {},
      firstDetail: "",
      secondDetail: "",
      detailBool: false,
    }
  },
  created () {
    this.fetchRoom(this.id)
  },
  computed: {
    userId(){
        return this.$store.getters['auth/currentUser'].id
    }  
  },
  methods: {
    async fetchRoom(id) {
      const res = await axios.get(`/api/rooms/${id}`)
      try {
        this.roomInfo = res.data
        this.firstDetail = res.data.comment.substr( 0, 80 )
        this.secondDetail = res.data.comment.substr( 81, 140)
      }
      catch(error) {
        aleart("error")
      }
    },
    async likeUser() {
        try{
            const res = await axios.post('/api/relationship',{
                relationship:{
                    follower: this.roomInfo.user.id,
                    userId: this.userId 
                }
            })
            alert("いいねが完了しました")
            this.$router.push({path: '/mypage/detail'})
        }
        catch(error){
            alert(error.response.data)
        }
    }
  }

}
</script>
  