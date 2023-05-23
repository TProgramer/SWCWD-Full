<template>
  <div id="app">
    <vue-inline-calendar @select-date="selectedDate = $event" :spec-min-date="new Date(`${regDate}`)"
      :spec-max-date="new Date()" />
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
      selectedDate: null
    }
  },
  computed: {
    ...mapState(["regDate", "calendarLog"]),
  },
  created() {
    this.$store.dispatch("getCalendarLog");
  }
}
</script>