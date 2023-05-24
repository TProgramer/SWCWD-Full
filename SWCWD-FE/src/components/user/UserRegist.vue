<template>
  <div class="container mt-5">
    <h2 class="text-center font-weight-bold">회원가입</h2>
    <fieldset class="text-center">
      <input
        placeholder="id"
        type="text"
        id="id"
        v-model="id"
        class="view"
      /><br />
      <input
        placeholder="password"
        type="password"
        id="password"
        v-model="password"
        class="view"
      /><br />
      <input
        placeholder="name"
        type="text"
        id="name"
        v-model="name"
        class="view"
      /><br />
      <input
        placeholder="nickname"
        type="text"
        id="nickname"
        v-model="nickname"
        class="view"
      /><br />
      <input
        placeholder="birthDay"
        type="text"
        id="birthDay"
        v-model="birthDay"
        class="view"
      /><br />
      <input
        placeholder="email"
        type="email"
        id="email"
        v-model="email"
        class="view"
      /><br />
      <input
        placeholder="phoneNum"
        type="text"
        id="phoneNum"
        v-model="phoneNum"
        class="view"
      /><br />
      <div class="row justify-content-center">
        <v-btn class="col-sm-2 col-9" color="primary" @click="regist"
          >회원가입</v-btn
        >
      </div>
    </fieldset>
  </div>
</template>
<script>
  export default {
    name: "UserList",
    data() {
      return {
        id: "",
        password: "",
        name: "",
        nickname: "",
        email: "",
        birthDay: "",
        phoneNum: "",
      };
    },
    methods: {
      regist() {
        if (
          this.id === "" ||
          this.password === "" ||
          this.name === "" ||
          this.nickname === "" ||
          this.email === "" ||
          this.phoneNum === "" ||
          this.birthDay === ""
        ) {
          alert("모든 내용을 입력해주세요");
          return;
        }

        let user = {
          id: this.id,
          password: this.password,
          name: this.name,
          email: this.email,
          nickname: this.nickname,
          phoneNum: this.phoneNum,
          birthDay: this.birthDay,
        };

        this.$store.dispatch("createUser", user);
      },
    },
  };
</script>
