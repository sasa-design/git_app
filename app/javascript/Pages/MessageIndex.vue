<template>
<div>
    <Header logo="メッセージ一覧" />
    <div class="container">
        <div class="row"></div>
        <div class="row">
            <router-link to= "/message/index" class="waves-effect waves-light btn pulse right">
                <i class="medium material-icons">email</i>メッセージ
            </router-link>
            <router-link to= "/match/index" class="waves-effect waves-light btn left">
                <i class="medium material-icons">perm_contact_calendar</i>マッチング
            </router-link>
            <div class="center">
                <router-link to= "/follower/index" class="waves-effect waves-light btn">
                    <i class="medium material-icons">lightbulb_outline</i>相手から
                </router-link>
            </div>
        </div>
        <div class="row" v-for="matcher in matchers">
            <ul class="collection">
                <li class="collection-item avatar">
                    <img v-bind:src="matcher.image" class="circle">
                    <span class="title">{{matcher.name}}</span>
                    <router-link :to="{path: `/message/show/${matcher.id}`}" class="secondary-content btn-floating btn-large pulse"><i class="material-icons">email</i></router-link>
                </li>
            </ul>
        </div>
    </div>
</div>
</template>
<script>
import axios from 'axios'
import Header from '../Component/Header.vue'
export default {
    components: {
        Header
    },
    data: function(){
        return {
            matchers: []  
        }
    },
    created () {
        this.fetchMatchers();
    },
    methods: {
        async fetchMatchers(){
            const res = await axios.get('/api/users/matchers');
            this.matchers = res.data;
        }
    }

}
</script>