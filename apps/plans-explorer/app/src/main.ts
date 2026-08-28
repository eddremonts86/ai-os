import { createApp } from 'vue';
import { createRouter, createWebHashHistory } from 'vue-router';
import App from './App.vue';
import './styles/tokens.css';
import './styles/app.css';
// After the app styles: typeset lives in @layer components, so unlayered app rules
// still win where they need to.
import './styles/typeset.css';

import LandingView from './views/LandingView.vue';
import IndexView from './views/IndexView.vue';
import PlanView from './views/PlanView.vue';
import RankingsView from './views/RankingsView.vue';
import SubmitView from '@/views/SubmitView.vue';
import AboutView from './views/AboutView.vue';

const router = createRouter({
  history: createWebHashHistory(),
  routes: [
    // The landing owns '/', the explorer moves to '/plans'. Opening straight into the
    // search results asked visitors to filter a corpus before anything explained what it
    // was. '/plans/:id' below is unaffected and keeps every existing deep link working.
    { path: '/', name: 'landing', component: LandingView },
    { path: '/plans', name: 'index', component: IndexView },
    { path: '/plans/:id', name: 'plan', component: PlanView, props: true },
    { path: '/rankings', name: 'rankings', component: RankingsView },
    { path: '/about', name: 'about', component: AboutView },
    { path: '/submit', name: 'submit', component: SubmitView },
    { path: '/:pathMatch(.*)*', redirect: '/' },
  ],
});

const app = createApp(App);
app.use(router);
app.mount('#app');
