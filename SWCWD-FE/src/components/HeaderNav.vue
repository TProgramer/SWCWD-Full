<template>
  <header class="container text-center">
	<nav class="my-3 d-flex align-items-center justify-content-between">
		<div id="logo">
			<h3><router-link to="/">SSAFIT</router-link></h3>
		</div>
		<div class="d-flex justify-content-center">
			<div class="mr-3">
        <a href="#" v-if="getUser" @click="logout"><h6>LOGOUT</h6></a>
      <router-link to="/login" v-else><h6>SIGN IN</h6></router-link>
      </div> 
        <div>
            <router-link :to="{ name: 'MyPage' }" v-if="getUser"><h6>MY PAGE</h6></router-link>
            <router-link :to="{ name: 'Regist' }" v-else><h6>SIGN UP</h6></router-link>
        </div> 
		</div>
	</nav>
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