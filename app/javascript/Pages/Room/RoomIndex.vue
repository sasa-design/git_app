<template>
<div>
    <Header />
    <div class="tile is-ancestor">
        <div class="tile is-parent">
            <Sidebar />
        </div>
        <div class="tile is-parent is-vertical ">
            <div class="section">
                <hr>
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
            <div class="tile">
                <div class="tile is-child box section">
                    <b-table :data="rooms" :columns="columns"></b-table>
                </div>
            </div>
        </div>
    </div>
</div>
</template>
<script>
import axios from 'axios'
import qs from 'qs'
import Header from "../../Component/Header.vue";
import Sidebar from "../../Component/Sidebar.vue";
export default {
    components: {
        Header,
        Sidebar
    },
    data() {
        return {
            total: 50,
            current: 1,
            perPage: 10,
            rangeBefore: 1,
            rangeAfter: 1,
            order: 'is-centered',
            size: 'is-medium',
            isRounded: true,
            prevIcon: 'chevron-left',
            nextIcon: 'chevron-right',
            rooms: [],
            columns: [
                {
                    field: 'id',
                    label: 'ID',
                    width: '40',
                    numeric: true
                },
                {
                    field: 'area',
                    label: '場所',
                },
                {
                    field: 'genre',
                    label: 'ジャンル',
                },
                {
                    field: 'artist',
                    label: 'アーティスト',
                    centered: true
                },
                {
                    field: 'date',
                    label: '日付',
                },
                {
                    field: 'time',
                    label: '時間'
                }
            ]
        }
    },
    computed: {
        userId(){
            return this.$store.getters['auth/currentUser'].id
        }
    },
    created() {
        this.setRooms()
    },
    methods: {
        fetchRooms() {
            const url = `/api/rooms?page=${this.current}?per=${this.perPage}`;
            axios.get(url, {
                params:{
                    q: {
                        userId: this.userId
                    }
                },
                paramsSerializer(params) {
                    return qs.stringify(params)
                },
                responseType: 'json'
            })
            .then(res => {
                this.rooms = res.data.rooms;
                this.total = res.data.rooms.length
            })
        }
    }
}

</script>