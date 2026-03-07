// e.g. src/router/index.ts
import { createRouter, createWebHistory } from 'vue-router';
import Dashboard from '../views/Dashboard.vue';
import Teachers from '../components/pages/schooladmincomponents/Teachers.vue'
import AddTeacher from '../components/pages/schooladmincomponents/AddTeacher.vue'
import Students from '../components/pages/schooladmincomponents/Students.vue'
import AddStudent from '@/components/pages/schooladmincomponents/AddStudent.vue';
import SignIn from '../views/SignIn.vue'
import SignUp from '../views/SignUp.vue'

const routes = [
  { path: '/', redirect: '/dashboard' },
  { path: '/dashboard', component: Dashboard },
  { path: '/teachers', component: Teachers},
  { path: '/teachers/add', component: AddTeacher },
  { path: '/students', component: Students },
  { path: '/students/add', component: AddStudent},
  { path: '/signin', component: SignIn },
  { path: '/signup', component: SignUp },
  /* …other routes… */
];

export default createRouter({
  history: createWebHistory(),
  routes,
});
