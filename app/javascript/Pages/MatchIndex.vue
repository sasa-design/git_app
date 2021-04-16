<template>
<div>
    <nav>
        <div class="nav-wrapper">
            <router-link to="/" class="brand-logo">マッチング一覧</router-link>
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
            <router-link to= "/match/index" class="waves-effect waves-light btn pulse left">
                <i class="medium material-icons">perm_contact_calendar</i>マッチング
            </router-link>
            <div class="center">
                <router-link to="/follower/index" class="waves-effect waves-light btn">
                    <i class="medium material-icons">lightbulb_outline</i>相手から
                </router-link>
            </div>
        </div>
        <div class="row" v-for="matcher in matchers">
            <ul class="collection">
                <li class="collection-item avatar">
                    <img src="#" class="circle">
                    <span class="title">{{matcher.name}}</span>
                    <router-link :to="{path: `/match/show/${matcher.id}`}" class="secondary-content"><i class="material-icons">location_on</i></router-link>
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
            matchers: [],
        }
    },
    created(){
        this.fetchMatchers();
    },
    methods: {
        fetchMatchers(){
            axios.get('/api/users/matchers').then(res => {
                this.matchers = res.data;
            });
        }
    }
}
</script>