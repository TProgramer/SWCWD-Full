<template>
  <div class="m-5">
    <vue-inline-calendar :initial-date="selectedDate" @select-date="selectedDate = $event"
      :spec-min-date="new Date(`${regDate}`)" :spec-max-date="new Date()" />
    <b-card :header="`${this.loginUser} 님의 운동 기록`" class="text-center m-5">
      <b-card-text v-if="targetLog">{{ targetLog.title }} : {{ targetLog.content }}</b-card-text>
      <b-card-text v-else>기록이 존재하지 않습니다.</b-card-text>
    </b-card>
    <hr />
    <div v-if="!todayLog" class="m-5">
      <h2>GPT가 권장하는 오늘의 운동</h2>
      <div class="m-5">
        <div v-if="askGPTLog">
          <b-card-group deck v-for="(ask, idx) in askGPTLog" :key="idx">
            <b-card class="m-2" :title="`${ask.title}`">
              <b-card-text>{{ ask.content }}</b-card-text>
              <b-button @click="addCalendar(`${ask.title.slice(3)}`, `${ask.content}`)" variant="outline-primary"
                style="white-space: nowrap; width: max-content">운동 선택
              </b-button>
            </b-card>
          </b-card-group>
        </div>
        <SkeletonCard v-else primary="#ffffff" structure="701120333" />
      </div>
    </div>
    <div v-else class="m-5">
      <div style="display:flex; justify-content:space-between;">
        <h2>
          오늘의 운동을 위한 영상 추천
        </h2>
        <b-button @click="deleteCalendar" variant="outline-primary" style="white-space:nowrap; width:max-content">
          되돌리기
        </b-button>
      </div>
      <div v-if="recommendVideo" class="d-flex justify-content-center m-5">
        <b-embed
          type="iframe"
          :src="`https://www.youtube.com/embed/${recommendVideo}`"
          allowfullscreen
          aspect="16by9"
        ></b-embed>
      </div>
    </div>
  </div>
</template>

<script>
import VueInlineCalendar from 'vue2-inline-calendar'
import { mapState } from 'vuex';
export default {
  name: 'MyPageView',
  components: {
    VueInlineCalendar
  },
  data() {
    return {
      selectedDate: new Date(),
    }
  },
  methods: {
    logout() {
      this.$store.dispatch("logout");
      this.$router.push("/");
    },
    addCalendar: function (title, content) {
      const today = new Date();
      const log = {
        id: this.loginId,
        date: today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate(),
        title: title,
        content: content,
      }
      this.$store.dispatch("setCalendarLog", log);
    },
    deleteCalendar: function () {
      const today = new Date();
      const log = {
        id: this.loginId,
        date: today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate(),
      }
      this.$store.dispatch("deleteCalendarLog", log);
    }
  },
  computed: {
    ...mapState(["fullVideos", "loginUser", "regDate", "calendarLog", "loginId", "askGPTLog"]),
    targetLog: function () {
      for (let log of this.calendarLog) {
        if (this.selectedDate.toDateString() == new Date(log.date).toDateString())
          return log;
      }
      return null;
    },
    todayLog: function () {
      for (let log of this.calendarLog) {
        if (new Date().toDateString() == new Date(log.date).toDateString())
          return log;
      }
      return null;
    },
    recommendVideo: function() {
      console.log(this.todayLog.title)
      for (let video of this.fullVideos) {
        if(video.title.includes(this.todayLog.title)) {
          return video.id;
        }
      }
      return 'F-Csau_JlIQ';
    }
  },
  async created() {
    await this.$store.dispatch("getCalendarLog", this.loginId);
    await this.$store.dispatch("setFullVideos", this.loginId);
    if (!this.askGPTLog && !this.todayLog)
      this.$store.dispatch("askGPT", this.calendarLog.slice(-3));
  },
}
</script>
