<template>
<div>
    <nav>
        <div class="nav-wrapper">
            <div class="col s12">
                <router-link to="/message/index" class="breadcrumb">通知一覧</router-link>
                <router-link :to="{path: `/follower/show/${id}`}" class="breadcrumb">ユーザー詳細</router-link>
            </div>
        </div>
    </nav>
    <div class="row">
    </div>
    <div class="row">
        <div class="center-align">
            <button class="waves-effect waves-light btn-large" v-on:click="likeUser()">
                <i class="material-icons right">favorite</i>いいね
            </button>
        </div>
    </div>
    <div class="container">
        <div class="center">
            <Avatar :id="this.id" />
        </div>
        <div class="row">
            <div class="col s12 center-align">
                <p>{{profileInfo.user.name}}</p>
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
                <li class="collection-item">属性:<span class="right-align">{{profileInfo.type}}</span></li>
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
            profileInfo: {},
        }
    },
    created(){
        this.fetchfollowerProfile(this.id);
    },
    methods: {
        fetchfollowerProfile(id){
            axios.get(`/api/mypage/${id}`).then(res =>{
                this.profileInfo = res.data;
            });
        },
        likeUser(){
            axios.post('/api/relationship',{follower: this.id})
            .then(res => {
                alert('マッチングしました')
            })
            .catch(error => {
                alert('すでにいいねしています')
            });
        }
    }
}
</script>