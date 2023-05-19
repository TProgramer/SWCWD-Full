import axios from "axios";

// axios 객체 생성
export default axios.create({
  baseURL: process.env.VUE_APP_BASEURL,
  headers: {
    "Content-type" : "application/json"
  }
});
