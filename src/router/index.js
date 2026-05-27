import { createRouter, createWebHistory } from 'vue-router'

import MainLayout from '../layouts/MainLayout.vue'

const routes = [

  {
    path: '/',

    component: MainLayout,

    children: [

      {
        path: '',
        component: () =>
          import('../pages/dashboard/DashboardPage.vue')
      },

      {
        path: 'members',
        component: () =>
          import('../pages/members/MembersPage.vue')
      },

      {
        path: 'events',
        component: () =>
          import('../pages/events/EventsPage.vue')
      },

      {
        path: 'treasury',
        component: () =>
          import('../pages/treasury/TreasuryPage.vue')
      },

      {
        path: 'scores',
        component: () =>
          import('../pages/scores/ScoresPage.vue')
      }

    ]
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router