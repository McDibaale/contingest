# ContinGest
# Phase 2A — Infrastructure SQL

Version : 1.0
Date : 08/07/2026
Branche : feature/sql-phase-2

---

# Objectif

Cette phase avait pour objectif de mettre en place les mécanismes SQL génériques qui serviront de fondation à toute la logique métier de ContinGest.

Les mécanismes développés sont totalement indépendants des règles métier et peuvent être réutilisés sur toutes les tables du projet.

---

# Fonctionnalités réalisées

## 1. Gestion automatique des dates

Fonction :

public.ctg_set_updated_at()

Objectif :

Mettre automatiquement à jour le champ *_updated_at lors de chaque UPDATE.

Tables concernées :

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

Résultat :

✅ Fonction opérationnelle.

---

## 2. Audit générique

Fonction :

public.ctg_audit_trigger()

Objectif :

Journaliser automatiquement :

- INSERT
- UPDATE
- DELETE

dans la table :

ctg_audit_log

Caractéristiques :

- fonction unique
- indépendante des tables
- clé primaire transmise via TG_ARGV
- stockage JSONB
- compatible avec toutes les tables

---

## 3. Triggers d'audit

Déployés sur :

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

# Campagne de validation

## Test INSERT

Résultat :

✅ validé

Contrôles :

- al_action
- al_entity
- al_entity_id
- al_new_data

---

## Test UPDATE

Résultat :

✅ validé

Contrôles :

- al_old_data
- al_new_data
- updated_at

---

## Test DELETE

Résultat :

✅ validé

Contrôles :

- al_old_data
- al_new_data = NULL

---

# Corrections apportées

Pendant cette phase, plusieurs anomalies ont été détectées puis corrigées.

## 1

Actions d'audit incompatibles

INSERT → CREATE

Correction :

utilisation des vraies opérations PostgreSQL.

---

## 2

Fonction non générique

Correction :

utilisation de TG_ARGV.

---

## 3

Triggers incomplets

Correction :

ajout de la clé primaire dans chaque trigger.

---

## 4

Priorité des opérateurs JSONB

Correction :

ajout des parenthèses pour l'extraction.

---

## 5

UPDATE ne conservait pas OLD

Correction :

ajout de OLD dans les opérations UPDATE.

---

# État final

Infrastructure SQL :

✅ validée

updated_at :

✅ validé

Audit :

✅ validé

Tests :

✅ validés

Phase :

✅ TERMINÉE

---

# Suite du projet

Phase suivante :

Phase 2B — Logique métier SQL

- calcul automatique des scores
- règles métier
- synchronisation des tables
- automatisation métier