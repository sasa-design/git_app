<template>
<div class="body">
    <Header />
    <main class="columns columns-1">
        <div class="column column-1 is-3 box">
            <Sidebar />
        </div>
        <div class="column is-9">
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
                    @input="fetchRooms"
                    aria-next-label="Next page"
                    aria-previous-label="Previous page"
                    aria-page-label="Page"
                    aria-current-label="Current page">
                </b-pagination>
            </div>
            <div class="card">
                <div class="columns is-gapless is-multiline is-mobile">
                    <div class="column is-one-quarter"  v-for="matcher in matchers">
                        <p class="title">
                            <figure class="image is-48x48">
                                <img class="is-rounded" :src="matcher.image" alt="Placeholder image" v-on:click="pageChange(matcher.id)">
                            </figure>
                        </p>
                        <p class="subtitle">
                            {{matcher.name}}
                            <button class="button is-primary" v-on:click="toMessage(matcher.id)">
                                <span class="icon">
                                    <b-icon icon="email"></b-icon>
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
        matchers(){
            return this.$store.state.userinfo.matchers
        }
    },
    created(){
        this.fetchMatchers();
    },
    methods: {
        fetchMatchers(){
            this.$store.dispatch('userinfo/fetchmatchers',{
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
            })
            .then(res => {
                this.total = res.data.length
            });
        },
        pageChange(id){
            this.$router.push({path: `/user/show/${id}`})
        },
        toMessage(id){
            this.$router.push({path: `/message/show/${id}`})
        }
    }
}
</script>