<template>
  <header class="container text-center">
	<nav class="mt-4 d-flex align-items-center justify-content-between">
		<div id="logo">
			<router-link to="/"><h3 class="font-weight-bold">SSAFIT</h3></router-link>
		</div>
		<div class="d-flex justify-content-center">
			<div class="mr-3">
        <a href="#" v-if="getUser" @click="logout"><h6>로그아웃</h6></a>
      <router-link to="/login" v-else><h6>로그인</h6></router-link>
      </div> 
        <div>
            <a href="#" v-if="getUser" @click="logout"><h6>마이페이지</h6></a>
        </div> 
		</div>
	</nav>
  <hr/>
</header>
</template>

<script>
import {mapState} from "vuex"

export default {
  name: "HeaderNav",
  methods: {
    logout() {
      this.$store.dispatch("logout");
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
}
</script>

<style>
</style>