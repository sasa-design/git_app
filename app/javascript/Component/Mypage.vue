<template>
<div class="row">
    <ul class="collection with-header">
        <li class="collection-header">
            <h4 class="center">プロフィール</h4>
        </li>
        <li class="collection-item">年齢:<span class="right-align">{{profileInfo.age}}</span></li>
        <li class="collection-item">性別:<span class="right-align">{{profileInfo.sex}}</span></li>
        <li class="collection-item">居住地:<span class="right-align">{{profileInfo.living}}</span></li>
        <li class="collection-item">身長:<span class="right-align">{{profileInfo.height}}</span></li>
        <li class="collection-item">体型:<span class="right-align">{{profileInfo.look}}</span></li>
        <li class="collection-item">属性:<span class="right-align">{{profileInfo.belongs}}</span></li>
        <li class="collection-item">休日:<span class="right-align">{{profileInfo.holiday}}</span></li>
        <li class="collection-item">煙草:<span class="right-align">{{profileInfo.smoke}}</span></li>
        <li class="collection-item">お酒:<span class="right-align">{{profileInfo.drink}}</span></li>
    </ul>
</div>
<div class="row">
    <ul class="collection with-header">
        <li class="collection-header">
            <h4 class="center">自己紹介</h4>
        </li>
        <li class="collection-item">{{profileInfo.detail}}</li>
    </ul>
</div>
</template>
<script>
import axios from 'axios'
export default {
    props: ['id'],
    data: function() {
        return {
            profileInfo: {}
        }
    },
    created() {
        this.fetchProfile(this.id);
    },
    methods: {
        async fetchProfile(id){
            await axios.get(`/api/mypage/${id}`).then(res =>{
                this.profileInfo = res.data;
            });
        },
    }
}
</script>