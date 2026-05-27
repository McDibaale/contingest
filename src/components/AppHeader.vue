<template>
  <header class="app-header">

    <div>
      <strong>
        Tableau de bord
      </strong>
    </div>

    <div class="header-user">
      Utilisateur connecté
    </div>

  </header>
</template>

<style scoped>
.app-header {
  height: 70px;
  background: white;
  border-bottom: 1px solid #e5e7eb;

  display: flex;
  align-items: center;
  justify-content: space-between;

  padding: 0 1.5rem;
}

.header-user {
  color: #6b7280;
}
</style>