# ContinGest — Phase 2A : Infrastructure SQL

## Objectif

La Phase 2A met en place l'ensemble des mécanismes SQL génériques qui serviront de fondation au projet ContinGest.

Aucune règle métier n'est implémentée à ce stade.

L'objectif est de disposer d'une infrastructure réutilisable, indépendante des fonctionnalités applicatives.

---

# Contenu

## 01_functions.sql

Contient les fonctions PostgreSQL communes :

- ctg_set_updated_at()
- ctg_audit_trigger()

---

## 02_updated_at_triggers.sql

Déploie les triggers responsables de la mise à jour automatique des colonnes :

- *_updated_at

sur toutes les tables concernées.

---

## 03_audit_triggers.sql

Déploie les triggers d'audit permettant d'alimenter automatiquement la table :

- ctg_audit_log

pour les opérations :

- INSERT
- UPDATE
- DELETE

---

# Validation

Les mécanismes suivants ont été testés avec succès.

## updated_at

✔ Modification automatique de la colonne *_updated_at.

---

## Audit INSERT

✔ Création d'une entrée dans ctg_audit_log.

---

## Audit UPDATE

✔ Sauvegarde de l'ancien état (al_old_data).

✔ Sauvegarde du nouvel état (al_new_data).

---

## Audit DELETE

✔ Sauvegarde complète de l'ancien enregistrement.

---

# Tables couvertes

## updated_at

- ctg_projection
- ctg_member
- ctg_grade
- ctg_category
- ctg_role
- ctg_assignment
- ctg_event
- ctg_contribution
- ctg_payment
- ctg_score
- ctg_proposal
- ctg_notification
- ctg_transaction
- ctg_attachment
- ctg_setting
- ctg_event_feedback

## audit

- ctg_member
- ctg_assignment
- ctg_attachment
- ctg_contribution
- ctg_event
- ctg_notification
- ctg_payment
- ctg_proposal
- ctg_score
- ctg_setting
- ctg_transaction

---

# Statut

Phase 2A : **Terminée et validée.**

---

# Phase suivante

Phase 2B — Automatisation des règles métier.

Cette phase couvrira notamment :

- calcul automatique du score de solidarité ;
- cohérence des contributions ;
- automatisation des paiements ;
- synchronisation entre les tables ;
- contraintes métier avancées.