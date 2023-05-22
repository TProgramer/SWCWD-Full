<template>
  <div class="mt-5 container d-flex flex-column justify-content-center">
    <h2 class="text-center font-weight-bold">SSAFIT에 오신 것을 환영합니다.</h2>
    <fieldset class="text-center">
      <div class="d-flex justify-content-center align-items-center">
        
        <input placeholder="ID" type="text" id="id" v-model="id" class="view" />
      </div>
        <div class="d-flex justify-content-center align-items-center">
      <input
        placeholder="Password" 
        type="password"
        id="password"
        v-model="password"
        class="view"
      />
      </div>
      <div class="d-flex justify-content-end my-2" style="width:90%"> 
        <router-link to="/regist">▶ 아직 회원이 아니십니까? </router-link>
      </div>
      
      <div class="row justify-content-center">
        <b-button class="btn-success col-sm-2 col-9" @click="login">로그인</b-button>
      </div>
    </fieldset>
  </div>
</template>
<script>
export default {
  name: "LoginForm",
  data() {
    return {
      id: "",
      password: "",
    };
  },
  methods: {
    login() {
      let user = {
        id: this.id,
        password: this.password,
      };

      this.$store.dispatch("setLoginUser", user);
    },
  },
};
</script>
<style></style>
