<template>
  <div class="m-5">
    <vue-inline-calendar
      :initial-date="selectedDate"
      @select-date="selectedDate = $event"
      :spec-min-date="new Date(`${regDate}`)"
      :spec-max-date="new Date()" />
    <b-card 
      :header="`${this.loginUser} 님의 운동 기록`"
      class="text-center m-5">
      <b-card-text v-if="targetLog">{{ targetLog.title }} : {{ targetLog.content }}</b-card-text>
      <b-card-text v-else>기록이 존재하지 않습니다.</b-card-text>
    </b-card>
    <hr />
    <div v-if="!todayLog">
      <h2>GPT가 권장하는 오늘의 운동</h2>
      <div class="m-5">
        <div v-if="askGPTLog">
          <b-card-group deck
            v-for="(ask, idx) in askGPTLog" :key="idx">
            <b-card
              class="m-2"
              :title="`${ask.title}`"
            >
              <b-card-text>{{ ask.content }}</b-card-text>
              <b-button
                @click="addCalendar(`${ask.title.slice(3)}`,`${ask.content}`)"
                variant="outline-primary"
                style="white-space:nowrap; width:max-content">운동 하기
              </b-button>
            </b-card>    
          </b-card-group>
        </div>
        <SkeletonCard
          v-else
          primary="#ffffff"
          structure="701120333"
        />
      </div>
    </div>
    <div v-else style="display:flex; justify-content:flex-end;">
      <b-button
        @click="deleteCalendar"
        variant="outline-primary"
        style="white-space:nowrap; width:max-content"
      >
        되돌리기
      </b-button>
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
    addCalendar: function(title, content) {
      const today = new Date();
      const log = {
        id: this.loginId,
        date: today.getFullYear()+'-'+(today.getMonth() + 1) +'-'+today.getDate(),
        title: title,
        content: content,
      }
      console.log(log.date);
      this.$store.dispatch("setCalendarLog", log);
    },
    deleteCalendar: function() {
      const today = new Date();
      const log = {
        id: this.loginId,
        date: today.getFullYear()+'-'+(today.getMonth() + 1) +'-'+today.getDate(),
      }
      this.$store.dispatch("deleteCalendarLog", log);
    }
  }, 
  computed: {
    ...mapState(["loginUser", "regDate", "calendarLog", "loginId", "askGPTLog"]),
    targetLog: function() {
      for(let log of this.calendarLog) {
        if(this.selectedDate.toDateString() == new Date(log.date).toDateString())
          return log;
      }
      return null;
    },
    todayLog : function() {
      for(let log of this.calendarLog) {
        if(new Date().toDateString() == new Date(log.date).toDateString())
          return true;
      }
      return false;
    }
  },
  async created() {
    await this.$store.dispatch("getCalendarLog", this.loginId);
    if(!this.askGPTLog && !this.todayLog)
      this.$store.dispatch("askGPT", this.calendarLog.slice(-3));
  }
}
</script>
<style>

</style>