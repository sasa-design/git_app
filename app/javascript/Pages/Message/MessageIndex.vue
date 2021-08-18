<template>
<div>
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
            <div class="card" v-for="matcher in matchers">
                <div class="card-content">
                    <div class="content">
                        <img :src="matcher.image">
                        <p>{{matcher.name}}</p>
                    </div>
                </div>
                <footer class="card-footer">
                    <router-link :to="{path: `/message/show`}" class="card-footer-item is-primary"><b-icon icon="email"></b-icon></router-link>
                    <router-link :to="{path: `/user/show/${matcher.id}`}" class="card-footer-item is-primary">ユーザー詳細</router-link>
                </footer>
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
            perPage: 9,
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
    created: function(){
        this.fetchMatchers();
    },
    methods: {
        async fetchMatchers(){
            await this.$store.dispatch('userinfo/fetchmatchers',{
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
    }
}
</script>