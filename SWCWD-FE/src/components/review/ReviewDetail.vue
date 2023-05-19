<template>
  <main class="container">
		<div class="d-flex flex-column justify-content-between m-5">
			<div class="">
				<div class="m-3 p-3 border-top d-flex justify-content-between">
				<!--모달-->
				<b-modal id="my-modal" title="게시글 수정">
            <form method="POST" action="main">
                <p>제목:</p>
                <input v-model="review.title" type="text"
                  class="form-control" /> <br />
                <p>내용:</p>
                <input v-model="review.content" type="text"
                  class="form-control" />
            </form>
            <template #modal-footer>
              <b-button v-b-modal.modal-close_visit class="btn btn-danger w-25 m-1">Close</b-button>
              <b-button v-b-modal.modal-close_visit class="btn btn-success w-25 m-1" @click="updateReview">Submit</b-button>
            </template>
        </b-modal>
			</div>
			</div>
			<div class="container shadow pt-4">
				<div class="text-start">
					<h6 id="title" class="font-weight-bold">{{review.title }}</h6>

					<div class="d-flex">
						<div class="mr-1" style="font-size: 12px" id="writer">{{review.writer }} | </div>
						<div class="mr-1" style="font-size: 12px" id="createdAt">{{review.createdAt }}</div>
						<div class="mr-1 text-right flex-fill" style="font-size: 12px" id="viewCnt">조회수: {{review.viewCnt }}</div>
					</div>
					<hr/>
					<blockquote id="content" class="text-start">{{review.content }}</blockquote>

				</div>
				
			</div>
		</div>
		<div class="d-flex justify-content-end fluid">
			<router-link class="m-1" to="/">
				<b-button class="btn-block " type="button">목록</b-button>
			</router-link>
				<!--모달 트리거-->
			<div class="m-1">
				<b-button class="btn-block" variant="success" v-b-modal="'my-modal'">수정</b-button>
			</div>
			<div class="m-1">
				<b-button class="btn-block" variant="danger"  type="button" @click="deleteReview">삭제</b-button>
			</div>
			</div>
	</main>
</template>

<script>
import {mapState} from "vuex"
export default {
	name: "ReviewDetail",
  methods: {
		setReview(id){
			this.$store.dispatch("setReview",id)
		},
		updateReview() {
      this.$store.dispatch("updateReview", this.review);
    },
    deleteReview() {
      this.$store.dispatch("deleteReview", this.review.id);
    },
  },
  computed: {
    ...mapState(["review"])
  },
  created() {
    const pathName = new URL(document.location).pathname.split("/");
    const id = pathName[pathName.length - 1];
    this.setReview(id);
  },
}
</script>

<style>

</style>