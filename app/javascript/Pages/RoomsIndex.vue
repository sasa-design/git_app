<template>
<div>
    <nav>
        <div class="nav-wrapper">
            <div class="col s12">
                <router-link to="/rooms/create" class="breadcrumb">ルーム作成</router-link>
                <router-link to="/rooms/index" class="breadcrumb">ルーム一覧</router-link>
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <div class="col s5 m5" v-for="room in rooms">
                <div class="card blue-grey darken-1">
                    <div class="card-content white-text">
                        <p>場所: {{room.area}}</p>
                        <p>日付: {{room.date}}</p>
                    </div>
                    <div class="card-action">
                        <router-link :to="{ path: `/edit/${room.id}` }" class="waves-effect waves-light btn">編集する</router-link>
                        <button class="right waves-effect waves-light btn" v-on:click="deleteRoom(room.id)">削除する</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</template>
<script>
import axios from'axios'
export default {
    name: 'RoomsIndex',
    data: function() {
        return {
            roomInfo: {},
            roomInfoBool: false,
            rooms: [],
        }
    },
    mounted: function() {
　　　　 this.fetchRooms();
    },
    methods: {
        fetchRooms(){
            axios.get('/api/rooms').then(res => {
                this.rooms = res.data;
            })
            .catch(error => {
                alert("表示できません");
                console.log(error);
            });
        },
        deleteRoom(id){
            axios.delete(`/api/rooms/${id}`).then(res =>{
                alert("削除しました");
                this.fetchRooms();
                this.rooms = [];
                this.room.roomInfoBool = false;
                this.roomInfo = '';
            });
        },
    }
}
</script>