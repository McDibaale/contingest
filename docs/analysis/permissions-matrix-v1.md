# ContinGest — Matrice des Permissions (Version 1)

## 1. Objectif

Ce document définit l'ensemble des permissions fonctionnelles de **ContinGest V1**.

Il constitue la référence officielle pour :

* l'authentification ;
* les autorisations ;
* les règles RLS PostgreSQL ;
* l'interface utilisateur ;
* les contrôles métier.

---

## 2. Acteurs

| Code      | Acteur                  |
| --------- | ----------------------- |
| **ADMIN** | Administrateur système  |
| **BG**    | Bureau Général          |
| **BP**    | Bureau de Projection    |
| **MR**    | Membre Régulier         |
| **ENC**   | Personnel d'Encadrement |

---

## 3. Principes Fondamentaux

### 3.1 Transparence Globale

Tous les membres du Contingent peuvent consulter :

* les évènements globaux ;
* les statistiques globales ;
* les scores globaux ;
* les finances globales ;
* les taux de participation globaux.

---

### 3.2 Isolation Projectionnelle

Les données internes d'une Projection :

* sont visibles uniquement par ses membres ;
* ne sont pas accessibles aux autres Projections ;
* ne sont pas accessibles au Bureau Général.

---

### 3.3 Administrateur

L'Administrateur dispose d'un accès complet à l'ensemble du système.

#### Missions

* maintenance ;
* dépannage ;
* audit ;
* contrôle ;
* supervision ;
* récupération des données.

L'Administrateur n'est pas considéré comme un acteur métier.

---

### 3.4 Personnel d'Encadrement

Le personnel d'encadrement :

* appartient à une Projection ;
* peut participer aux évènements ;
* peut cotiser ;
* peut consulter les données autorisées.

En revanche, il :

* ne peut pas appartenir à un Bureau ;
* ne peut pas recevoir de responsabilités administratives.

---

# 4. Gestion des Comptes

| Action                                    | ADMIN |  BG |  BP |  MR | ENC |
| ----------------------------------------- | :---: | :-: | :-: | :-: | :-: |
| Créer son compte                          |   ✅   |  ✅  |  ✅  |  ✅  |  ✅  |
| Se connecter                              |   ✅   |  ✅  |  ✅  |  ✅  |  ✅  |
| Modifier son profil                       |   ✅   |  ✅  |  ✅  |  ✅  |  ✅  |
| Réinitialiser son mot de passe            |   ✅   |  ✅  |  ✅  |  ✅  |  ✅  |
| Valider un membre de Projection           |   ✅   |  ❌  |  ✅  |  ❌  |  ❌  |
| Valider un membre du Bureau de Projection |   ✅   |  ❌  |  ❌  |  ❌  |  ❌  |
| Désactiver un compte de Projection        |   ✅   |  ❌  |  ✅  |  ❌  |  ❌  |
| Supprimer un compte de Projection         |   ✅   |  ❌  |  ✅  |  ❌  |  ❌  |

---

# 5. Gestion des Projections

| Action                                         | ADMIN |         BG         |         BP         |         MR         |         ENC        |
| ---------------------------------------------- | :---: | :----------------: | :----------------: | :----------------: | :----------------: |
| Créer une Projection                           |   ✅   |          ❌         |          ❌         |          ❌         |          ❌         |
| Modifier une Projection                        |   ✅   |          ❌         |          ❌         |          ❌         |          ❌         |
| Désactiver une Projection                      |   ✅   |          ❌         |          ❌         |          ❌         |          ❌         |
| Consulter la liste des Projections             |   ✅   |          ✅         |          ✅         |          ✅         |          ✅         |
| Consulter les détails d'une Projection interne |   ✅   | Selon appartenance | Selon appartenance | Selon appartenance | Selon appartenance |
| Consulter les détails d'une Projection externe |   ✅   |          ❌         |          ❌         |          ❌         |          ❌         |

---

# 6. Gestion des Membres

| Action                                       | ADMIN |         BG         |  BP |  MR | ENC |
| -------------------------------------------- | :---: | :----------------: | :-: | :-: | :-: |
| Créer un membre                              |   ✅   |          ❌         |  ✅  |  ❌  |  ❌  |
| Modifier un membre                           |   ✅   |          ❌         |  ✅  |  ❌  |  ❌  |
| Désactiver un membre                         |   ✅   |          ❌         |  ✅  |  ❌  |  ❌  |
| Consulter les membres de sa Projection       |   ✅   | Selon appartenance |  ✅  |  ✅  |  ✅  |
| Consulter les membres d'une autre Projection |   ✅   |          ❌         |  ❌  |  ❌  |  ❌  |

---

# 7. Gestion des Évènements

## 7.1 Évènements Globaux

| Action    | ADMIN |  BG |  BP |  MR | ENC |
| --------- | :---: | :-: | :-: | :-: | :-: |
| Créer     |   ✅   |  ✅  |  ❌  |  ❌  |  ❌  |
| Modifier  |   ✅   |  ✅  |  ❌  |  ❌  |  ❌  |
| Activer   |   ✅   |  ✅  |  ❌  |  ❌  |  ❌  |
| Clôturer  |   ✅   |  ✅  |  ❌  |  ❌  |  ❌  |
| Archiver  |   ✅   |  ✅  |  ❌  |  ❌  |  ❌  |
| Consulter |   ✅   |  ✅  |  ✅  |  ✅  |  ✅  |

---

## 7.2 Évènements Projectionnels

| Action    | ADMIN |         BG         |  BP |  MR | ENC |
| --------- | :---: | :----------------: | :-: | :-: | :-: |
| Créer     |   ✅   |          ❌         |  ✅  |  ❌  |  ❌  |
| Modifier  |   ✅   |          ❌         |  ✅  |  ❌  |  ❌  |
| Activer   |   ✅   |          ❌         |  ✅  |  ❌  |  ❌  |
| Clôturer  |   ✅   |          ❌         |  ✅  |  ❌  |  ❌  |
| Archiver  |   ✅   |          ❌         |  ✅  |  ❌  |  ❌  |
| Consulter |   ✅   | Selon appartenance |  ✅  |  ✅  |  ✅  |

---

# 8. Gestion Financière

## 8.1 Portée Globale

| Action                              | ADMIN |  BG |  BP |  MR | ENC |
| ----------------------------------- | :---: | :-: | :-: | :-: | :-: |
| Définir les cotisations             |   ✅   |  ✅  |  ❌  |  ❌  |  ❌  |
| Enregistrer un paiement             |   ✅   |  ✅  |  ❌  |  ❌  |  ❌  |
| Consulter la caisse globale         |   ✅   |  ✅  |  ✅  |  ✅  |  ✅  |
| Consulter les statistiques globales |   ✅   |  ✅  |  ✅  |  ✅  |  ✅  |

---

## 8.2 Portée Projectionnelle

| Action                                     | ADMIN |         BG         |  BP |  MR | ENC |
| ------------------------------------------ | :---: | :----------------: | :-: | :-: | :-: |
| Définir les cotisations                    |   ✅   |          ❌         |  ✅  |  ❌  |  ❌  |
| Enregistrer un paiement                    |   ✅   |          ❌         |  ✅  |  ❌  |  ❌  |
| Consulter la caisse de sa Projection       |   ✅   | Selon appartenance |  ✅  |  ✅  |  ✅  |
| Consulter la caisse d'une autre Projection |   ✅   |          ❌         |  ❌  |  ❌  |  ❌  |

---

# 9. Gestion des Scores

## 9.1 Score Global

| Action    | ADMIN |  BG |  BP |  MR | ENC |
| --------- | :---: | :-: | :-: | :-: | :-: |
| Consulter |   ✅   |  ✅  |  ✅  |  ✅  |  ✅  |

---

## 9.2 Score Projectionnel

| Action                     | ADMIN |         BG         |  BP |  MR | ENC |
| -------------------------- | :---: | :----------------: | :-: | :-: | :-: |
| Consulter le score interne |   ✅   | Selon appartenance |  ✅  |  ✅  |  ✅  |
| Consulter le score externe |   ✅   |          ❌         |  ❌  |  ❌  |  ❌  |

---

# 10. Gestion des Propositions

| Action                                      | ADMIN |  BG |  BP |  MR | ENC |
| ------------------------------------------- | :---: | :-: | :-: | :-: | :-: |
| Soumettre une proposition globale           |   ✅   |  ✅  |  ✅  |  ✅  |  ✅  |
| Soumettre une proposition projectionnelle   |   ✅   |  ❌  |  ✅  |  ✅  |  ✅  |
| Consulter les propositions globales         |   ✅   |  ✅  |  ❌  |  ❌  |  ❌  |
| Consulter les propositions projectionnelles |   ✅   |  ❌  |  ✅  |  ❌  |  ❌  |
| Accepter une proposition                    |   ✅   |  ✅  |  ✅  |  ❌  |  ❌  |
| Rejeter une proposition                     |   ✅   |  ✅  |  ✅  |  ❌  |  ❌  |

---

# 11. Gestion des Notifications

| Action                                            | ADMIN |  BG |  BP |  MR | ENC |
| ------------------------------------------------- | :---: | :-: | :-: | :-: | :-: |
| Recevoir des notifications                        |   ✅   |  ✅  |  ✅  |  ✅  |  ✅  |
| Recevoir une notification de validation de compte |   ✅   |  ❌  |  ✅  |  ❌  |  ❌  |
| Recevoir une notification de proposition          |   ✅   |  ✅  |  ✅  |  ❌  |  ❌  |
| Recevoir une notification de nouvel évènement     |   ✅   |  ✅  |  ✅  |  ✅  |  ✅  |
| Recevoir une notification de nouveau paiement     |   ✅   |  ✅  |  ✅  |  ✅  |  ✅  |

---

# 12. Gestion des Paramètres Système

| Action                           | ADMIN |  BG |  BP |  MR | ENC |
| -------------------------------- | :---: | :-: | :-: | :-: | :-: |
| Consulter les paramètres système |   ✅   |  ❌  |  ❌  |  ❌  |  ❌  |
| Modifier les paramètres système  |   ✅   |  ❌  |  ❌  |  ❌  |  ❌  |

---

# 13. Philosophie de Sécurité

ContinGest applique les principes suivants :

1. Transparence globale ;
2. Autonomie des Projections ;
3. Cloisonnement des données internes ;
4. Traçabilité des actions ;
5. Contrôle hiérarchique des validations ;
6. Accès administratif total pour la maintenance.

L'Administrateur conserve un accès complet à l'ensemble des données afin de garantir :

* la stabilité du système ;
* la continuité du service ;
* la récupération des données ;
* les opérations d'audit et de supervision.
