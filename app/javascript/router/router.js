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
import RoomUser from '../Pages/Room/RoomUser.vue';
import MessageIndex from '../Pages/Message/MessageIndex.vue';
import MessageShow from '../Pages/Message/MessageShow.vue';
import FollowerIndex from '../Pages/Message/FollowerIndex.vue';
import UserShow from '../Pages/Message/UserShow.vue';
import Signup from '../Pages/Signup.vue';
import Signin from '../Pages/Signin.vue';

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
      { path: '/room/search/show/:id',component: RoomSearchShow },
      { path: '/room/user/:id',component: RoomUser},
      { path: '/message/index',component: MessageIndex },
      { path: '/message/show/:id',component: MessageShow },
      { path: '/user/show/:id',component: UserShow},
      { path: '/follower/index',component: FollowerIndex},
      { path: '/signup',component: Signup },
      { path: '/signin',component: Signin }
    ],
});
export default router;
