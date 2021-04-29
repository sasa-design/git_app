<template>
<div>
  <nav>
    <div class="nav-wrapper">
      <router-link to="/" class="brand-logo">マイページ</router-link>
      <ul class="right hide-on-med-and-down">
        <li><router-link to="/rooms/search"><i class="medium material-icons">search</i></router-link></li>
        <li><router-link to="/rooms/create"><i class="medium material-icons">music_video</i></router-link></li>
        <li><router-link to="/message/index"><i class="medium material-icons">mail_outline</i></router-link></li>
        <li><router-link to="/mypage/index"><i class="medium material-icons">person_outline</i></router-link></li>
        <li><router-link to="/">Top</router-link></li>
      </ul>
    </div>
  </nav>
  <div class="card">
    <div class="card-image">
      <img src="">
    </div>
    <div class="card-content">
      <p>{{profileInfo.user.name}}・{{profileInfo.age}}</p>
    </div>
  </div>
  <div class="container">
    <div class="row">
      <ul class="collection with-header">
        <li class="collection-header">
          <h4 class="center">プロフィール
            <span>
              <router-link :to="{path: `/mypage/edit/${profileInfo.user.id}`}" class="btn-floating pulse">
                <i class="material-icons">add</i>
              </router-link>
            </span>
          </h4>
        </li>
        <li class="collection-item">年齢:<span class="right-align">{{profileInfo.age}}</span></li>
        <li class="collection-item">性別:<span class="right-align">{{profileInfo.sex}}</span></li>
        <li class="collection-item">居住地:<span class="right-align">{{profileInfo.living}}</span></li>
        <li class="collection-item">身長:<span class="right-align">{{profileInfo.height}}</span></li>
        <li class="collection-item">体型:<span class="right-align">{{profileInfo.look}}</span></li>
        <li class="collection-item">属性:<span class="right-align">{{profileInfo.type}}</span></li>
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
  </div>
</div>  
</template>
<script>
import axios from 'axios';
export default {  
  name: 'MypageHome',
  data: function() {
    return {
      profileInfo:{},
    }
  },
  created() {
    this.fetchProfile();
  },

  methods: {
    async fetchProfile(){
      await axios.get('/api/mypage').then(res =>{
        this.profileInfo = res.data;
      });
    },
  }
}
</script>