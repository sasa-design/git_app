<template>
<div>
    <nav>
        <div class="nav-wrapper">
            <div class="col s12">
                <router-link to="/rooms/create" class="breadcrumb">ルーム作成</router-link>
                <router-link to="/rooms/index" class="breadcrumb">ルーム一覧</router-link>
            </div>
            <ul class="right hide-on-med-and-down">
                <li><router-link to="/search"><i class="medium material-icons">search</i></router-link></li>
                <li><router-link to="/rooms/create"><i class="medium material-icons">music_video</i></router-link></li>
                <li><router-link to="/message"><i class="medium material-icons">mail_outline</i></router-link></li>
                <li><router-link to="/mypage"><i class="medium material-icons">person_outline</i></router-link></li>
                <li><router-link to="/">Top</router-link></li>
            </ul>
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <div class="col s5 m5" v-for="room in rooms">
                <div class="card blue-grey darken-1">
                    <div class="card-content white-text">
                        <span class="card-title" v-on:click="setRoomInfo(room.id)"><button class="waves-effect waves-light btn">編集をしにいく</button></span>
                        <p>場所: {{room.area}}</p>
                        <p>日付: {{room.date}}</p>
                    </div>
                    <div class="card-action" v-show="roomInfoBool">
                        <router-link :to="{ path: `/edit/${roomInfo.id}` }" class="waves-effect waves-light btn">編集する</router-link>
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
            axios.get('/api/rooms').then((res) => {
                for(var i=0; i < res.data.rooms.length; i++){
                    this.rooms.push(res.data.rooms[i]);
                }
            },(error) => {
                alert("表示できません");
                console.log(error);
            });
        },
        setRoomInfo(id){
            axios.get(`/api/rooms/${id}`).then(res => {
                this.roomInfo = res.data;
                this.roomInfoBool = true;
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