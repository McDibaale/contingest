# ContinGest — Architecture Technique V1

## 1. Objectif

Ce document décrit l'architecture technique de référence de ContinGest V1.

Il définit :

* les technologies retenues ;
* les principes d'architecture ;
* l'organisation du code ;
* la stratégie de déploiement ;
* les conventions techniques ;
* les orientations d'évolution futures.

Ce document constitue la référence technique principale du projet.

---

# 2. Vision générale

ContinGest est une application web de gestion communautaire et de solidarité destinée à un Contingent composé de plusieurs Projections.

L'application doit permettre :

* la gestion des membres ;
* la gestion des Projections ;
* la gestion des évènements ;
* la gestion des cotisations ;
* la gestion des finances ;
* le calcul des scores de solidarité ;
* la transparence globale ;
* l'autonomie des Projections.

L'objectif principal est de produire une plateforme :

* simple ;
* robuste ;
* maintenable ;
* sécurisée ;
* évolutive.

---

# 3. Architecture générale

ContinGest repose sur une architecture moderne de type SPA.

```text
Utilisateur
       │
       ▼
Frontend Vue.js
       │
       ▼
Supabase
 ├─ Auth
 ├─ PostgreSQL
 ├─ Storage
 └─ API
```

Cette architecture permet :

* un développement rapide ;
* une maintenance simplifiée ;
* un coût nul ou très faible ;
* une mise en production rapide.

---

# 4. Technologies retenues

| Couche            | Technologie      |
| ----------------- | ---------------- |
| Frontend          | Vue.js 3         |
| Build Tool        | Vite             |
| Routing           | Vue Router       |
| State Management  | Pinia            |
| UI Framework      | Bootstrap 5      |
| Icônes            | Bootstrap Icons  |
| Backend           | Supabase         |
| Base de données   | PostgreSQL       |
| Authentification  | Supabase Auth    |
| Stockage fichiers | Supabase Storage |
| Versioning        | Git              |
| Dépôt distant     | GitHub           |

---

# 5. Pourquoi Vue.js ?

Vue.js a été retenu car :

* plus simple à apprendre que Angular ;
* plus rapide à prendre en main que React ;
* parfaitement adapté aux applications métier ;
* très bien documenté ;
* parfaitement compatible avec Supabase.

Pour ContinGest, Vue.js représente le meilleur compromis entre :

* simplicité ;
* productivité ;
* évolutivité.

---

# 6. Pourquoi Supabase ?

Supabase a été retenu car il fournit :

* PostgreSQL ;
* authentification ;
* stockage de fichiers ;
* API automatique ;
* sécurité RLS ;
* hébergement gratuit pour démarrer.

Cela évite de développer immédiatement :

* une API Laravel ;
* une gestion des comptes complexe ;
* une couche backend personnalisée.

L'objectif est de se concentrer d'abord sur le métier.

---

# 7. Architecture métier

L'application est organisée autour de trois niveaux fonctionnels.

## Niveau 1 : Global

Portée :

* Contingent ;
* Bureau Général ;
* évènements globaux ;
* caisse globale ;
* statistiques globales.

## Niveau 2 : Projection

Portée :

* Projection spécifique ;
* Bureau de Projection ;
* évènements internes ;
* caisse interne ;
* statistiques internes.

## Niveau 3 : Individuel

Portée :

* membre ;
* paiements ;
* scores ;
* notifications ;
* propositions.

---

# 8. Gestion des accès

Le système repose sur une authentification obligatoire.

Tous les utilisateurs possèdent un compte unique.

### Validation des membres réguliers

Validation par :

* Bureau de leur Projection.

### Validation du personnel d'encadrement

Validation par :

* Bureau de leur Projection.

### Validation des membres de Bureau

Validation par :

* Administrateur.

---

# 9. Architecture des rôles

Un utilisateur possède un seul compte.

Les responsabilités sont attribuées par affectation.

Exemples :

* Président Projection ;
* Trésorier Projection ;
* Président Général ;
* Trésorier Général.

Cette approche évite :

* les comptes multiples ;
* les doublons ;
* les conflits de permissions.

---

# 10. Gestion des permissions

Le système repose sur :

* les rôles ;
* la portée ;
* les affectations.

Les permissions sont configurables depuis l'administration.

Aucune modification du code ne doit être nécessaire pour modifier une permission métier.

---

# 11. Gestion des données

## Conventions SQL

### Tables

Préfixe :

```text
ctg_
```

Exemples :

```text
ctg_projection
ctg_member
ctg_event
ctg_payment
```

### Colonnes

Préfixe basé sur la table.

Exemple :

```text
pr_id
pr_nom
pr_logo_url

me_id
me_nom
me_email
```

### Métadonnées

Toutes les tables principales possèdent :

```sql
metadata jsonb
```

afin de permettre des extensions futures sans migration immédiate.

---

# 12. Gestion des dates

Convention retenue :

```sql
timestamp with time zone
```

Exemples :

```text
created_at
updated_at
validated_at
closed_at
```

Cette approche :

* simplifie les requêtes ;
* évite les incohérences date/heure ;
* facilite les audits.

---

# 13. Gestion documentaire

Le projet possède un dossier :

```text
docs/
```

Structure actuelle :

```text
docs/
├── analysis/
├── architecture/
├── business-rules/
├── database/
├── deployment/
└── changelog/
```

La documentation fait partie intégrante du projet.

Toute évolution majeure doit être documentée.

---

# 14. Versioning

Le projet utilise :

* Git ;
* GitHub.

Chaque évolution importante doit être :

1. développée ;
2. testée ;
3. documentée ;
4. commitée.

---

# 15. Environnements

## STAGE

Utilisé pour :

* maquettes ;
* prototypes ;
* expérimentations UX.

## DEV

Utilisé pour :

* développement principal ;
* intégration ;
* tests fonctionnels.

## PROD

Utilisé pour :

* exploitation réelle ;
* données officielles ;
* utilisateurs finaux.

---

# 16. Notifications

ContinGest intègre un système de notifications internes pour :

* validations ;
* évènements ;
* paiements ;
* propositions ;
* commentaires ;
* clôtures.

La V1 ne nécessite pas de temps réel avancé.

---

# 17. Sécurité

Principes fondamentaux :

* authentification obligatoire ;
* validation hiérarchique ;
* cloisonnement des Projections ;
* transparence des données globales ;
* historisation des actions ;
* auditabilité.

L'Administrateur conserve un accès complet à l'ensemble du système pour :

* le support ;
* le dépannage ;
* la maintenance ;
* la récupération des données.

---

# 18. Philosophie de développement

ContinGest V1 suit une stratégie :

* métier avant technique ;
* simplicité avant sophistication ;
* stabilité avant optimisation ;
* documentation avant industrialisation.

L'objectif est de disposer rapidement d'une première version exploitable tout en conservant une base solide pour les évolutions futures.

---

# 19. Évolutions futures envisagées

Les versions futures pourront intégrer :

* application mobile ;
* API métier dédiée ;
* moteur avancé de statistiques ;
* workflow de validation configurable ;
* tableaux de bord analytiques ;
* export PDF avancé ;
* archivage intelligent ;
* intégration WhatsApp.

Ces fonctionnalités sont volontairement exclues du périmètre de la V1 afin de garantir la réussite du projet.
