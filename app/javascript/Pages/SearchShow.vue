<template>
<div>
    <nav>
        <div class="nav-wrapper #81d4fa light-blue lighten-3">
            <div class="col s12">
                <router-link to="/rooms/search" class="breadcrumb">ルーム検索</router-link>
                <router-link to="/" class="breadcrumb">ルーム詳細</router-link>
            </div>
        </div>
    </nav>
    <div class="row">
    </div>
    <div class="row">
        <div class="center-align">
            <button class="waves-effect waves-light btn-large" v-on:click="likeRoom()">
                <i class="material-icons right">favorite</i>いいね
            </button>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <ul class="collection with-header">
                <li class="collection-header">
                    <h4 class="center">ルーム詳細</h4>
                </li>
                <li class="collection-item">ユーザー名:<span class="right-align">{{roomInfo.user.name}}</span></li>
                <li class="collection-item">場所:<span class="right-align">{{roomInfo.area}}</span></li>
                <li class="collection-item">ジャンル:<span class="right-align">{{roomInfo.genre}}</span></li>
                <li class="collection-item">アーティスト:<span class="right-align">{{roomInfo.artist}}</span></li>
                <li class="collection-item">日付:<span class="right-align">{{roomInfo.date}}</span></li>
                <li class="collection-item">時間:<span class="right-align">{{roomInfo.time}}</span></li>
            </ul>
        </div>
        <div class="row">
            <ul class="collection with-header">
                <li class="collection-header">
                    <h4 class="center">コメント</h4>
                </li>
                <li class="collection-item">{{roomInfo.comment}}</li>
            </ul>
        </div>
        <div class="row">
            <div class="center">
                <button class="waves-effect waves-light btn-large" v-on:click="getUser(roomInfo.user.id)">
                    <i class="material-icons right">person_pin</i>このユーザの詳細を見る
                </button>
            </div>
        </div>
    </div>
    <div class="container" v-show="profileInfoBool">
        <div class="center">
            <Avatar :id="this.roomInfo.user.id" />
        </div>
        <div class="row">
            <div class="col s12 center-align">
                <p>{{roomInfo.user.name}}</p>
            </div>
        </div>
        <div class="row">
            <ul class="collection with-header">
                <li class="collection-header">
                    <h4 class="center">プロフィール</h4>
                </li>
                <li class="collection-item">年齢:<span class="right-align">{{profileInfo.age}}</span></li>
                <li class="collection-item">性別:<span class="right-align">{{profileInfo.sex}}</span></li>
                <li class="collection-item">居住地:<span class="right-align">{{profileInfo.living}}</span></li>
                <li class="collection-item">身長:<span class="right-align">{{profileInfo.height}}</span></li>
                <li class="collection-item">体型:<span class="right-align">{{profileInfo.look}}</span></li>
                <li class="collection-item">属性:<span class="right-align">{{profileInfo.belongs}}</span></li>
                <li class="collection-item">休日:<span class="right-align">{{profileInfo.holiday}}</span></li>
                <li class="collection-item">煙草:<span class="right-align">{{profileInfo.smoke}}</span></li>
                <li class="collection-item">お酒:<span class="right-align">{{profileInfo.drink}}</span></li>
            </ul>
        </div>
        <div class="row">
            <ul class="collection with-header">
                <li class="collection-header">
                    <h4 class="center">自己紹介</h4>
                </li>
                <li class="collection-item">{{profileInfo.detail}}</li>
            </ul>
        </div>
    </div>
</div>
</template>
<script>
import axios from 'axios'
import Avatar from '../Component/Avatar.vue'
export default {
    components: {
        Avatar
    },
    data: function(){
        return {
            id: this.$route.params.id,
            roomInfo: {},
            profileInfo: {},
            profileInfoBool: false,
        }
    },
    created: function(){
        this.fetchRoom(this.id);
    },
    methods: {
        fetchRoom(id){
            axios.get(`/api/rooms/${id}`).then(res => {
                this.roomInfo = res.data;
            });
        },
        getUser(id){
            axios.get(`/api/mypage/${id}`).then(res => {
                this.profileInfo = res.data;
                this.profileInfoBool = true;
            });
        },
        likeRoom(){
            axios.post('/api/relationship',{follower: this.roomInfo.user.id})
            .then(res => {
                alert('いいね完了')
            })
            .catch(error => {
                alert('自分にいいねはできません')
            });
        },
    }
    
}
</script>