<template>
  <v-app>
    <div id="app">
      <HeaderNav></HeaderNav>
      <router-view />
    </div>
  </v-app>
</template>
<script>
  import HeaderNav from "./components/HeaderNav.vue";
  export default {
    name: "App",
    components: {
      HeaderNav,
    },
  };
</script>
<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    list-style: none;
  }
  .text-center {
    text-align: center;
  }
  a {
    text-decoration: none !important;
    color: black !important;
  }
  a:hover {
    text-decoration: none !important;
    color: black !important;
  }
  #app {
    font-family: "NanumSquareRound" !important;
  }
  @font-face {
    font-family: "NanumSquareRound";
    src: url("assets/fonts/NanumSquareRoundR.ttf") format("truetype");
    font-weight: 300;
  }
  @font-face {
    font-family: "NanumSquareRound";
    src: url("assets/fonts/NanumSquareRoundB.ttf") format("truetype");
    font-weight: 500;
  }
  @font-face {
    font-family: "NanumSquareRound";
    src: url("assets/fonts/NanumSquareRoundEB.ttf") format("truetype");
    font-weight: 700;
  }
</style>
