<template>
  <div class="container mt-5">
    <h2 class="text-center font-weight-bold">Sign Up</h2>
    <fieldset class="text-center">
      <input placeholder="id" type="text" id="id" v-model="id" class="view" /><br />
      <input placeholder="password" type="password" id="password" v-model="password" class="view"><br >
      <input placeholder="name" type="text" id="name" v-model="name" class="view" /><br />
      <input placeholder="nickname" type="text" id="nickname" v-model="nickname" class="view" /><br />
      <input placeholder="birthDay" type="text" id="birthDay" v-model="birthDay" class="view" /><br />
      <input placeholder="email" type="email" id="email" v-model="email" class="view" /><br />
      <input placeholder="phoneNum" type="text" id="phoneNum" v-model="phoneNum" class="view" /><br />
      <b-button class="btn" @click="regist">등록</b-button>
      <b-button class="btn" @click="getInfoFromAPI">랜덤</b-button>
    </fieldset>
  </div>
</template>
<script>
import { mapState } from "vuex";
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
    async getInfoFromAPI() {
      await this.$store.dispatch("setRandomUser")
      this.id = this.randomUser.id;
      this.password = this.randomUser.password;
      this.name = this.randomUser.name;
      this.nickname = this.randomUser.nickname;
      this.email = this.randomUser.email;
      this.phoneNum = this.randomUser.phoneNum;
      this.birthDay = this.randomUser.birthDay;
    },
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
  computed: {
    ...mapState(["randomUser"]),
  },
};
</script>
