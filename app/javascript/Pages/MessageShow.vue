<template>
<div>
    <nav>
        <div class="nav-wrapper">
            <div class="brand-logo center">user.name</div>
            <div class="col s12">
                <router-link to="/message/index" class="breadcrumb">通知一覧</router-link>
                <router-link :to="{path: `/message/show/${id}`}" class="breadcrumb">メッセージ</router-link>
            </div>
        </div>
    </nav>
    <div class="row">

    </div>
    <div class="container">
        <div class="row">
            <ul class="collection col s6" v-for="message in messages">
                <li class="collection-item avatar">
                <img src="#" alt="" class="circle">
                <p>{{message.content}}</p>
                </li>
            </ul>
        </div>
        <div class="row">
            <form>
                <div class="input-field col s12">
                    <textarea id="textarea2" class="materialize-textarea" data-length="120" v-model="message.content"></textarea>
                    <label for="textarea2">メッセージ</label>
                    <button class="btn waves-effect waves-light right" v-on:click="sendMessage">送信
                        <i class="material-icons right">send</i>
                    </button>
                </div>
            </form>
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
            message: {
                receiver_id: this.$route.params.id,
                content: '',
            },
            messages: [],
        }
    },
    created() {
        this.fetchMessage(this.id);
    },
    methods: {
        fetchMessage(id){
            axios.get(`/api/messages/${id}`)
            .then(res => {
                this.messages = res.data;
            });
        }, 
        sendMessage(){
            axios.post('/api/messages',{message: this.message})
            .then(res => {
                this.$router.replace(`/message/show/${id}`)
            });
        }
    }
}
</script>
<style>
p{
    font-size: 1.5em;
}
</style>