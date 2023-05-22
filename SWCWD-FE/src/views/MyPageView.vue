<template>
  <div id="app">
      <vue-inline-calendar @select-date="selectedDate = $event" />
  </div>
</template>

<script>
import VueInlineCalendar from 'vue2-inline-calendar'

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
}
</script>