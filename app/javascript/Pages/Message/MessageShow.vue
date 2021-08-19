<template>
<div class="body">
    <Header />
    <main class="columns columns-1">
        <div class="column column-1 is-3 box">
            <Sidebar />
        </div>
        
        <div class="column is-6">
            <div class="section">
                <b-pagination
                    :total="total"
                    v-model="current"
                    :range-before="rangeBefore"
                    :range-after="rangeAfter"
                    :order="order"
                    :size="size"
                    :rounded="isRounded"
                    :per-page="perPage"
                    :icon-prev="prevIcon"
                    :icon-next="nextIcon"
                    @input="fetchMessages"
                    aria-next-label="Next page"
                    aria-previous-label="Previous page"
                    aria-page-label="Page"
                    aria-current-label="Current page">
                </b-pagination>
            </div>
            <div class="card" v-for="message in messages">
                <article class="media">
                    <figure class="media-left">
                        <p class="image is-64x64">
                            <img v-bind:src="myImage.image" alt="Placeholder image" class="is-rounded" v-if="message.user.id === userId">
                            <img v-bind:src="Image.image" alt="Placeholder image" class="is-rounded" v-else>
                        </p>
                    </figure>
                    <div class="media-content">
                        <div class="content">
                            <p>{{message.content}}</p>
                        </div>
                    </div>
                </article>
            </div>
        </div>
        <div class="column is-3 my-6">
            <div class="box">
                <header>
                    <label class="label">メッセージ</label>
                </header>
                <div class="card-content">
                    <div class="content">
                        <b-input  maxlength="200" type="textarea" v-model="message.content"></b-input>
                    </div>
                </div>
            </div>
            <div>
                <b-button type="is-primary" expanded v-on:click="sendMessage(id)">送信</b-button>
            </div>
        </div>
    </main>
</div>
</template>
<script>
import axios from 'axios';
import qs from 'qs';
import Header from "../../Component/Header.vue";
import Sidebar from "../../Component/Sidebar.vue";
export default {
     components: {
        Header,
        Sidebar,
    },
    data(){
        return {
            id: this.$route.params.id,
            total: "",
            current: 1,
            perPage: 10,
            rangeBefore: 1,
            rangeAfter: 1,
            order: 'is-centered',
            size: 'is-small',
            isRounded: true,
            prevIcon: 'chevron-left',
            nextIcon: 'chevron-right',
            message: {
                receiver_id: this.$route.params.id,
                content: '',
            },
            messages: [],
            Image: "",
            myImage: "",
        }
    },
    computed: {
        userId(){
            return this.$store.getters['auth/currentUser'].id;
        },
    },
    created () {
        this.fetchMessages(this.id);
        this.fetchImage(this.id);
        this.fetchmyImage();
    },
    methods: {
        async fetchMessages(id){
            const res = await axios.get(`/api/messages/${id}`,{
                params:{
                    q:{
                        userId: this.userId,
                        page: this.current,
                        per: this.perPage
                    }
                },
                paramsSerializer: function(params) {
                    return qs.stringify(params)
                },
                responseType: 'json'
            })
            this.messages = res.data
            this.total = res.data.length
        },
        async fetchImage(id){
            const res = await axios.get(`/api/users/${id}`)
            this.Image = res.data;
              
        },
        async fetchmyImage(){
            const res = await axios.get(`/api/users/${this.userId}`)
            this.myImage = res.data;
        },
        async sendMessage(id){
            try{
                await axios.post('/api/messages',{
                    message: {
                        sender_id: this.userId,
                        receiver_id: this.message.receiver_id,
                        content: this.message.content,
                        user_id: this.userId
                    }
                })
                alert('メッセージを送信しました')
                this.$router.push({path: "/message/index"})
            }
            catch(error){
                alert(error.response.data.message.errors)
            }
        }
    }
    
}
</script>