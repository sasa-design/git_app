import axios from 'axios';
const state = {
    followers: [],
    matchers: []
};

const mutations = {
    SET_FOLLOWERS_INFO: (state,info) => {
        state.followers = info
    },
    SET_MATCHERS_INFO: (state,info) => {
        state.matchers = info
    }
};

const actions = {
    async fetchfollowers({ commit },infoParams) {
        const res = await axios('/api/users/followers',infoParams);
        commit('SET_FOLLOWERS_INFO',res.data);
    },
    async fetchmatchers({ commit },infoParams) {
        const res = await axios('/api/users/matchers',infoParams);
        commit('SET_MATCHERS_INFO',res.data);
    }
};

export default {
    namespaced: true,
    state,
    mutations,
    actions
}