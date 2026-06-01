# ContinGest — Modèle de Données V1

Version : 1.0
Statut : Validé pour implémentation
Dernière mise à jour : Juin 2026

---

# 1. Objectif

Ce document définit le modèle de données de référence de ContinGest V1.

Il sert de base pour :

- la création des tables PostgreSQL ;
- la mise en place des règles de sécurité (RLS) ;
- le développement frontend ;
- les calculs métier ;
- les futures évolutions du système.

---

# 2. Principes de conception

## 2.1 Préfixes

Toutes les tables utilisent le préfixe :

```text
ctg_
```

Exemples :

```text
ctg_projection
ctg_member
ctg_event
```

---

## 2.2 Préfixes des colonnes

Chaque colonne commence par le préfixe de son entité.

Exemples :

```text
pr_nom
pr_code

me_nom
me_prenom

ev_nom
ev_description
```

---

## 2.3 Horodatage

Toutes les tables métier possèdent :

```sql
date_created_at timestamptz
date_updated_at timestamptz
```

---

## 2.4 Métadonnées

Les entités principales possèdent :

```sql
metadata jsonb
```

afin de permettre des extensions futures sans modification immédiate du schéma.

---

# 3. Entités principales

---

# 3.1 Projection

Table :

```text
ctg_projection
```

Représente une Projection du Contingent.

## Champs principaux

| Champ | Description |
|---------|---------|
| pr_id | Identifiant |
| pr_code | Code unique |
| pr_nom | Nom |
| pr_description | Description |
| pr_logo_url | Logo |
| pr_banner_url | Bannière |
| pr_theme_color | Couleur dominante |
| pr_is_active | Projection active |
| pr_metadata | Données complémentaires |

---

## Relations

Une Projection possède :

- plusieurs membres ;
- plusieurs évènements ;
- plusieurs affectations ;
- plusieurs statistiques.

---

# 3.2 Membre

Table :

```text
ctg_member
```

Représente une personne appartenant au Contingent.

---

## Types possibles

```text
REGULAR
STAFF
```

### REGULAR

Membre régulier.

### STAFF

Personnel d'encadrement.

---

## Champs principaux

| Champ | Description |
|---------|---------|
| me_id | Identifiant |
| me_projection_id | Projection |
| me_type | REGULAR / STAFF |
| me_matricule | Matricule |
| me_nom | Nom |
| me_prenom | Prénom |
| me_grade_id | Grade |
| me_phone | Téléphone |
| me_email | Email |
| me_photo_url | Photo |
| me_is_validated | Validation |
| me_is_active | Actif |
| me_metadata | Données complémentaires |

---

## Règles métier

Un membre STAFF :

- ne peut pas appartenir à un bureau ;
- ne peut pas recevoir d'affectation de gouvernance.

Un membre REGULAR :

- peut appartenir à un bureau projection ;
- peut appartenir au bureau général.

---

# 3.3 Affectation

Table :

```text
ctg_assignment
```

Permet d'attribuer une responsabilité à un membre.

---

## Exemples

Projection :

```text
Président Projection
SG
Trésorier
Communication
Discipline
```

Global :

```text
Président Général
SG Général
Trésorier Général
```

Encadrement :

```text
Directeur FETTA
Chef de Section
Adjoint
Petit gradé
```

---

## Champs principaux

| Champ | Description |
|---------|---------|
| as_id | Identifiant |
| as_member_id | Membre |
| as_role_id | Fonction |
| as_scope_type | GLOBAL / PROJECTION |
| as_scope_id | Identifiant portée |
| as_is_active | Active |

---

# 3.4 Rôle

Table :

```text
ctg_role
```

Contient les fonctions configurables du système.

---

## Types

```text
GOVERNANCE
STAFF
SYSTEM
```

---

## Exemples

### Gouvernance

```text
Président
SG
Trésorier
Communication
Discipline
```

### Encadrement

```text
Directeur FETTA
Chef de Section
Adjoint
```

---

# 3.5 Catégorie

Table :

```text
ctg_category
```

Catégories utilisées pour les cotisations.

---

## Exemples

```text
Officiers
Sous-Officiers
Militaires du Rang
```

---

# 3.6 Grade

Table :

```text
ctg_grade
```

Permet d'associer un grade à une catégorie.

---

## Exemple

```text
Capitaine
Adjudant
Sergent
Soldat
```

---

# 3.7 Évènement

Table :

```text
ctg_event
```

Représente un évènement solidaire.

---

## Portées

### GLOBAL

Évènement du Contingent.

### PROJECTION

Évènement propre à une Projection.

---

## Natures

### GENERAL

Anniversaire.

Retrouvailles.

Activité collective.

### PARTICULAR

Mariage.

Naissance.

Décès.

Maladie.

---

## États

```text
DRAFT
ACTIVE
COMPLETED
CLOSING
CLOSED
ARCHIVED
```

---

## Champs principaux

| Champ | Description |
|---------|---------|
| ev_id | Identifiant |
| ev_scope_type | GLOBAL / PROJECTION |
| ev_scope_id | Projection concernée |
| ev_nature | GENERAL / PARTICULAR |
| ev_title | Titre |
| ev_description | Description |
| ev_status | Statut |
| ev_start_date | Début |
| ev_end_date | Fin |
| ev_metadata | Données complémentaires |

---

# 3.8 Membres concernés

Table :

```text
ctg_event_member
```

---

Permet de rattacher un ou plusieurs membres à un évènement particulier.

---

## Exemple

Décès du père de :

```text
Membre 3
Membre 5
Membre 11
```

---

Cette table remplace totalement l'idée :

```text
3;5;11
```

qui serait difficile à maintenir.

---

# 3.9 Cotisation

Table :

```text
ctg_contribution
```

Montant attendu par catégorie pour un évènement.

---

## Exemple

| Catégorie | Montant |
|------------|----------|
| Officiers | 20 000 |
| Sous-Officiers | 10 000 |
| MDR | 5 000 |

---

# 3.10 Paiement

Table :

```text
ctg_payment
```

Représente un versement réel.

---

## Particularités

Autorise :

- paiements partiels ;
- paiements multiples ;
- régularisations.

---

# 3.11 Transaction

Table :

```text
ctg_transaction
```

Historique financier.

---

## Types

```text
INCOME
EXPENSE
```

---

## Exemples

Entrées :

```text
Cotisations
Dons
Participation exceptionnelle
```

Sorties :

```text
Aide
Transport
Impression
Organisation
```

---

# 3.12 Pièce justificative

Table :

```text
ctg_attachment
```

Permet d'associer :

- image ;
- PDF ;
- document.

à une transaction ou un évènement.

---

# 3.13 Score de solidarité

Table :

```text
ctg_score
```

---

## Types

```text
GLOBAL
PROJECTION
```

---

## Utilisation

Calcul :

```text
Montant payé
/
Montant attendu
```

---

## Impact

Détermine :

- le score du membre ;
- les aides futures.

---

# 3.14 Proposition

Table :

```text
ctg_proposal
```

Suggestion adressée :

- au Bureau Général ;
- au Bureau Projection.

---

## États

```text
PENDING
RECEIVED
ACCEPTED
REJECTED
```

---

# 3.15 Commentaire d'évènement

Table :

```text
ctg_event_feedback
```

Permet :

- noter un évènement ;
- laisser un commentaire ;
- proposer une amélioration.

---

## Conditions possibles

Configurables :

- score minimal ;
- évènement clôturé ;
- encadrement autorisé ou non.

---

# 3.16 Notification

Table :

```text
ctg_notification
```

Notifications internes.

---

## Exemples

```text
Validation
Paiement
Proposition
Commentaire
Clôture
```

---

# 3.17 Paramètres système

Table :

```text
ctg_setting
```

Configuration globale.

---

## Exemples

```text
Activation score solidarité

Prise en compte encadrement

Seuil commentaire

Visibilité statistiques

Durée archivage
```

---

# 3.18 Journal d'audit

Table :

```text
ctg_audit_log
```

Historique des modifications.

---

## Objectifs

Garantir :

- transparence ;
- traçabilité ;
- contrôle.

---

# 4. Relations principales

```text
Projection
├── Membres
├── Evènements
├── Affectations
└── Scores

Membre
├── Paiements
├── Scores
├── Propositions
└── Notifications

Evènement
├── Cotisations
├── Paiements
├── Membres concernés
├── Commentaires
└── Transactions

Catégorie
└── Cotisations

Transaction
└── Pièces jointes
```

---

# 5. Principes d'évolution

Le modèle V1 doit rester :

- simple ;
- stable ;
- cohérent.

Les évolutions futures devront privilégier :

- l'ajout de nouvelles tables ;
- l'ajout de nouvelles relations ;

plutôt que la modification des structures existantes.

---

# 6. Statut

Ce document constitue la référence officielle du modèle de données ContinGest V1.

Toute création SQL doit être conforme à ce document avant implémentation.