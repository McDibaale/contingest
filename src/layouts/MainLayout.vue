<template>
  <div class="layout-wrapper">

    <AppSidebar />

    <div class="main-area">

      <AppHeader />

      <main class="content-area">
        <router-view />
      </main>

    </div>

  </div>
</template>

<script setup>
import AppSidebar from '../components/AppSidebar.vue'
import AppHeader from '../components/AppHeader.vue'
</script>

<style scoped>
.layout-wrapper {
  display: flex;
  min-height: 100vh;
  background: #f4f6f9;
}

.main-area {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.content-area {
  flex: 1;
  padding: 1.5rem;
}
</style>