<template>
  <div>

    <div class="mb-4">

      <h1 class="fw-bold">
        Tableau de bord
      </h1>

      <p class="text-muted">
        Bienvenue sur ContinGest.
      </p>

    </div>

    <div class="alert alert-primary">

      Projection :
      <strong>
        {{ auth.user.projection }}
      </strong>

    </div>

    <div class="row g-4">

      <div class="col-md-4">

        <div class="card border-0 shadow-sm">

          <div class="card-body">

            <h6 class="text-muted">
              Évènements actifs
            </h6>

            <h2 class="fw-bold">
              0
            </h2>

          </div>

        </div>

      </div>

      <div class="col-md-4">

        <div class="card border-0 shadow-sm">

          <div class="card-body">

            <h6 class="text-muted">
              Taux global
            </h6>

            <h2 class="fw-bold">
              0%
            </h2>

          </div>

        </div>

      </div>

      <div class="col-md-4">

        <div class="card border-0 shadow-sm">

          <div class="card-body">

            <h6 class="text-muted">
              Caisse globale
            </h6>

            <h2 class="fw-bold">
              0 FCFA
            </h2>

          </div>

        </div>

      </div>

    </div>

  </div>
</template>

<script setup>
import { useAuthStore } from '../../stores/authStore'

const auth = useAuthStore()
</script>