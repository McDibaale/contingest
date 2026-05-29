# ContinGest — Architecture Technique V1

# 1. Vision générale

ContinGest est une application web communautaire de gestion de solidarité conçue sous forme de SPA (Single Page Application) métier modulaire.

L’objectif technique principal est de construire :

* une application moderne ;
* légère ;
* maintenable ;
* progressive ;
* accessible depuis mobile et ordinateur ;
* simple à déployer ;
* adaptée à une montée en charge progressive.

---

# 2. Architecture générale

L’architecture actuelle repose sur :

| Couche               | Technologie     |
| -------------------- | --------------- |
| Frontend SPA         | Vue.js 3        |
| Build Tool           | Vite            |
| Routing              | Vue Router      |
| State Management     | Pinia           |
| UI Framework         | Bootstrap 5     |
| Icônes               | Bootstrap Icons |
| Backend-as-a-Service | Supabase        |
| Base de données      | PostgreSQL      |
| Authentification     | Supabase Auth   |
| Versioning           | Git + GitHub    |

---

# 3. Philosophie technique

Le projet suit plusieurs principes fondamentaux :

* simplicité ;
* progressivité ;
* séparation claire des responsabilités ;
* architecture modulaire ;
* évolutivité contrôlée ;
* limitation volontaire de la complexité.

ContinGest n’a pas vocation à devenir :

* un réseau social ;
* une messagerie interne ;
* un système temps réel complexe.

---

# 4. Frontend

## 4.1 Vue.js

Vue.js a été choisi car :

* plus accessible que React ou Angular ;
* très adapté aux SPA métier ;
* excellent pour une montée progressive en compétences ;
* extrêmement bien documenté.

---

## 4.2 Structure actuelle du projet

Structure générale :

```text
contingest/
│
├── docs/
├── public/
├── src/
│   ├── assets/
│   ├── components/
│   ├── layouts/
│   ├── pages/
│   ├── router/
│   ├── services/
│   ├── stores/
│   ├── styles/
│   ├── App.vue
│   └── main.js
│
├── package.json
├── vite.config.js
└── README.md
```

---

## 4.3 Layout principal

L’application repose actuellement sur :

* une sidebar ;
* un header ;
* une zone de contenu centrale.

L’objectif UX est :

* clarté ;
* rapidité d’accès ;
* compatibilité mobile future ;
* lisibilité institutionnelle.

---

# 5. Backend

## 5.1 Supabase

Supabase a été choisi car il fournit :

* PostgreSQL ;
* authentification ;
* API REST automatique ;
* sécurité RLS ;
* stockage fichiers ;
* simplicité de déploiement.

Cela permet :

* d’éviter un backend Laravel complexe en V1 ;
* de développer rapidement ;
* de se concentrer sur les règles métier.

---

## 5.2 PostgreSQL

PostgreSQL est utilisé comme SGBDR principal.

Les conventions retenues :

* préfixe `ctg_` pour les tables ;
* préfixe court pour les colonnes ;
* timestamps normalisés ;
* usage de `jsonb` pour les métadonnées extensibles.

---

# 6. Authentification

Tous les utilisateurs doivent posséder un compte.

Le workflow actuel prévoit :

* inscription autonome ;
* validation hiérarchique ;
* séparation des périmètres d’accès.

---

# 7. Architecture des permissions

Le système repose sur :

* un seul compte par utilisateur ;
* des affectations multiples contextualisées ;
* des permissions basées sur le périmètre.

Exemples :

* projection ;
* global ;
* évènement.

---

# 8. Gestion des périmètres

Le projet distingue plusieurs niveaux :

| Scope      | Description           |
| ---------- | --------------------- |
| GLOBAL     | Contingent entier     |
| PROJECTION | Projection spécifique |
| EVENT      | Évènement spécifique  |

Cette architecture permet :

* réutilisation logique ;
* cohérence fonctionnelle ;
* réduction de duplication métier.

---

# 9. Notifications

ContinGest prévoit un système de notifications simples pour :

* validations ;
* propositions ;
* évènements ;
* paiements ;
* commentaires ;
* clôtures.

Le système temps réel avancé n’est pas prioritaire pour la V1.

---

# 10. Gestion documentaire

Le projet intègre progressivement :

* documentation métier ;
* documentation technique ;
* règles fonctionnelles ;
* historique architectural.

Le dossier `docs/` devient la référence centrale du projet.

---

# 11. Versioning

Le projet utilise :

* Git ;
* GitHub.

Objectifs :

* sauvegarde ;
* historique ;
* sécurité ;
* traçabilité ;
* évolution maîtrisée.

---

# 12. Environnements

Le projet prévoit trois espaces :

| Environnement | Rôle                    |
| ------------- | ----------------------- |
| STAGE         | maquettes et prototypes |
| DEV           | développement principal |
| PROD          | production réelle       |

---

# 13. Base de données

La base de données est construite progressivement.

Principe :

* une table à la fois ;
* validation métier avant complexification ;
* stabilité avant optimisation.

---

# 14. Philosophie de développement

Le projet suit une approche :

* incrémentale ;
* maîtrisée ;
* documentée ;
* orientée métier.

L’objectif principal est :
de terminer une V1 réellement utilisable avant toute sophistication avancée.
