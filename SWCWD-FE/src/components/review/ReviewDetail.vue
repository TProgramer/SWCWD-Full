<template>
  <main class="container">
    <div class="d-flex flex-column justify-content-between m-5">
      <div class="">
        <div class="m-3 p-3 border-top d-flex justify-content-between">
          <!--모달-->
          <b-modal id="my-modal" title="게시글 수정">
            <form method="POST" action="main">
              <p>제목:</p>
              <input v-model="review.title" type="text" class="form-control" />
              <br />
              <p>내용:</p>
              <input
                v-model="review.content"
                type="text"
                class="form-control"
              />
            </form>
            <template #modal-footer>
              <v-btn
                v-b-modal.modal-close_visit
                class="w-25 m-1"
                @click="updateReview"
                >Submit</v-btn
              >
            </template>
          </b-modal>
        </div>
      </div>
      <div class="container shadow pt-4">
        <div class="text-start">
          <h6 id="title" class="font-weight-bold">{{ review.title }}</h6>

          <div class="d-flex">
            <div class="mr-1" style="font-size: 12px" id="writer">
              {{ review.writer }} |
            </div>
            <div class="mr-1" style="font-size: 12px" id="createdAt">
              {{ review.createdAt }}
            </div>
            <div
              class="mr-1 text-right flex-fill"
              style="font-size: 12px"
              id="viewCnt"
            >
              조회수: {{ review.viewCnt }}
            </div>
          </div>
          <hr />
          <blockquote id="content" class="text-start">
            {{ review.content }}
          </blockquote>
        </div>
      </div>
      <br />
      <div class="d-flex justify-content-end fluid">
        <router-link to="/">
          <v-btn class="btn-block" type="button">목록</v-btn>
        </router-link>
        <!--모달 트리거-->
        <div class="ml-1">
          <v-btn
            v-show="loginUser === review.writer"
            class="btn-block"
            color="primary"
            v-b-modal="'my-modal'"
            >수정</v-btn
          >
        </div>
        <div class="ml-1">
          <v-btn
            v-show="loginUser === review.writer"
            color="error"
            @click="deleteReview"
            >삭제</v-btn
          >
        </div>
      </div>
    </div>
  </main>
</template>

<script>
  import { mapState } from 'vuex';
  export default {
    name: 'ReviewDetail',
    methods: {
      setReview(id) {
        this.$store.dispatch('setReview', id);
      },
      updateReview() {
        this.$store.dispatch('updateReview', this.review);
      },
      deleteReview() {
        this.$store.dispatch('deleteReview', this.review.id);
      },
    },
    computed: {
      ...mapState(['review', 'loginUser']),
    },
    created() {
      const pathName = new URL(document.location).pathname.split('/');
      const id = pathName[pathName.length - 1];
      this.setReview(id);
    },
  };
</script>

<style></style>
