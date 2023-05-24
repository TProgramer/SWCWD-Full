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
              @click="addCalendar(`${ask}`)"
              variant="outline-primary"
              style="white-space:nowrap; width:max-content">운동 선택
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
    <a
      href="#"
      v-if="getUser"
      @click="logout"
      style="font-size: 16px; font-weight: 500"
      >마이페이지</a
    >
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
    addCalendar: function(ask) {
      const log = {
        id: this.loginId,
        date: new Date().toISOString().slice(0, 19).replace('T', ' '),
        title: ask.title,
        content: ask.content
      }
      this.$store.dispatch("setCalendarLog", log);
    }
  }, 
  computed: {
    ...mapState(["loginUser", "regDate", "calendarLog", "loginId", "askGPTLog"]),
    targetLog: function() {
      for(let log of this.calendarLog) {
        if(this.selectedDate.toISOString().slice(0, 10) === new Date(log.date).toISOString().slice(0, 10)) {
          return log;
        }
      }
      return null;
    }
  },
  async created() {
    console.log(this.regDate)
    if(this.calendarLog.length == 0)
      await this.$store.dispatch("getCalendarLog", this.loginId);
    if(!this.askGPTLog)
      this.$store.dispatch("askGPT", this.calendarLog.slice(-3));
  }
}
</script>