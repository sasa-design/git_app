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
                    <router-link :to="{path: `/follower/show/${follower.id}`}" class="secondary-content btn-floating btn-large pulse"><i class="material-icons">face</i></router-link>
                </li>
            </ul>
        </div>
        <div class="center">
            <ul class="pagination">
                <li class="waves-effect" v-for="Page in Pages" v-on:click="pagination(Page)"><a>{{Page}}</a></li>
            </ul>
        </div>
    </div>
</div>
</template>
<script>
import axios from 'axios';
import qs from 'qs';
import Header from '../Component/Header.vue';
export default {
    components: {
        Header  
    },
    data: function(){
        return {
            currentPages: 1,
            Pages: 4
        }
    },
    computed: {
        followers(){
            return this.$store.state.userinfo.followers
        }
    },
    created: function(){
        this.fetchFollowers();
    },
    methods: {
        async fetchFollowers(){
            await this.$store.dispatch('userinfo/fetchfollowers',{
                params:{
                    page: this.currentPages
                },
                paramsSerializer: function(params) {
                    return qs.stringify(params)
                },
            });
        },
        async pagination(id){
            this.currentPages = id
            await this.$store.dispatch('userinfo/fetchfollowers',{
                params:{
                    page: this.currentPages
                },
                paramsSerializer: function(params) {
                    return qs.stringify(params)
                },
            });
        }
    }
}
</script>