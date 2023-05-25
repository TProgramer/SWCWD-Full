<template>
  <header class="pt-4 container text-center sticky-top bg-white">
    <nav class="d-flex align-items-center justify-content-between">
      <a href="/" style="font-size: 32px; font-weight: 500">SSAFIT</a>
      <div class="search d-none d-sm-block" style="width: 50%">
        <input
          type="search"
          class="form-control p-6"
          placeholder="Search"
          @keyup.enter="search"
          v-model="searchWord"
        />
      </div>
      <div class="d-flex">
        <div class="d-flex mr-3 align-items-center">
          <b-icon-search
            type="button"
            class="d-sm-none mr-3"
            @click="showModal"
          ></b-icon-search>
          <a
            href="redirect:/"
            @click="logout"
            style="font-size: 16px; fo웃t-weight: 500"
            v-if="$route.path == '/mypage'"
            >로그아웃
          </a>
          <router-link
            to="/mypage"
            style="font-size: 16px; font-weight: 500"
            v-else-if="getUser"
            >마이페이지</router-link
          >
          <router-link
            to="/login"
            style="font-size: 16px; font-weight: 500"
            v-else
            >로그인</router-link
          >
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
      showModal() {
        this.$refs["my-modal"].show();
      },
      search() {
        this.$store.dispatch("search", this.searchWord);
        this.$refs["my-modal"].hide();
      },
      logout() {
        this.$store.dispatch("logout");
        this.$router.push("/");
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
