<template>
<div>
    <Header />
    <main class="columns columns-1">
        <div class="column column-1 is-3 box">
            <Sidebar />
        </div>
        <div class="column">
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
                    @input="fetchFollowers"
                    aria-next-label="Next page"
                    aria-previous-label="Previous page"
                    aria-page-label="Page"
                    aria-current-label="Current page">
                </b-pagination>
            </div>
            <div class="card">
                <div class="columns is-gapless is-multiline is-mobile">
                    <div class="column is-one-quarter"  v-for="follower in followers">
                        <p class="title" v-on:click="pageChange(follower.id)">
                            <figure class="image is-48x48">
                                <img class="is-rounded" :src="follower.image" alt="Placeholder image">
                            </figure>
                        </p>
                        <p class="subtitle">
                            {{follower.name}}
                            <button class="button is-primary" v-on:click="likeUser(follower.id)">
                                <span class="icon">
                                    <b-icon icon="heart"></b-icon>
                                </span>
                            </button>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
</template>
<script>
import axios from "axios";
import qs from "qs";
import Header from "../../Component/Header.vue";
import Sidebar from "../../Component/Sidebar.vue";
import PicSlide from "../../Component/PicSlide.vue";
export default {
    components: {
        Header,
        Sidebar,
        PicSlide,
    },
    data() {
        return {
            total: "",
            current: 1,
            perPage: 8,
            rangeBefore: 1,
            rangeAfter: 1,
            order: 'is-centered',
            size: 'is-medium',
            isRounded: true,
            prevIcon: 'chevron-left',
            nextIcon: 'chevron-right',
        }
    },
    computed: {
        userId(){
            return this.$store.getters['auth/currentUser'].id
        },
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
                    q: {
                        userId: this.userId,
                        page: this.current,
                        per: this.perPage
                    }
                },
                paramsSerializer: function(params) {
                    return qs.stringify(params)
                },
                responseType: 'json'
            });
        },
        async likeUser(id) {
            try{
                const res = await axios.post('/api/relationship',{
                    relationship:{
                        follower: id,
                        userId: this.userId 
                    }
                })
                alert("マッチングしました！")
                this.$router.push({path: '/message/index'})
            }
            catch(error){
                alert(error.response.data)
            }
        }
    }
}
</script>