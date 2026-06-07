# ContinGest — Modèle de Données V1 Final

## Informations générales

**Projet :** ContinGest
**Version :** V1 Final
**Statut :** Validé
**Date :** Juin 2026 (08/06/2026)

---

# 1. Objectif

Ce document décrit le modèle de données final de ContinGest V1.

Il constitue la référence officielle du schéma de base de données avant le démarrage des développements avancés :

* triggers ;
* fonctions métier ;
* statistiques ;
* RBAC / RLS ;
* automatisations.

---

# 2. Principes généraux

## 2.1 Contingent unique

ContinGest V1 gère un seul contingent.

Si un autre contingent souhaite utiliser l'application, une nouvelle instance indépendante devra être déployée.

---

## 2.2 Projections

Les projections disposent d'une autonomie de gestion interne.

Cependant, les informations globales du contingent restent visibles à l'ensemble des membres :

* statistiques ;
* scores ;
* caisse ;
* activités globales ;
* informations générales.

---

## 2.3 Convention de nommage

### Tables

Préfixe :

```text
ctg_
```

Exemples :

```text
ctg_member
ctg_event
ctg_payment
```

### Clés primaires

Convention :

```text
xx_id
```

Exemples :

```text
mb_id
pr_id
rl_id
```

Exceptions historiques conservées :

```text
asg_id
evt_id
```

---

# 3. Tables du système

## Référentiel

* ctg_projection
* ctg_category
* ctg_grade
* ctg_role

---

## Membres

* ctg_member
* ctg_assignment

---

## Évènements

* ctg_event
* ctg_contribution
* ctg_payment
* ctg_transaction

---

## Scores

* ctg_score

---

## Participation

* ctg_proposal
* ctg_event_feedback

---

## Communication

* ctg_notification

---

## Documents

* ctg_attachment

---

## Administration

* ctg_setting
* ctg_audit_log

---

# 4. Relations principales

```text
Projection
 └── Membres

Catégorie
 └── Grades

Membre
 ├── Affectations
 ├── Paiements
 ├── Notifications
 ├── Propositions
 ├── Score
 └── Pièces jointes

Évènement
 ├── Contributions
 ├── Transactions
 ├── Feedbacks
 └── Pièces jointes

Contribution
 └── Paiements

Paiement
 └── Transaction

Proposition
 └── Pièces jointes
```

---

# 5. Contraintes métier importantes

## Évènements

Un évènement :

* GLOBAL ne possède pas de projection ;
* PROJECTION doit obligatoirement appartenir à une projection.

---

## Contributions

Une seule contribution peut exister pour un couple :

```text
(évènement, catégorie)
```

---

## Feedback

Un membre ne peut déposer qu'un seul feedback par évènement.

---

## Pièces jointes

Une pièce jointe doit appartenir à un seul propriétaire métier :

* transaction ;
* évènement ;
* proposition.

Jamais plusieurs simultanément.

---

## Scores

La colonne :

```text
ctg_score.pr_id
```

est volontairement conservée en V1 pour simplifier certaines requêtes statistiques.

Règle métier :

```text
ctg_score.pr_id
=
ctg_member.pr_id
```

pour le membre référencé par :

```text
ctg_score.mb_id
```

Cette redondance pourra être supprimée dans une version ultérieure.

---

# 6. Sécurité

Toutes les tables métier possèdent :

```text
ROW LEVEL SECURITY (RLS)
```

activé.

Les politiques d'accès détaillées seront définies dans la phase RBAC/RLS.

---

# 7. Évolutions prévues

Phase 2 :

* trigger updated_at ;
* audit automatique ;
* calcul des scores ;
* vues statistiques ;
* RBAC / RLS complet.

---

# 8. Statut

Le présent document constitue la référence officielle du modèle de données ContinGest V1.
