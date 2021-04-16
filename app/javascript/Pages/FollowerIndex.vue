<template>
<div>
    <nav>
        <div class="nav-wrapper">
            <router-link to="/" class="brand-logo">相手からのいいね</router-link>
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
        <div class="row"></div>
        <div class="row">
            <router-link to= "/message/index" class="waves-effect waves-light btn right">
                <i class="medium material-icons">email</i>メッセージ
            </router-link>
            <router-link to= "/match/index" class="waves-effect waves-light btn left">
                <i class="medium material-icons">perm_contact_calendar</i>マッチング
            </router-link>
            <div class="center">
                <router-link to= "/follower/index" class="waves-effect waves-light btn pulse">
                    <i class="medium material-icons">lightbulb_outline</i>相手から
                </router-link>
            </div>
        </div>
        <div class="row" v-for="follower in followers">
            <ul class="collection">
                <li class="collection-item avatar">
                    <img src="#" class="circle">
                    <span class="title">{{follower.name}}</span>
                    <router-link :to="{path: `/follower/show/${follower.id}`}" class="secondary-content"><i class="material-icons">location_on</i></router-link>
                </li>
            </ul>
        </div>
    </div>
</div>
</template>
<script>
import axios from 'axios'
export default {
    data: function(){
        return {
            id: this.$route.params.id,
            followers: [],
        }
    },
    created: function(){
        this.fetchFollowers();
    },
    methods: {
        fetchFollowers(){
            axios.get('/api/users/followers').then(res => {
                this.followers = res.data;
            });
        }
    }
}
</script>