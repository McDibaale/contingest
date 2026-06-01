# ContinGest — Cas d’Utilisation V1

# 1. Objectif

Ce document décrit les principaux cas d'utilisation de ContinGest V1.

Il sert à :

* identifier les fonctionnalités métier ;
* définir les responsabilités ;
* préparer les permissions ;
* préparer les écrans ;
* préparer les services applicatifs.

---

# 2. Acteurs du système

## 2.1 Administrateur système

Acteur technique possédant un accès complet à l'ensemble de la plateforme.

Responsabilités :

* maintenance ;
* supervision ;
* sécurité ;
* dépannage ;
* audit.

---

## 2.2 Bureau Général

Acteur métier responsable des activités globales du Contingent.

Responsabilités :

* évènements globaux ;
* finances globales ;
* statistiques globales ;
* propositions globales.

---

## 2.3 Bureau de Projection

Acteur métier responsable d'une Projection spécifique.

Responsabilités :

* membres ;
* validations ;
* évènements projectionnels ;
* finances projectionnelles ;
* propositions internes.

---

## 2.4 Membre régulier

Utilisateur standard appartenant à une Projection.

---

## 2.5 Personnel d'encadrement

Utilisateur appartenant à une Projection avec un statut d'encadrement.

---

# 3. Gestion de l'authentification

## UC-001 : Créer un compte

Acteurs :

* Tous

Description :

Le membre crée son compte utilisateur.

Résultat :

Compte créé en attente de validation.

---

## UC-002 : Se connecter

Acteurs :

* Tous

Description :

Connexion à l'application.

Résultat :

Accès à son espace personnel.

---

## UC-003 : Réinitialiser son mot de passe

Acteurs :

* Tous

Description :

Réinitialisation sécurisée du mot de passe.

---

## UC-004 : Modifier son profil

Acteurs :

* Tous

Description :

Modification des informations personnelles autorisées.

---

# 4. Gestion des validations

## UC-005 : Valider un membre

Acteurs :

* Bureau de Projection

Description :

Validation d'un membre régulier ou d'un encadreur.

---

## UC-006 : Valider un membre du Bureau

Acteurs :

* Administrateur

Description :

Validation d'un membre appartenant à un Bureau de Projection.

---

## UC-007 : Désactiver un compte

Acteurs :

* Bureau de Projection
* Administrateur

Description :

Désactivation d'un compte utilisateur.

---

# 5. Gestion des Projections

## UC-008 : Créer une Projection

Acteurs :

* Administrateur

---

## UC-009 : Modifier une Projection

Acteurs :

* Administrateur

---

## UC-010 : Désactiver une Projection

Acteurs :

* Administrateur

---

## UC-011 : Consulter les Projections

Acteurs :

* Tous

Description :

Visualisation des informations publiques des Projections.

---

## UC-012 : Consulter sa Projection

Acteurs :

* Membres de la Projection

Description :

Accès aux informations internes de la Projection.

---

# 6. Gestion des membres

## UC-013 : Créer un membre

Acteurs :

* Bureau de Projection

Description :

Création directe d'un membre avec validation automatique.

---

## UC-014 : Modifier un membre

Acteurs :

* Bureau de Projection

---

## UC-015 : Désactiver un membre

Acteurs :

* Bureau de Projection
* Administrateur

---

## UC-016 : Consulter les membres de sa Projection

Acteurs :

* Membres de la Projection

---

## UC-017 : Consulter les statistiques membres

Acteurs :

* Membres de la Projection

---

# 7. Gestion des catégories et grades

## UC-018 : Gérer les catégories

Acteurs :

* Administrateur

Description :

Gestion des catégories :

* Officier ;
* Sous-officier ;
* MDR ;
* futures catégories.

---

## UC-019 : Gérer les grades

Acteurs :

* Administrateur

Description :

Gestion des grades configurables.

---

## UC-020 : Gérer les fonctions d'encadrement

Acteurs :

* Administrateur

Description :

Gestion des fonctions historiques d'encadrement.

---

# 8. Gestion des affectations

## UC-021 : Affecter un membre à un Bureau

Acteurs :

* Administrateur

Description :

Création ou suppression d'une affectation.

---

## UC-022 : Consulter les affectations

Acteurs :

* Utilisateurs autorisés

---

# 9. Gestion des évènements

## UC-023 : Créer un évènement global

Acteurs :

* Bureau Général

---

## UC-024 : Créer un évènement projectionnel

Acteurs :

* Bureau de Projection

---

## UC-025 : Modifier un évènement

Acteurs :

* Bureau concerné

---

## UC-026 : Activer un évènement

Acteurs :

* Bureau concerné

---

## UC-027 : Marquer un évènement comme réalisé

Acteurs :

* Bureau concerné

Statut :

COMPLETED

---

## UC-028 : Passer en clôture

Acteurs :

* Bureau concerné

Statut :

CLOSING

---

## UC-029 : Clôturer un évènement

Acteurs :

* Bureau concerné

Statut :

CLOSED

---

## UC-030 : Archiver un évènement

Acteurs :

* Bureau concerné

Statut :

ARCHIVED

---

## UC-031 : Consulter un évènement

Acteurs :

* Membres autorisés

---

# 10. Gestion des cotisations

## UC-032 : Définir les montants de cotisation

Acteurs :

* Bureau concerné

Description :

Définition des montants attendus par catégorie.

---

## UC-033 : Enregistrer un paiement

Acteurs :

* Bureau concerné

---

## UC-034 : Consulter ses paiements

Acteurs :

* Tous

---

## UC-035 : Consulter les paiements d'un évènement

Acteurs :

* Membres autorisés

---

## UC-036 : Consulter les statistiques de participation

Acteurs :

* Tous

---

# 11. Gestion financière

## UC-037 : Enregistrer une entrée de caisse

Acteurs :

* Bureau concerné

---

## UC-038 : Enregistrer une sortie de caisse

Acteurs :

* Bureau concerné

---

## UC-039 : Ajouter une pièce justificative

Acteurs :

* Bureau concerné

Formats :

* image ;
* PDF.

---

## UC-040 : Consulter le journal financier

Acteurs :

* Membres autorisés

---

## UC-041 : Consulter les bilans financiers

Acteurs :

* Membres autorisés

---

# 12. Gestion des scores

## UC-042 : Calculer le score projectionnel

Acteurs :

* Système

---

## UC-043 : Calculer le score global

Acteurs :

* Système

---

## UC-044 : Consulter son score

Acteurs :

* Tous

---

## UC-045 : Consulter les scores de sa Projection

Acteurs :

* Membres de la Projection

---

## UC-046 : Consulter les scores globaux

Acteurs :

* Tous

---

# 13. Gestion des propositions

## UC-047 : Soumettre une proposition projectionnelle

Acteurs :

* Membres de la Projection

---

## UC-048 : Soumettre une proposition globale

Acteurs :

* Tous

---

## UC-049 : Accuser réception

Acteurs :

* Bureau concerné

---

## UC-050 : Accepter une proposition

Acteurs :

* Bureau concerné

---

## UC-051 : Rejeter une proposition

Acteurs :

* Bureau concerné

---

# 14. Gestion des commentaires d'évènements

## UC-052 : Commenter un évènement

Acteurs :

* Membres autorisés

Conditions :

* score minimal atteint ;
* évènement clôturé ;
* fonctionnalité activée.

---

## UC-053 : Consulter les commentaires

Acteurs :

* Membres autorisés

---

# 15. Gestion des notifications

## UC-054 : Recevoir une notification

Acteurs :

* Tous

---

## UC-055 : Consulter ses notifications

Acteurs :

* Tous

---

## UC-056 : Marquer une notification comme lue

Acteurs :

* Tous

---

# 16. Gestion des paramètres système

## UC-057 : Modifier les paramètres généraux

Acteurs :

* Administrateur

---

## UC-058 : Configurer les règles de score

Acteurs :

* Administrateur

---

## UC-059 : Configurer la participation de l'encadrement

Acteurs :

* Administrateur

---

## UC-060 : Configurer les seuils de commentaires

Acteurs :

* Administrateur

---

# 17. Exportation

## UC-061 : Export PDF d'un bilan

Acteurs :

* Utilisateurs autorisés

---

## UC-062 : Export Excel des cotisations

Acteurs :

* Utilisateurs autorisés

---

## UC-063 : Export Excel des membres

Acteurs :

* Utilisateurs autorisés

---

## UC-064 : Export du journal financier

Acteurs :

* Utilisateurs autorisés

---

# 18. Philosophie fonctionnelle

ContinGest V1 privilégie :

* la solidarité ;
* la transparence ;
* la gouvernance ;
* la traçabilité ;
* la simplicité d'utilisation.

Les fonctionnalités suivantes sont volontairement exclues :

* réseau social ;
* forum ;
* messagerie interne ;
* chat ;
* sondages complexes ;
* collaboration temps réel avancée.
