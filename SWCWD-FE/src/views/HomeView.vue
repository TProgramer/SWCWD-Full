<template>
  <main class="container">
    <div>
      <h4 id="popular-text" class="my-3">인기 동영상</h4>
      <!--carousel slide-->
      <div class="d-flex justify-content-center">
        <b-container class="d-flex w-100 align-items-center">
          <v-sheet elevation="5">
            <b-carousel
              id="carousel-1"
              v-model="slide"
              :interval="4000"
              controls
              background="#ababab"
              style="text-shadow: 1px 1px 2px #333"
              @sliding-start="onSlideStart"
              @sliding-end="onSlideEnd"
            >
              <div
                style="
                  font-size: 14px;
                  position: absolute;
                  z-index: 1000;
                  bottom: 0;
                  color: white;
                  background-color: black;
                  opacity: 0.8;
                  text-align: end;
                "
                class="d-block w-100"
                id="slide-title"
              >
                {{ showVideos[slide].title }}
                <br />
                조회수: {{ showVideos[slide].viewCnt }}
              </div>
              <router-link
                v-for="video in popularVideos"
                :key="video.id"
                :to="`video/${video.id}`"
                >``
                <b-carousel-slide
                  :img-src="`https://img.youtube.com/vi/${video.id}/maxresdefault.jpg`"
                  class="text-center"
                >
                </b-carousel-slide>
              </router-link>
            </b-carousel>
          </v-sheet>
        </b-container>
        <div class="w-25">
          <button class="d-block h-100 w-75 overflow-auto" @click="moveSide">
            <b-img-lazy
              v-for="(popularVideo, index) in popularVideos"
              :key="popularVideo.id"
              :id="index"
              fluid
              :src="`https://img.youtube.com/vi/${popularVideo.id}/mqdefault.jpg`"
              style="object-fit: cover"
              class="mb-2 border"
              alt="..."
            ></b-img-lazy>
          </button>
        </div>
      </div>
    </div>

    <div class="mt-4">
      <h4 class="my-2">전체 영상</h4>
      <div class="mb-4 row" id="category-btns">
        <v-btn
          class="col-1 d-none d-sm-block m-1"
          style="font-size: 13px"
          @click="onCategoryBtnClick"
          value=""
          >전체</v-btn
        >
        <v-btn
          class="col-1 d-none d-sm-block m-1"
          style="font-size: 13px"
          @click="onCategoryBtnClick"
          value="하체"
          >하체</v-btn
        >
        <v-btn
          class="col-1 d-none d-sm-block m-1"
          style="font-size: 13px"
          @click="onCategoryBtnClick"
          value="상체"
          >상체</v-btn
        >
        <v-btn
          class="col-1 d-none d-sm-block m-1"
          style="font-size: 13px"
          @click="onCategoryBtnClick"
          value="복근"
          >복근</v-btn
        >

        <v-btn
          class="col-2 d-block d-sm-none m-1"
          style="font-size: 11px"
          @click="onCategoryBtnClick"
          value=""
          >전체</v-btn
        >
        <v-btn
          class="col-2 d-block d-sm-none m-1"
          style="font-size: 11px"
          @click="onCategoryBtnClick"
          value="하체"
          >하체</v-btn
        >
        <v-btn
          class="col-2 d-block d-sm-none m-1"
          style="font-size: 11px"
          @click="onCategoryBtnClick"
          value="상체"
          >상체</v-btn
        >
        <v-btn
          class="col-2 d-block d-sm-none m-1"
          style="font-size: 11px"
          @click="onCategoryBtnClick"
          value="복근"
          >복근</v-btn
        >
      </div>
      <b-container id="video-list" class="row justify-content-start">
        <div
          class="col-xs-8 col-sm-6 col-md-4 col-lg-3 mb-3"
          v-for="video in showVideos"
          :key="video.id"
        >
          <router-link :to="`video/${video.id}`">
            <v-sheet class="d-flex flex-column" elevation="2">
              <b-img-lazy
                fluid
                :src="`https://img.youtube.com/vi/${video.id}/mqdefault.jpg`"
                style="object-fit: cover; width: 100%"
                class="mb-2"
                alt="..."
              ></b-img-lazy>
              <div style="height: 60px">
                <span
                  class="ml-1"
                  v-line-clamp:20="2"
                  style="font-size: 14px; font-weight: bold"
                >
                  {{ video.title }}
                </span>
                <span class="ml-1" v-line-clamp:20="2" style="font-size: 14px">
                  조회수: {{ video.viewCnt }}
                </span>
              </div>
            </v-sheet>
          </router-link>
        </div>
      </b-container>
      <infinite-loading
        @infinite="infiniteHandler"
        spinner="waveDots"
      ></infinite-loading>
    </div>
  </main>
</template>

<script>
  import { mapGetters, mapState } from 'vuex';
  import InfiniteLoading from 'vue-infinite-loading';
  export default {
    name: 'HomeView',
    data() {
      return {
        slide: 0,
        sliding: null,
      };
    },
    methods: {
      onSlideStart() {
        this.sliding = true;
      },
      onSlideEnd() {
        this.sliding = false;
      },

      infiniteHandler($state) {
        setTimeout(() => {
          this.$store
            .dispatch('getMoreVideo')
            .then((res) => {
              if (res) $state.loaded();
              else $state.complete();
            })
            .catch((e) => {
              console.log(e);
            });
        }, 1000);
      },
      onCategoryBtnClick(e) {
        this.$store.dispatch(
          'setCategory',
          e.currentTarget.getAttribute('value')
        );
      },
      moveSide(e) {
        this.slide = parseInt(e.target.id);
      },
    },
    components: {
      InfiniteLoading,
    },
    computed: {
      ...mapState(['popularVideos']),
      ...mapGetters(['showVideos']),
    },
    created() {
      this.$store.dispatch('setVideos');
      this.$store.dispatch('setPopularVideos');
    },
  };
</script>
<style scoped>
  @media (max-width: 800px) {
    h4 {
      text-align: center;
    }
    #category-btns {
      display: flex;
      justify-content: center;
    }
    .row {
      margin: 0;
    }
    #slide-title {
      font-size: 8px !important;
    }
  }
</style>
