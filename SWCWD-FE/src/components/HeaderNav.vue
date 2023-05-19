<template>
  <header class="text-center">
	<nav class="row my-3 px-4 d-flex align-items-center justify-content-between">
		<div id="logo" class="col-4">
			<h3><router-link to="/">SSAFIT</router-link></h3>
		</div>
		<div class="col-4 search d-none d-sm-block">
			<input id="search" type="search" class="form-control p-6"
				placeholder="검색어를 입력하세요" />
		</div>
		<div class="col-4 d-flex justify-content-center">
			<div class="mr-3  ">
        <a href="#" v-if="getUser" @click="logout"><h6>LOGOUT</h6></a>
      <router-link to="/login" v-else><h6>SIGN IN</h6></router-link>
      </div> 
        <div>
            <router-link :to="{ name: 'Regist' }"><h6>SIGN UP</h6></router-link>
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