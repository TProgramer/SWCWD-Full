<template>
  <main class="container">
    <div class="d-flex justify-content-center m-5">
      <b-embed
        type="iframe"
        :src="`https://www.youtube.com/embed/${video.id}`"
        allowfullscreen
        aspect="16by9"
      ></b-embed>
    </div>

    <div class="">
      <div class="m-3 p-3 d-flex border-top justify-content-between">
        <!--모달 트리거-->
        <div class="fluid">
          <v-btn class="btn-block" color="primary" v-b-modal="'my-modal'"
            >글 작성</v-btn
          >
        </div>
        <!--모달-->
        <b-modal id="my-modal" ref="my-modal" hide-footer title="게시글 작성">
          <form method="POST" action="main">
            <p>제목:</p>
            <input v-model="title" type="text" class="form-control" /> <br />
            <p>내용:</p>
            <input
              v-model="content"
              type="text"
              class="form-control"
              @keyup.enter="createReview"
            />
            <v-btn block class="my-3" @click="createReview">Submit</v-btn>
          </form>
        </b-modal>
      </div>
      <div class="m-2 p-2">
        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th scope="col" class="col-1">#</th>
              <th scope="col" class="col-sm-5 col-4">제목</th>
              <th scope="col" class="col-2">작성자</th>
              <th scope="col" class="col-2">조회수</th>
              <th scope="col" class="col-2">작성일</th>
            </tr>
          </thead>
          <tbody id="reivew-list">
            <tr
              v-for="review in reviews"
              :key="review.id"
              @click="$router.push(`/review/${review.id}`)"
            >
              <td>{{ review.id }}</td>
              <td>
                {{ review.title }}
              </td>
              <td>{{ review.writer }}</td>
              <td>{{ review.viewCnt }}</td>
              <td>{{ review.createdAt }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </main>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "VideoDetail",
  data() {
    return {
      title: "",
      content: "",
    };
  },
  methods: {
    async setVideo(id) {
      await this.$store.dispatch("setVideo", id);
    },
    async setReviews(id) {
      await this.$store.dispatch("setReviews", id);
    },
    createReview() {
      if (this.title == "" || this.content == "") {
        alert("내용을 입력해주세요!");
        return;
      }
      const pathName = new URL(document.location).pathname.split("/");
      const videoId = pathName[pathName.length - 1];
      const review = {
        videoId: videoId,
        title: this.title,
        content: this.content,
        writer: this.loginUser,
      };
      this.$refs["my-modal"].hide();
      this.$store.dispatch("createReview", review);
    },
  },
  computed: {
    ...mapState(["video", "loginUser", "reviews"]),
  },
  created() {
    const pathName = new URL(document.location).pathname.split("/");
    const id = pathName[pathName.length - 1];
    this.setVideo(id);
    this.setReviews(id);
  },
};
</script>

<style scoped>
@media (max-width: 800px) {
  th {
    font-size: 11px;
  }
  td {
    font-size: 11px;
  }
}
</style>
