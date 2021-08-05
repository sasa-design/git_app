import Vue from 'vue';
import Router from 'vue-router';
Vue.use(Router);
import Home from '../Pages/Home.vue';
import MypageDetail from '../Pages/Mypage/MypageDetail.vue';
import MypageEditPic from '../Pages/Mypage/MypageEditPic.vue';
import MypageEditPro from '../Pages/Mypage/MypageEditPro.vue';
import RoomCreate from '../Pages/Room/RoomCreate.vue';
import RoomIndex from '../Pages/Room/RoomIndex.vue';
import RoomEdit from '../Pages/Room/RoomEdit.vue';
import RoomSearch from '../Pages/Room/RoomSearch.vue';
import RoomSearchShow from '../Pages/Room/RoomSearchShow.vue';
import MessageIndex from '../Pages/Message/MessageIndex.vue';
import MessageShow from '../Pages/Message/MessageShow.vue';
import MatchingIndex from '../Pages/Message/MatchingIndex.vue';
import MatchingShow from '../Pages/Message/MatchingShow.vue';
import FollowerIndex from '../Pages/Message/FollowerIndex.vue';
import FollowerShow from '../Pages/Message/FollowerShow.vue';

const router  = new Router({
    routes: [
      { path: '/',component: Home },
      { path: '/mypage/detail',component: MypageDetail },
      { path: '/mypage/edit/pic',component: MypageEditPic },
      { path: '/mypage/edit/pro',component: MypageEditPro },
      { path: '/room/create',component: RoomCreate },
      { path: '/room/index',component: RoomIndex },
      { path: '/room/edit/:id',component: RoomEdit },
      { path: '/room/search',component: RoomSearch },
      { path: '/room/search/show',component: RoomSearchShow },
      { path: '/message/index',component: MessageIndex },
      { path: '/message/show',component: MessageShow },
      { path: '/matching/index',component: MatchingIndex },
      { path: '/matching/show',component: MatchingShow },
      { path: '/follower/index',component: FollowerIndex},
      { path: '/follower/show',component: FollowerShow },     
    ],
});
export default router;
