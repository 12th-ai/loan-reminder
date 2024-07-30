import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import VueAxios from 'vue-axios'
import mixin from './mixin/mixin'
import '@/scss/style.scss';
import Notifications from '@kyvg/vue3-notification'
// import './registerServiceWorker'

createApp(App)
  .use(store)
  .use(store)
  .use(router)
  .mixin(mixin)
  .use(VueAxios, axios)
  .use(Notifications)
  .mount('#app')
