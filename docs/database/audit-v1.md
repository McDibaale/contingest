# ContinGest — Audit SQL V1

Version : 1.0  
Statut : Audit de stabilisation du schéma V1  
Date : 2026-07-06  

---

# 1. Objectif

Cet audit a pour objectif de valider la cohérence globale du schéma SQL V1 de ContinGest avant :

- la mise en place des politiques RLS ;
- la finalisation du RBAC ;
- le développement du frontend applicatif ;
- la mise en production logique du système.

---

# 2. État général du schéma

## 2.1 Conclusion globale

✔ Le schéma est globalement cohérent et exploitable  
✔ Les conventions principales sont respectées  
✔ L’architecture est stable  

---

# 3. Points conformes

## 3.1 Structure des tables

- Préfixe `ctg_` respecté
- Séparation correcte des entités métier
- Clés primaires homogènes (`bigint`)
- Colonnes `created_at / updated_at` présentes
- Utilisation correcte de `jsonb`

---

## 3.2 Modélisation métier

Architecture valide :

- Member
- Projection
- Event
- Payment
- Contribution
- Score
- Transaction
- Proposal

---

## 3.3 Fonctionnalités techniques

- Trigger `updated_at` ✔ fonctionnel
- Trigger audit ✔ fonctionnel (en cours de validation)

---

# 4. Incohérences détectées

---

## 4.1 Critique — Audit log action constraint

### Problème

La contrainte actuelle :

```sql
ctg_audit_log_action_check