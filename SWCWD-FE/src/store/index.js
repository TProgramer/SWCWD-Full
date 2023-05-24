import Vue from "vue";
import Vuex from "vuex";
import http from "../util/http-common";
import VueCookies from "vue-cookies";
import router from "../router";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    videos: [],
    video: null,
    reviews: [],
    review: null,
    accessToken: null,
    refreshToken: null,
    loginUser: null,
    filteredVideos: [],
    category: "",
  },
  getters: {
    popularVideos: function (state) {
      return state.videos.slice(0, 5);
    },
    showVideos: function (state) {
      if (state.category == "") return state.filteredVideos;
      return state.filteredVideos.filter((e) => e.category === state.category);
    },
    videoCnt: function (state, getters) {
      return getters.showVideos.length || 0;
    },
    lastVideoId: function (state) {
      return state.videos.at(-1).id;
    },
    getToken(state) {
      console.log(state);
      let ac = VueCookies.get("accessToken");
      let rf = VueCookies.get("refreshToken");
      return {
        access: ac,
        refresh: rf,
      };
    },
  },
  mutations: {
    SET_VIDEOS: function (state, videos) {
      state.videos = videos;
      state.filteredVideos = videos;
    },
    SET_VIDEO: function (state, video) {
      state.video = video;
    },
    SET_REVIEWS: function (state, reviews) {
      state.reviews = reviews;
    },
    SET_REVIEW: function (state, review) {
      state.review = review;
    },
    SET_LOGIN_USER(state, payload) {
      VueCookies.set("accessToken", payload.accessToken, "60s");
      VueCookies.set("refreshToken", payload.refreshToken, "1h");
      state.accessToken = payload.accessToken;
      state.refreshToken = payload.refreshToken;
      state.loginUser = payload.loginUser;
    },
    refreshToken(state, payload) {
      //accessToken 재셋팅
      VueCookies.set("accessToken", payload.accessToken, "60s");
      VueCookies.set("refreshToken", payload.refreshToken, "1h");
      state.accessToken = payload;
    },
    LOGOUT(state) {
      VueCookies.remove("accessToken");
      VueCookies.remove("refreshToken");
      state.loginUser = null;
    },
    SEARCH(state, searchWord) {
      if (searchWord == "") state.filteredVideos = state.videos;
      else
        state.filteredVideos = state.videos.filter((e) =>
          e.title.includes(searchWord)
        );
    },
    GET_MORE_VIDEO(state, videos) {
      state.videos.push(...videos);
    },
    SET_CATEGORY(state, category) {
      state.category = category;
    },
  },
  actions: {
    setVideos: function ({ commit }) {
      http.get("api-video/list/page").then((res) => {
        commit("SET_VIDEOS", res.data);
      });
    },
    setVideo: function ({ commit }, id) {
      http.get(`api-video/${id}`).then((res) => {
        commit("SET_VIDEO", res.data);
      });
    },
    createUser: function ({ commit }, user) {
      console.log(commit);
      http.post("api-user/signup", user).then((res) => {
        if (res.status === 201) {
          alert("회원가입이 완료되었습니다.");
          router.push("/");
        }
      });
    },
    setReviews: function ({ commit }, id) {
      const params = { videoId: id };
      http.get("api-review/", { params }).then((res) => {
        commit("SET_REVIEWS", res.data);
      });
    },
    setReview: function ({ commit }, id) {
      http.get(`api-review/${id}`).then((res) => {
        commit("SET_REVIEW", res.data);
      });
    },
    setLoginUser: ({ commit }, user) => {
      http
        .post("api-user/login", user)
        .then((res) => {
          if (res.status == 202) {
            alert("로그인 성공!");
            commit("SET_LOGIN_USER", res.data);
            router.push("/");
          } else {
            alert("로그인 실패");
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
    logout: ({ commit }) => {
      commit("LOGOUT");
      alert("로그아웃 되었습니다.");
    },
    createReview: function ({ commit }, review) {
      console.log(commit);
      http.post("api-review/", review).then((res) => {
        if (res.status === 201) {
          alert("등록완료");
          router.push("/");
        }
      });
    },
    updateReview: function ({ commit }, review) {
      console.log(commit);
      http
        .put("api-review/", review)
        .then(() => {
          alert("수정 완료!");
          router.push("/");
        })
        .catch((err) => {
          console.log(err);
        });
    },
    deleteReview: function ({ state }, id) {
      console.log(state);
      http
        .delete(`api-review/${id}`)
        .then(() => {
          alert("삭제 완료!");
          router.push("/");
        })
        .catch((err) => {
          console.log(err);
        });
    },
    search: function ({ commit }, searchWord) {
      commit("SEARCH", searchWord);
    },
    getMoreVideo: function ({ commit, getters }) {
      return new Promise((resolve, reject) => {
        http
          .get(`api-video/list/page/`, {
            params: {
              id: getters.lastVideoId,
            },
          })
          .then((res) => {
            if (res.data.length) {
              commit("GET_MORE_VIDEO", res.data);
              resolve(true);
            } else resolve(false);
          })
          .catch((err) => {
            reject(err);
          });
      });
    },
    setCategory: function ({ commit }, category) {
      commit("SET_CATEGORY", category);
    },
    // refreshToken: ({commit}) => { // accessToken 재요청
    //   //accessToken 만료로 재발급 후 재요청시 비동기처리로는 제대로 처리가 안되서 promise로 처리함
    //   return new Promise((resolve, reject) => {
    //     axios.post('/v1/auth/certify').then(res => {
    //       commit('refreshToken', res.data.auth_info);
    //       resolve(res.data.auth_info);
    //     }).catch(err => {
    //       console.log('refreshToken error : ', err.config);
    //       reject(err.config.data);
    //     })
    //   })
    // },
    // logout: ({commit}) => { // 로그아웃
    //   commit('removeToken');
    //   location.reload();
    // }
  },
  modules: {},
});
