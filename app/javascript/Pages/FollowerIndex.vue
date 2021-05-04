<template>
<div>
    <Header logo="相手からのいいね" />
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
                    <img v-bind:src="follower.image" class="circle">
                    <span class="title">{{follower.name}}</span>
                    <router-link :to="{path: `/follower/show/${follower.id}`}" class="secondary-content"><i class="material-icons">location_on</i></router-link>
                </li>
            </ul>
        </div>
    </div>
</div>
</template>
<script>
import axios from 'axios';
import Header from '../Component/Header.vue';
export default {
    components: {
        Header  
    },
    data: function(){
        return {
            followers: [],
        }
    },
    created: function(){
        this.fetchFollowers();
    },
    methods: {
        async fetchFollowers(){
            await axios.get('/api/users/followers').then(res => {
                this.followers = res.data;
            });
        },
    }
}
</script>