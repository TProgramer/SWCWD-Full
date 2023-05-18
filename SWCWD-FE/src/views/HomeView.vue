<template>
    <main class="container">
		<div>
			<h3 id="popular-text" class="fs-4 my-3">인기 동영상</h3>
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

		<div>
      <h3 class="fs-4 my-3">운동 부위 선택</h3>
      <div class="mb-4 row justify-content-center">
        <b-button class="col-md-1 col-2">전체</b-button>
        <b-button class="col-md-1 col-2">하체</b-button>
        <b-button class="col-md-1 col-2">상체</b-button>
        <b-button class="col-md-1 col-2">복근</b-button>
      </div>
      <b-container id="video-list">
          <div v-for="row in parseInt(videoCnt/4)" :key="row" class="row align-items-center">
              <div v-for="col in 4" :key="col" class="col-md-3 mb-3">
                <router-link :to="`video/${videos[(row-1)*4+col-1].id}`">
                  <div class="d-flex flex-column align-items-center">
                      <b-img fluid :src="`${videos[(row-1)*4+col-1].thumbUrl}`" style="object-fit: cover; maxHeight: 200px; width:80%; border-radius: 5%;"
                      class="mb-2"
                        alt="..."></b-img>
                    <div class="w-75 text-center">
                      <h6 style="line-height: 1.5em;
                          height: 3em;
                          overflow: hidden;
                          white-space: nowrap;
                          text-overflow: ellipsis;
                          width: 100%;">
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