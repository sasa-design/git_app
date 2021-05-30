<template>
<div>
    <nav>
        <div class="nav-wrapper #81d4fa light-blue lighten-3">
            <div class="brand-logo center">{{Image.name}}</div>
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
                <img v-bind:src="myImage.image" alt="" class="circle" v-if="senderUser">
                <img v-bind:src="Image.image" alt="" class="circle" v-else>
                <p>{{message.content}}</p>
                </li>
            </ul>
        </div>
        <div class="row">
            <form>
                <div class="input-field col s12">
                    <textarea id="textarea2" class="materialize-textarea" data-length="120" v-model="message.content"></textarea>
                    <label for="textarea2">メッセージ</label>
                    <button class="btn waves-effect waves-light right" v-on:click="sendMessage()">送信
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
            Image: {},
            myImage: {},
        }
    },
    computed: {
        userId(){
            return this.$store.getters['auth/currentUser'].id;
        },
        senderUser(){
            if(this.messages.sender_id = this.userId){return true}
        }
    },
    created() {
        this.fetchMessage(this.id);
        this.fetchImage(this.id);
        this.fetchmyImage();
    },
    methods: {
        fetchMessage(id){
            axios.get(`/api/messages/${id}`).then(res => {
                this.messages = res.data;
            });
        },
        fetchImage(id){
            axios.get(`/api/users/${id}`).then(res => {
                this.Image = res.data;
            })
        },
        fetchmyImage(){
            axios.get(`/api/users/${this.userId}`).then(res => {
                this.myImage = res.data;
            })
        },
        sendMessage(){
            axios.post('/api/messages',{message: this.message})
            .then(res => {
                alert('メッセージを送信しました')
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