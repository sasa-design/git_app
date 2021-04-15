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
            <router-link :to="{path: `/message/index/${id}`}" class="waves-effect waves-light btn right">
                <i class="medium material-icons">email</i>メッセージ
            </router-link>
            <router-link :to="{path: `/match/index/${id}`}" class="waves-effect waves-light btn pulse left">
                <i class="medium material-icons">perm_contact_calendar</i>マッチング
            </router-link>
            <div class="center">
                <router-link :to="{path: `/follower/index/${id}`}" class="waves-effect waves-light btn">
                    <i class="medium material-icons">lightbulb_outline</i>相手から
                </router-link>
            </div>
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
            matches: [],
        }
    },
    created: function(){
        this.fetchMatches
    },
    methods: {
        fetchMatches(){
            axios.get(`/api/relationship`).then(res => {
                this.matches = res.data;
            });
        }
    }
}
</script>