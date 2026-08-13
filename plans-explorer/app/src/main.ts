import { createApp } from 'vue';
import { createRouter, createWebHashHistory } from 'vue-router';
import App from './App.vue';
import './styles/tokens.css';
import './styles/app.css';

import IndexView from './views/IndexView.vue';
import PlanView from './views/PlanView.vue';
import RankingsView from './views/RankingsView.vue';
import AboutView from './views/AboutView.vue';

const router = createRouter({
  history: createWebHashHistory(),
  routes: [
    { path: '/', name: 'index', component: IndexView },
    { path: '/plans/:id', name: 'plan', component: PlanView, props: true },
    { path: '/rankings', name: 'rankings', component: RankingsView },
    { path: '/about', name: 'about', component: AboutView },
    { path: '/:pathMatch(.*)*', redirect: '/' },
  ],
});

const app = createApp(App);
app.use(router);
app.mount('#app');
