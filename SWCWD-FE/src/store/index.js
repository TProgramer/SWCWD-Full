import Vue from 'vue';
import Vuex from 'vuex';
import http from '../util/http-common';
import VueCookies from 'vue-cookies';
import router from '../router';
import createPersistedState from 'vuex-persistedstate';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    videos: [],
    video: null,
    reviews: [],
    review: null,
    accessToken: null,
    refreshToken: null,
    loginId: null,
    loginUser: null,
    regDate: null,
    calendarLog: [],
    askGPTLog: null,
    filteredVideos: [],
    category: '',
  },
  getters: {
    popularVideos: function (state) {
      return state.videos.slice(0, 5);
    },
    showVideos: function (state) {
      if (state.category == '') return state.filteredVideos;
      return state.filteredVideos.filter((e) => e.category === state.category);
    },
    lastVideoId: function (state) {
      return state.videos.at(-1).id;
    },
    getToken(state) {
      console.log(state);
      let ac = VueCookies.get('accessToken');
      let rf = VueCookies.get('refreshToken');
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
      VueCookies.set('accessToken', payload.accessToken, '60s');
      VueCookies.set('refreshToken', payload.refreshToken, '1h');
      state.accessToken = payload.accessToken;
      state.refreshToken = payload.refreshToken;
      state.loginId = payload.id;
      state.loginUser = payload.loginUser;
      state.regDate = payload.regDate;
    },
    refreshToken(state, payload) {
      //accessToken 재셋팅
      VueCookies.set('accessToken', payload.accessToken, '60s');
      VueCookies.set('refreshToken', payload.refreshToken, '1h');
      state.accessToken = payload;
    },
    LOGOUT(state) {
      VueCookies.remove('accessToken');
      VueCookies.remove('refreshToken');
      state.loginId = null;
      state.loginUser = null;
      state.regDate = null;
      state.calendarLog = [];
      state.calendarLog = [];
      state.askGPTLog = null;
    },
    GET_CALENDAR_LOG(state, payload) {
      state.calendarLog = payload;
    },
    ASK_GPT(state, payload) {
      state.askGPTLog = payload;
    },
    SEARCH(state, searchWord) {
      if (searchWord == '') state.filteredVideos = state.videos;
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
      http.get('api-video/list/page').then((res) => {
        commit('SET_VIDEOS', res.data);
      });
    },
    setVideo: function ({ commit }, id) {
      http.get(`api-video/${id}`).then((res) => {
        commit('SET_VIDEO', res.data);
      });
    },
    createUser: function ({ commit }, user) {
      console.log(commit);
      http.post('api-user/signup', user).then((res) => {
        if (res.status === 201) {
          alert('회원가입이 완료되었습니다.');
          router.push('/login');
        }
      });
    },
    setReviews: function ({ commit }, id) {
      const params = { videoId: id };
      http.get('api-review/', { params }).then((res) => {
        commit('SET_REVIEWS', res.data);
      });
    },
    setReview: function ({ commit }, id) {
      http.get(`api-review/${id}`).then((res) => {
        commit('SET_REVIEW', res.data);
      });
    },
    setLoginUser: ({ commit }, user) => {
      http
        .post('api-user/login', user)
        .then((res) => {
          if (res.status == 202) {
            alert('로그인 성공!');
            commit('SET_LOGIN_USER', res.data);
            router.push('/');
          } else {
            alert('로그인 실패');
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
    logout: ({ commit }) => {
      commit('LOGOUT');
      alert('로그아웃 되었습니다.');
      router.push('/login');
    },
    createReview: function ({ commit, dispatch }, review) {
      console.log(commit);
      http.post('api-review/', review).then((res) => {
        if (res.status === 201) {
          alert('등록완료');
          dispatch('setReviews', review.videoId);
        }
      });
    },
    updateReview: function ({ commit }, review) {
      console.log(commit);
      http
        .put('api-review/', review)
        .then(() => {
          alert('수정 완료!');
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
          alert('삭제 완료!');
          router.push('/');
        })
        .catch((err) => {
          console.log(err);
        });
    },
    search: function ({ commit }, searchWord) {
      commit('SEARCH', searchWord);
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
              commit('GET_MORE_VIDEO', res.data);
              resolve(true);
            } else resolve(false);
          })
          .catch((err) => {
            reject(err);
          });
      });
    },
    setCategory: function ({ commit }, category) {
      commit('SET_CATEGORY', category);
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
    // },
    getCalendarLog: function ({ commit }, id) {
      const params = { loginId: id };
      http
        .get('api-mypage/', { params })
        .then((res) => {
          if (res.status == 200) {
            commit('GET_CALENDAR_LOG', res.data);
          } else {
            alert('정보를 불러오는데 실패했습니다.');
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
    setCalendarLog: function ({ state }, log) {
      http
        .post('api-mypage/', log)
        .then((res) => {
          if (res.status == 200) {
            Vue.set(state.calendarLog, state.calendarLog.length, log);
            alert('등록 성공!');
          } else {
            alert('정보를 불러오는데 실패했습니다.');
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
    askGPT: function ({ commit }, logs) {
      const { Configuration, OpenAIApi } = require('openai');

      console.log(process.env);
      const configiration = new Configuration({
        // organization: process.env.OPENAI_ORGANIZATION,
        apiKey: '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',
      });

      console.log(commit, logs);

      // const api_key = process.env.VUE_APP_OPEN_AI_KEY;
      let keywords = [];
      for (let log of logs) {
        keywords.push(log.title);
      }

      const messages = [
        { role: 'system', content: 'You are a helpful and kind trainer.' },
        {
          role: 'user',
          content:
            '최근에 ' +
            keywords.join(',') +
            '을(를) 했는데 다음에 어떤 운동을 하면 좋을지 3가지 정도로 추천해줘.',
        },
      ];

      const openai = new OpenAIApi(configiration);

      const runGPT35 = async () => {
        const res = await openai.createChatCompletion({
          model: 'gpt-3.5-turbo',
          messages: messages,
          temperature: 0.5,
          n: 1,
        });
        console.log(res);
        let answer = [];
        res.data.choices[0].message.content
          .split('\n\n')
          .forEach((sentence) => {
            if (Number.isInteger(Number(sentence[0]))) {
              const [title, content] = sentence.split(':');
              answer.push({
                title: title,
                content: content,
              });
            }
          });
        commit('ASK_GPT', answer);
      };

      runGPT35();
    },
  },
  plugins: [createPersistedState()],
});
