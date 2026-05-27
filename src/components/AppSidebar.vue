<template>
  <aside class="sidebar">

    <div class="sidebar-brand">
      ContinGest
    </div>

    <nav class="sidebar-nav">

      <RouterLink to="/" class="nav-item">
        <i class="bi bi-grid"></i>
        Tableau de bord
      </RouterLink>

      <RouterLink to="/members" class="nav-item">
        <i class="bi bi-people"></i>
        Membres
      </RouterLink>

      <RouterLink to="/events" class="nav-item">
        <i class="bi bi-calendar-event"></i>
        Évènements
      </RouterLink>

      <RouterLink to="/treasury" class="nav-item">
        <i class="bi bi-wallet2"></i>
        Caisse
      </RouterLink>

      <RouterLink to="/scores" class="nav-item">
        <i class="bi bi-bar-chart"></i>
        Scores
      </RouterLink>

    </nav>

    <div class="mt-auto pt-4">

      <div class="small text-secondary">
        Projection
      </div>

      <strong>
        {{ auth.user.projection }}
      </strong>

    </div>

  </aside>
</template>

<script setup>
import { useAuthStore } from '../stores/authStore'

const auth = useAuthStore()
</script>

<style scoped>
.sidebar {
  width: 260px;
  background: #1f2937;
  color: white;
  min-height: 100vh;
  padding: 1rem;

  display: flex;
  flex-direction: column;
}

.sidebar-brand {
  font-size: 1.4rem;
  font-weight: bold;
  margin-bottom: 2rem;
}

.sidebar-nav {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.nav-item {
  color: #d1d5db;
  text-decoration: none;
  padding: 0.8rem 1rem;
  border-radius: 10px;
  transition: 0.2s;
}

.nav-item:hover {
  background: #374151;
  color: white;
}

.nav-item i {
  margin-right: 0.7rem;
}
</style>