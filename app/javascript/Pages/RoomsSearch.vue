<template>
<div>
<nav>
    <div class="nav-wrapper">
        <router-link to="/" class="brand-logo">ルーム検索</router-link>
        <ul class="right hide-on-med-and-down">
            <li><router-link to="/rooms/search"><i class="medium material-icons">search</i></router-link></li>
            <li><router-link to="/rooms/create"><i class="medium material-icons">music_video</i></router-link></li>
            <li><router-link to="/message"><i class="medium material-icons">mail_outline</i></router-link></li>
            <li><router-link to="/mypage/index"><i class="medium material-icons">person_outline</i></router-link></li>
            <li><router-link to="/">Top</router-link></li>
        </ul>
    </div>
</nav>
    <div class="container">
    <form class="col">
        <div class="row">
            <div class="input-field col s12">
                <select style="display:block" v-model="query.area_eq">
                    <option value="" disabled selected>場所:選択してください</option>
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
                <select style="display:block" v-model="query.genre_eq">
                    <option value="" disabled selected>ジャンル:選択してください</option>
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
                <input id="room_artist" type="text" class="validate" v-model="query.artist_cont">
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <label for="room_date"></label>
                <input id="room_date" type="date" class="validate" v-model="query.date_eq">
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <label for="room_time"></label>
                <input id="room_time" type="time" class="validate" v-model="query.time_start">
            </div>
        </div>
        <div class="row">
            <button class="waves-effect waves-light btn-large right" v-on:click="search">検索する</button>
        </div>
    </form>
    </div>
    <div class="row center-align" v-show="searchInfoBool">
        <table>
            <thead>
                <tr>
                    <th>場所</th>
                    <th>ジャンル</th>
                    <th>アーティスト</th>
                    <th>日付</th>
                    <th></th>
                </tr>
            </thead>

            <tbody v-for="room in rooms">
                <tr>
                    <td>{{room.area}}</td>
                    <td>{{room.genre}}</td>
                    <td>{{room.artist}}</td>
                    <td>{{room.date}}</td>
                    <td><router-link :to="{ path: `/search/show/${room.id}`}" class="waves-effect waves-light btn">気になる</router-link>
                </tr>
            </tbody>
        </table>
    </div>
</div>
</template>
<script>
import axios from 'axios'
import qs from 'qs'
export default {
    data: function(){
        return{
            query: {
                area_eq: '',
                genre_eq: '',
                artist_cont: '',
                date_eq: '',
                time_start: '',
            },
            rooms: [],
            searchInfoBool: false,
            searchInfo: {},
        }
    },
    methods:{
        search(){
            axios.get('/api/search',{
                params:{
                    q: this.query
                },
                paramsSerializer: function(params) {
                    return qs.stringify(params)
                },
                responseType: 'json'
            })
            .then(res => {
                this.rooms=res.data
            });
        }
    },
}
</script>