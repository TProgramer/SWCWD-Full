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
        <b-button class="col-1 d-none d-sm-block" style="font-size: 13px"
          >전체</b-button
        >
        <b-button class="col-1 d-none d-sm-block" style="font-size: 13px"
          >하체</b-button
        >
        <b-button class="col-1 d-none d-sm-block" style="font-size: 13px"
          >상체</b-button
        >
        <b-button class="col-1 d-none d-sm-block" style="font-size: 13px"
          >복근</b-button
        >

        <b-button class="col-2 d-block d-sm-none" style="font-size: 11px"
          >전체</b-button
        >
        <b-button class="col-2 d-block d-sm-none" style="font-size: 11px"
          >하체</b-button
        >
        <b-button class="col-2 d-block d-sm-none" style="font-size: 11px"
          >상체</b-button
        >
        <b-button class="col-2 d-block d-sm-none" style="font-size: 11px"
          >복근</b-button
        >
      </div>
      <b-container id="video-list">
        <b-row v-for="row in nrows" :key="row">
          <b-col v-for="col in 4" :key="col">
            <router-link
              :to="`video/${filteredVideos[(row - 1) * 4 + col - 1].id}`"
              v-if="(row - 1) * 4 + col - 1 < videoCnt"
            >
              <div class="d-flex flex-column">
                <b-img
                  fluid
                  :src="`https://img.youtube.com/vi/${
                    filteredVideos[(row - 1) * 4 + col - 1].id
                  }/maxresdefault.jpg`"
                  style="object-fit: cover; width: 100%"
                  class="mb-2"
                  alt="..."
                ></b-img>
                <div class="w-100" style="font-size: 14px">
                  <p v-line-clamp:20="2">
                    {{ filteredVideos[(row - 1) * 4 + col - 1].title }}
                  </p>
                </div>
              </div>
            </router-link>
          </b-col>
        </b-row>
      </b-container>
      <infinite-loading
        @infinite="infiniteHandler"
        spinner="waveDots"
      ></infinite-loading>
    </div>
  </main>
</template>

<script>
  import { mapGetters, mapState } from "vuex";
  import InfiniteLoading from "vue-infinite-loading";
  export default {
    name: "HomeView",
    data() {
      return {
        slide: 0,
        sliding: null,
        loadNum: 0,
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
        this.$store
          .dispatch("getMoreVideo")
          .then((res) => {
            if (res) $state.loaded();
            else $state.complete();
          })
          .catch((e) => {
            console.log(e);
          });
      },
    },
    components: {
      InfiniteLoading,
    },
    computed: {
      ...mapState(["filteredVideos"]),
      ...mapGetters(["popularVideos", "videoCnt"]),
      nrows() {
        return Math.floor((this.videoCnt - 1) / 4) + 1;
      },
    },
    created() {
      this.$store.dispatch("setVideos");
    },
  };
</script>

<style scoped></style>
