import axios from 'axios';
const state = {
  currentUser: null
};  

const getters = {
  currentUser(state){
    return state.currentUser
  }
};

const mutations = {
  SET_CURRENT_USER: (state, user) => {
    state.currentUser =  user;
    localStorage.setItem('currentUser', JSON.stringify(user));
    axios.defaults.headers.common['Authorization'] = `Bearer ${user.token}`;
  },
  CLEAR_CURRENT_USER: () => {
    state.currentUser = null;
    localStorage.removeItem('currentUser');
    location.reload();
  }
};

const actions = {
  async login({ commit }, sessionParams) {
    const res = await axios.post('/api/sessions', sessionParams);
    const user = res.data;
    commit('SET_CURRENT_USER', user);
  },
  logout({ commit }) {
    commit('CLEAR_CURRENT_USER');
  },
};

export default {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};