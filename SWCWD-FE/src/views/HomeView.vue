<template>
  <main class="container">
    <div>
      <h4 id="popular-text" class="my-3">인기 동영상</h4>
      <!--carousel slide-->
      <div class="d-flex justify-content-center">
        <b-container class="w-75">
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
            <router-link
              v-for="video in popularVideos"
              :key="video.id"
              :to="`video/${video.id}`"
              >``
              <b-carousel-slide
                :img-src="`https://img.youtube.com/vi/${video.id}/maxresdefault.jpg`"
              >
              </b-carousel-slide>
            </router-link>
          </b-carousel>
        </b-container>
      </div>
    </div>

    <div class="mt-4">
      <h4 class="my-2">전체 영상</h4>
      <div class="mb-4 row">
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
      <b-container id="video-list" class="row">
        <div
          class="col-xs-8 col-sm-6 col-md-4 col-lg-3"
          v-for="video in showVideos"
          :key="video.id"
        >
          <router-link :to="`video/${video.id}`">
            <div class="d-flex flex-column">
              <b-img
                fluid
                :src="`https://img.youtube.com/vi/${video.id}/mqdefault.jpg`"
                style="object-fit: cover; width: 100%"
                class="mb-2"
                alt="..."
              ></b-img>
              <div class="w-100" style="font-size: 14px">
                <p v-line-clamp:20="2">
                  {{ video.title }}
                </p>
              </div>
            </div>
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
  import { mapGetters } from "vuex";
  import InfiniteLoading from "vue-infinite-loading";
  export default {
    name: "HomeView",
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
            .dispatch("getMoreVideo")
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
          "setCategory",
          e.currentTarget.getAttribute("value")
        );
      },
    },
    components: {
      InfiniteLoading,
    },
    computed: {
      ...mapGetters(["popularVideos", "showVideos"]),
    },
    created() {
      this.$store.dispatch("setVideos");
    },
  };
</script>
<style scoped></style>
