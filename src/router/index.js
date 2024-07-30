import { createRouter, createWebHistory } from 'vue-router'
import Auth from '@/views/auth/Auth.vue'
import HomeDash from '@/views/dashboard/Home.vue'
import Lenders from '@/views/dashboard/Lenders.vue'
import Debtors from '@/views/dashboard/Debtors.vue'

import Settings from '@/views/dashboard/Settings.vue'
import Activity from '@/views/dashboard/Activity.vue'
import Statistics from '@/views/dashboard/Stats.vue'
import Expenses from '@/views/dashboard/Expenses.vue'
const routes = [
  {
    path: '/',
    name: 'authPage',
    component: Auth
  },
  {
    path: '/dashboard',
    name: 'homeDashboard',
    component: HomeDash
  },
  {
    path: '/lenders',
    name: 'lendersDashboard',
    component: Lenders
  },
  {
    path: '/debtors',
    name: 'debtorsDashboard',
    component: Debtors
  },
  {
    path: '/settings',
    name: 'settingPage',
    component: Settings
  },
  {
    path: '/activity',
    name: 'activityPage',
    component: Activity
  },
  {
    path: '/statistics',
    name: 'statsPage',
    component: Statistics
  },
  {
    path: '/expenses',
    name: 'expensesPage',
    component: Expenses
  }
]
const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
