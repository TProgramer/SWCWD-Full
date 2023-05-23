<template>
  <header class="container text-center">
    <nav class="mt-4 d-flex align-items-center justify-content-between">
      <div id="logo">
        <a href="/"><h3 class="font-weight-bold">SSAFIT</h3></a>
      </div>
      <div
        class="search d-none d-sm-block"
        style="width: 30%; position: absolute; left: 35%; top: 2%"
      >
        <input
          type="search"
          class="form-control p-6"
          placeholder="Search"
          @keyup.enter="search"
          v-model="searchWord"
        />
      </div>
      <div class="d-flex">
        <div class="d-flex mr-3">
          <b-icon-search
            type="button"
            class="d-sm-none mr-3"
            @click="showModal"
          ></b-icon-search>
          <a href="#" v-if="getUser" @click="logout"><h6>마이페이지</h6></a>
          <router-link to="/login" v-else><h6>로그인</h6></router-link>
        </div>
      </div>
      <!-- 검색 모달 -->
      <b-modal ref="my-modal" hide-footer hide-header>
        <div class="container d-flex justify-content-center align-items-center">
          <input
            placeholder="search"
            class="view"
            v-model="searchWord"
            @keyup.enter="search"
          />
          <b-icon-search
            type="button"
            class="d-sm-none ml-3"
            @click="search"
          ></b-icon-search>
        </div>
      </b-modal>
    </nav>
    <hr />
  </header>
</template>

<script>
  import { mapState } from "vuex";

  export default {
    name: "HeaderNav",
    data() {
      return {
        searchWord: "",
      };
    },
    methods: {
      logout() {
        this.$store.dispatch("logout");
      },
      showModal() {
        this.$refs["my-modal"].show();
      },
      search() {
        this.$store.dispatch("search", this.searchWord);
        this.$refs["my-modal"].hide();
      },
    },
    computed: {
      ...mapState(["loginUser"]),
      getUser() {
        if (this.loginUser) {
          return true;
        } else {
          return false;
        }
      },
    },
  };
</script>

<style></style>
