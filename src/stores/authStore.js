import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', {

  state: () => ({
    isAuthenticated: true,

    user: {
      id: 1,

      nom: 'Dibaale',

      projection: '2023 B',

      bureau_role: 'PRESIDENT_PROJECTION',

      is_global_member: false
    }
  }),

  getters: {

    isAdmin: (state) =>
      state.user?.bureau_role === 'ADMIN',

    isProjectionPresident: (state) =>
      state.user?.bureau_role === 'PRESIDENT_PROJECTION',

    isGlobalCoordinator: (state) =>
      state.user?.is_global_member === true
  }
})