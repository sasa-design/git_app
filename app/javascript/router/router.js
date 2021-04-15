import Vue from 'vue';
import Router from 'vue-router';
Vue.use(Router);
import Home from '../Pages/Home.vue';
import Signin from '../Pages/Signin.vue';
import Signup from '../Pages/Signup.vue';
import RoomsHome from '../Pages/RoomsHome.vue';
import MypageHome from '../Pages/MypageHome.vue';
import MypageEdit from '../Pages/MypageEdit.vue';
import RoomsIndex from '../Pages/RoomsIndex.vue';
import RoomsEdit from '../Pages/RoomsEdit.vue';
import RoomsSearch from '../Pages/RoomsSearch.vue';
import SearchShow from '../Pages/SearchShow.vue';
import MessageIndex from '../Pages/MessageIndex.vue';
import MatchIndex from '../Pages/MatchIndex.vue';
import FollowerIndex from '../Pages/FollowerIndex.vue';

const router  = new Router({
    routes: [
      { path: '/',component: Home},
      { path: '/signin',component: Signin},
      { path: '/signup',component: Signup},
      { path: '/rooms/create' ,component: RoomsHome},
      { path: '/rooms/index',component: RoomsIndex},
      { path: '/rooms/search',component: RoomsSearch},
      { path: '/search/show/:id',component: SearchShow},
      { path: '/edit/:id',component: RoomsEdit},
      { path: '/mypage/index',component: MypageHome},
      { path: '/mypage/edit',component: MypageEdit},
      { path: '/message/index/:id',component: MessageIndex},
      { path: '/match/index/:id',component: MatchIndex},
      { path: '/follower/index/:id',component: FollowerIndex},
    ],
});
export default router;
