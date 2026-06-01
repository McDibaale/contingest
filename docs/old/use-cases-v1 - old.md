# ContinGest — Cas d’Utilisation V1

# 1. Objectif

Ce document décrit les principaux cas d’utilisation de ContinGest V1.

L’objectif est de :

* stabiliser les besoins métier ;
* identifier les acteurs ;
* définir les périmètres ;
* préparer le modèle de données ;
* préparer les permissions.

---

# 2. Acteurs principaux

## 2.1 Administrateur système

Responsable technique global de l’application.

---

## 2.2 Bureau Général

Responsable :

* des activités globales ;
* des évènements globaux ;
* de la caisse globale ;
* des statistiques globales.

---

## 2.3 Bureau de Projection

Responsable :

* des membres de la Projection ;
* des validations ;
* des évènements internes ;
* de la caisse projectionnelle.

---

## 2.4 Membre régulier

Utilisateur standard appartenant à une Projection.

---

## 2.5 Personnel d’encadrement

Membre spécifique d’une Projection ne pouvant pas appartenir à un Bureau.

---

# 3. Gestion des comptes

| Cas d’utilisation           | Acteurs           |
| --------------------------- | ----------------- |
| Créer son compte            | Tous              |
| Se connecter                | Tous              |
| Réinitialiser mot de passe  | Tous              |
| Valider un membre           | Bureau Projection |
| Valider un membre du bureau | Administrateur    |
| Désactiver un compte        | Bureau / Admin    |

---

# 4. Gestion des Projections

| Cas d’utilisation                              | Acteurs                  |
| ---------------------------------------------- | ------------------------ |
| Créer une Projection                           | Administrateur           |
| Modifier une Projection                        | Administrateur           |
| Désactiver une Projection                      | Administrateur           |
| Voir les informations globales des Projections | Tous                     |
| Voir les détails internes d’une Projection     | Membres de la Projection |

---

# 5. Gestion des membres

| Cas d’utilisation                      | Acteurs            |
| -------------------------------------- | ------------------ |
| Créer un membre                        | Bureau Projection  |
| Modifier un membre                     | Bureau Projection  |
| Désactiver un membre                   | Bureau Projection  |
| Consulter les membres de sa Projection | Membres Projection |
| Consulter les statistiques globales    | Tous               |

---

# 6. Gestion des évènements

| Cas d’utilisation                       | Acteurs            |
| --------------------------------------- | ------------------ |
| Créer un évènement projectionnel        | Bureau Projection  |
| Créer un évènement global               | Bureau Général     |
| Modifier un évènement                   | Bureau concerné    |
| Activer un évènement                    | Bureau concerné    |
| Clôturer un évènement                   | Bureau concerné    |
| Archiver un évènement                   | Bureau concerné    |
| Consulter les évènements globaux        | Tous               |
| Consulter les évènements projectionnels | Membres Projection |

---

# 7. Gestion des cotisations

| Cas d’utilisation                      | Acteurs            |
| -------------------------------------- | ------------------ |
| Définir les montants par catégorie     | Bureau concerné    |
| Enregistrer un paiement                | Bureau concerné    |
| Voir ses cotisations                   | Tous               |
| Voir les statistiques de participation | Tous               |
| Voir la caisse projectionnelle         | Membres Projection |
| Voir la caisse globale                 | Tous               |

---

# 8. Gestion des scores

| Cas d’utilisation            | Acteurs            |
| ---------------------------- | ------------------ |
| Calculer score projectionnel | Système            |
| Calculer score global        | Système            |
| Voir score projectionnel     | Membres Projection |
| Voir score global            | Tous               |

---

# 9. Gestion des propositions

| Cas d’utilisation                         | Acteurs            |
| ----------------------------------------- | ------------------ |
| Soumettre une proposition projectionnelle | Membres Projection |
| Soumettre une proposition globale         | Tous               |
| Accuser réception                         | Bureau concerné    |
| Accepter proposition                      | Bureau concerné    |
| Rejeter proposition                       | Bureau concerné    |

---

# 10. Gestion des notifications

| Cas d’utilisation                      | Acteurs     |
| -------------------------------------- | ----------- |
| Recevoir notification validation       | Utilisateur |
| Recevoir notification nouvel évènement | Utilisateur |
| Recevoir notification paiement         | Utilisateur |
| Recevoir notification proposition      | Bureau      |
| Recevoir notification clôture          | Utilisateur |

---

# 11. Restrictions importantes

## 11.1 Visibilité projectionnelle

Un utilisateur :

* peut voir les données internes de sa Projection ;
* ne peut pas voir les détails internes des autres Projections.

---

## 11.2 Transparence globale

Tous les membres peuvent consulter :

* les statistiques globales ;
* les scores globaux ;
* les finances globales ;
* les taux de participation globaux.

---

# 12. Philosophie V1

ContinGest V1 ne doit pas intégrer :

* réseau social ;
* forum ;
* messagerie interne ;
* sondages complexes ;
* collaboration temps réel avancée.

L’application reste centrée sur :

* solidarité ;
* gouvernance ;
* transparence ;
* gestion financière.

---

## Administrateur système

L’Administrateur système possède un accès global complet à des fins :

* de maintenance ;
* de support ;
* de sécurité ;
* d’audit ;
* de dépannage.

Il peut intervenir sur tous les périmètres sans appartenir à un Bureau métier.
