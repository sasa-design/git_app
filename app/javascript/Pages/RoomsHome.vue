<template>
<div>
<nav>
    <div class="nav-wrapper">
      <router-link to="/rooms/index" class="left waves-effect waves-light btn-large">ルームを編集</router-link>  
      <router-link to="/" class="center brand-logo">ルーム作成</router-link>
      <ul class="right hide-on-med-and-down">
        <li><router-link to="/rooms/search"><i class="medium material-icons">search</i></router-link></li>
        <li><router-link to="/rooms/create"><i class="medium material-icons">music_video</i></router-link></li>
        <li><router-link to="/message/index"><i class="medium material-icons">mail_outline</i></router-link></li>
        <li><router-link to="/mypage/index"><i class="medium material-icons">person_outline</i></router-link></li>
        <li><router-link to="/">Top</router-link></li>
      </ul>
    </div>
</nav>
<div class="container">
    <form class="col">
        <div class="row">
            <div class="input-field col s12">
                <select style="display:block" v-model="room.area">
                    <option value="" disabled selected>場所</option>
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
        <div class="row">
            <div class="input-field col s12">
                <select style="display:block" v-model="room.genre">
                    <option value="" disabled selected>ジャンル</option>
                    <option>邦ロック</option>
                    <option>洋楽</option>
                    <option>k-pop</option>
                    <option>j-pop</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <label for="room_artist">アーティスト</label>
                <input id="room_artist" type="text" class="validate" v-model="room.artist">
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <label for="room_date"></label>
                <input id="room_date" type="date" class="validate" v-model="room.date">
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <label for="room_time"></label>
                <input id="room_time" type="time" class="validate" v-model="room.time">
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <label for="room_comment">詳細を教えて</label>
                <input id="room_comment" type="text" class="validate" v-model="room.comment">
            </div>
        </div>
        <div class="row">
            <button class="waves-effect waves-light btn-large right" v-on:click="createRoom">ルームを作成</button>
        </div>
    </form>
</div>
</div>
</template>
<script>
import axios from 'axios';
export default {
    name: "RoomsHome",
    data: function(){
        return{
            room:{
                area: '',
                genre: '',
                artist: '',
                date: '',
                time: '',
                comment: '',
            }
        }
    },
    methods: {
        createRoom: function() {
            axios.post('/api/rooms', { room: this.room }).then(res => {
                alert("登録完了");
                this.$router.replace({path: '/mypage/index'});
            })
            .catch(error  => {
                alert("登録失敗");
                console.log(error);
            });
        }
    }
}
</script>