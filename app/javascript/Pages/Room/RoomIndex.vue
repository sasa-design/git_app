<template>
<div>
    <Header />
    <main class="columns has-background-light">
        <div class="column is-3 box">
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
            <div class="box section">
                
                <b-tabs>
                    <b-tab-item label="ルーム一覧">
                        <b-table
                            :data="rooms"
                            :columns="columns"
                            :selected.sync="selected"
                            focusable>
                        </b-table>
                    </b-tab-item>

                    <b-tab-item label="選択中">
                        <article class="message is-primary">
                            <div class="message-header">
                                <router-link :to="{ path: `/room/edit/${selected.id}`}" class="button is-primary">このルームを編集する</router-link>
                            </div>
                        <div class="message-body">
                            <label class="label">コメント</label>
                            <div class="box">
                                {{selected.comment}}
                            </div>
                        </div>
                        </article>
                    </b-tab-item>
                </b-tabs>
                
            </div>
        </div>
    </main>
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
            total: "",
            current: 1,
            perPage: 10,
            rangeBefore: 1,
            rangeAfter: 1,
            order: 'is-centered',
            size: 'is-medium',
            isRounded: true,
            prevIcon: 'chevron-left',
            nextIcon: 'chevron-right',
            selected: "",
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
        this.fetchRooms()
    },
    methods: {
        fetchRooms() {
            axios.get("/api/rooms", {
                params:{
                    q: {
                        userId: this.userId,
                        page: this.current,
                        per: this.perPage
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