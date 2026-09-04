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
    { path: '/', name: 'landing', component: LandingView, meta: { title: '' } },
    { path: '/plans', name: 'index', component: IndexView, meta: { title: 'Plans' } },
    // PlanView sets its own title once the plan has loaded; this is the placeholder until then.
    { path: '/plans/:id', name: 'plan', component: PlanView, props: true, meta: { title: 'Plan' } },
    { path: '/rankings', name: 'rankings', component: RankingsView, meta: { title: 'Rankings' } },
    { path: '/about', name: 'about', component: AboutView, meta: { title: 'About' } },
    { path: '/submit', name: 'submit', component: SubmitView, meta: { title: 'Submit a problem' } },
    { path: '/:pathMatch(.*)*', redirect: '/' },
  ],
});

// One document title per route. Bookmarks, tabs and history entries otherwise all read
// "Plansmith", which is how six pages become indistinguishable in a tab strip.
router.afterEach((to) => {
  const t = to.meta.title as string | undefined;
  document.title = t ? `${t} · Plansmith` : 'Plansmith';
});

const app = createApp(App);
app.use(router);
app.mount('#app');
