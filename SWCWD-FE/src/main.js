import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import lineClamp from 'vue-line-clamp';
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue';
import SkeletonCards from 'vue-ultimate-skeleton-cards';

// Import Bootstrap and BootstrapVue CSS files (order is important)
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';
import vuetify from './plugins/vuetify';

// Make BootstrapVue available throughout your project
Vue.use(BootstrapVue);
// Optionally install the BootstrapVue icon components plugin
Vue.use(IconsPlugin);

Vue.use(SkeletonCards);

Vue.config.productionTip = false;
Vue.use(lineClamp);
new Vue({
  router,
  store,
  vuetify,
  render: (h) => h(App),
}).$mount('#app');
