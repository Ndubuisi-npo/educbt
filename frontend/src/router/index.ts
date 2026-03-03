// e.g. src/router/index.ts
import { createRouter, createWebHistory } from 'vue-router';
import Dashboard from '../views/Dashboard.vue';
import SignIn from '../views/SignIn.vue'
import SignUp from '../views/SignUp.vue'

const routes = [
  { path: '/', redirect: '/dashboard' },
  { path: '/dashboard', component: Dashboard },
  { path: '/signin', component: SignIn },
  { path: '/signup', component: SignUp },
  /* …other routes… */
];

export default createRouter({
  history: createWebHistory(),
  routes,
});