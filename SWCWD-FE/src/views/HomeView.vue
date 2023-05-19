<template>
  <main class="container">
    <div class="w-50 search d-none d-sm-block" style=" position: absolute;
left: 25%;
top: 2%;">
          <input id="search" type="search" class="form-control p-6"
              placeholder="Search" />
      </div>
      <div>
          <h4 id="popular-text" class="fs-4 font-weight-bold my-3">인기 동영상</h4>
          <!--carousel slide-->
          <div class="d-flex justify-content-center">
    <b-container class="w-50">
      <b-carousel
        id="carousel-1"
        v-model="slide"
        :interval="4000"
        controls
        indicators
        background="#ababab"
        style="text-shadow: 1px 1px 2px #333;"
        @sliding-start="onSlideStart"
        @sliding-end="onSlideEnd"
      >
        <router-link  v-for="video in popularVideos" :key="video.id" :to="`video/${video.id}`">``
        <b-carousel-slide
          :img-src="`${video.thumbUrl}`"
        >
        </b-carousel-slide>
        </router-link>
      </b-carousel>
    </b-container>
      </div>
      </div>

      <div class="mt-4">
    <h4 class="my-2 font-weight-bold">전체 영상</h4>
    <div class="mb-4 row">
      <b-button class="col-1 d-none d-sm-block" style="font-size: 13px">전체</b-button>
      <b-button class="col-1 d-none d-sm-block" style="font-size: 13px">하체</b-button>
      <b-button class="col-1 d-none d-sm-block" style="font-size: 13px">상체</b-button>
      <b-button class="col-1 d-none d-sm-block" style="font-size: 13px">복근</b-button>

      <b-button class="col-2 d-block d-sm-none" style="font-size: 11px">전체</b-button>
      <b-button class="col-2 d-block d-sm-none" style="font-size: 11px">하체</b-button>
      <b-button class="col-2 d-block d-sm-none" style="font-size: 11px">상체</b-button>
      <b-button class="col-2 d-block d-sm-none" style="font-size: 11px">복근</b-button>
    </div>
    <b-container id="video-list">
        <div v-for="row in parseInt(videoCnt/4)" :key="row" class="row align-items-center">
            <div v-for="col in 4" :key="col" class="col-md-3 my-3">
              <router-link :to="`video/${videos[(row-1)*4+col-1].id}`">
                <div class="d-flex flex-column align-items-center">
                    <b-img fluid :src="`${videos[(row-1)*4+col-1].thumbUrl}`" style="object-fit: cover; maxHeight: 168px; width:100%;"
                    class="mb-2"
                      alt="..."></b-img>
                  <div class="w-100">
                    <h6 v-line-clamp:20="2">
                        {{videos[(row-1)*4+col-1].title}}
                        </h6>
                  </div>
                </div>
              </router-link >
            </div>
        </div>
    </b-container>
      </div>
  </main>
</template>


<script>
import {mapGetters, mapState} from "vuex"
export default {
name: 'HomeView',
data() {
    return {
      slide: 0,
      sliding: null
    }
  },
  methods: {
    onSlideStart() {
      this.sliding = true
    },
    onSlideEnd() {
      this.sliding = false
    }
  },
components: {
},
computed:{
  ...mapState(["videos"]),
  ...mapGetters(["popularVideos","videoCnt"])
},
created(){
  this.$store.dispatch("setVideos");
}
}
</script>

<style scoped>
</style>