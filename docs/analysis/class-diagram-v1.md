# ContinGest — Diagramme de Classes V1

# 1. Objectif

Ce document décrit le modèle métier principal de ContinGest V1.

Il constitue la référence pour :

* la conception SQL ;
* les relations métier ;
* les permissions ;
* les services applicatifs ;
* les calculs financiers ;
* les calculs de solidarité.

---

# 2. Principes de conception

ContinGest repose sur plusieurs principes fondamentaux :

* un membre appartient à une seule Projection ;
* un utilisateur possède un seul compte ;
* les permissions sont déterminées par ses affectations ;
* les Projections sont autonomes ;
* les données globales sont transparentes ;
* les données internes restent isolées.

---

# 3. Entités principales

# 3.1 Projection

Représente un groupe principal du Contingent.

## Responsabilités

* gérer ses membres ;
* gérer son bureau ;
* gérer ses évènements ;
* gérer sa caisse ;
* gérer ses statistiques.

## Informations principales

* code ;
* nom ;
* description ;
* logo ;
* bannière ;
* couleur principale.

## Relations

* possède plusieurs membres ;
* possède plusieurs évènements ;
* possède plusieurs affectations ;
* possède plusieurs propositions.

---

# 3.2 Membre

Représente une personne physique appartenant à une Projection.

## Types

* REGULAR
* STAFF

REGULAR = membre régulier

STAFF = personnel d'encadrement

## Responsabilités

* participer aux évènements ;
* cotiser ;
* consulter les statistiques ;
* soumettre des propositions.

## Relations

* appartient à une Projection ;
* appartient à une catégorie ;
* possède plusieurs affectations ;
* possède plusieurs paiements ;
* possède plusieurs scores ;
* possède plusieurs notifications.

---

# 3.3 Catégorie

Détermine les montants de contribution.

## Exemples

* Officier
* Sous-officier
* Militaire du rang

## Relations

* possède plusieurs membres ;
* est utilisée dans les cotisations.

---

# 3.4 Fonction d'encadrement

Décrit une fonction historique ou professionnelle.

## Exemples

* Directeur FETTA
* Directeur FETTA Adjoint
* Chef de section
* Encadreur

## Relations

* peut être attribuée à plusieurs membres STAFF.

---

# 3.5 Affectation

Représente une responsabilité accordée à un membre.

## Exemples

Projection :

* Président
* Vice-président
* SG
* SGA
* Trésorier
* Trésorier adjoint
* Communication
* Discipline

Global :

* Président Général
* SG Général
* Trésorier Général

## Relations

* liée à un membre ;
* liée à une portée.

---

# 3.6 Portée (Scope)

Détermine le périmètre métier.

## Types

* GLOBAL
* PROJECTION
* EVENT

## Utilisation

Permet de réutiliser les mêmes mécanismes :

* permissions ;
* propositions ;
* notifications ;
* statistiques.

---

# 3.7 Évènement

Représente une activité ou situation de solidarité.

## Portées possibles

* GLOBAL
* PROJECTION

## Natures possibles

* GENERAL
* PARTICULAR

---

## Exemples généraux

* anniversaire ;
* retrouvailles ;
* journée sportive.

---

## Exemples particuliers

* décès ;
* mariage ;
* naissance ;
* hospitalisation.

---

## Statuts

* DRAFT
* ACTIVE
* COMPLETED
* CLOSING
* CLOSED
* ARCHIVED

---

## Relations

* appartient à une portée ;
* possède plusieurs cotisations ;
* possède plusieurs paiements ;
* peut concerner plusieurs membres ;
* possède plusieurs commentaires.

---

# 3.8 Bénéficiaire d'évènement

Table de liaison entre :

* évènement ;
* membre.

Utilisée lorsqu'un évènement particulier concerne :

* un membre ;
* plusieurs membres.

---

# 3.9 Cotisation

Représente un montant attendu.

## Caractéristiques

Définie :

* par évènement ;
* par catégorie.

## Relations

* liée à un évènement ;
* liée à une catégorie ;
* possède plusieurs paiements.

---

# 3.10 Paiement

Représente une contribution réellement versée.

## Caractéristiques

* paiement complet ;
* paiement partiel ;
* paiement multiple.

## Relations

* lié à un membre ;
* lié à une cotisation.

---

# 3.11 Transaction

Représente un mouvement financier.

## Types

* ENTRY
* EXIT

## Exemples

Entrées :

* cotisation ;
* don ;
* régularisation.

Sorties :

* aide ;
* achat ;
* remboursement.

## Relations

* liée à une portée ;
* peut être liée à un évènement.

---

# 3.12 Score de solidarité

Représente le niveau réel de participation.

## Types

* PROJECTION
* GLOBAL

## Utilisations

* calcul des aides ;
* statistiques ;
* transparence.

## Relations

* lié à un membre.

---

# 3.13 Proposition

Représente une suggestion transmise à un Bureau.

## Types

* PROJECTION
* GLOBAL

## Statuts

* PENDING
* RECEIVED
* ACCEPTED
* REJECTED

## Relations

* liée à un membre ;
* liée à une portée.

---

# 3.14 Commentaire d'évènement

Permet à un membre d'évaluer un évènement.

## Conditions

* score minimal configurable ;
* évènement terminé ;
* règles définies par paramètres.

## Relations

* lié à un membre ;
* lié à un évènement.

---

# 3.15 Notification

Représente une alerte système.

## Exemples

* validation ;
* proposition ;
* paiement ;
* évènement ;
* commentaire ;
* clôture.

## Relations

* liée à un membre.

---

# 3.16 Paramètre système

Contient la configuration générale.

## Exemples

* seuil commentaire ;
* activation encadrement ;
* calcul score ;
* visibilité statistiques ;
* participation encadrement ;
* règles financières.

---

# 3.17 Historique

Permet la traçabilité complète.

## Utilisations

* audit ;
* sécurité ;
* supervision ;
* diagnostic.

---

# 4. Relations principales

| Relation                             | Cardinalité |
| ------------------------------------ | ----------- |
| Projection → Membres                 | 1 → N       |
| Projection → Évènements              | 1 → N       |
| Projection → Affectations            | 1 → N       |
| Membre → Affectations                | 1 → N       |
| Membre → Paiements                   | 1 → N       |
| Membre → Scores                      | 1 → N       |
| Membre → Notifications               | 1 → N       |
| Catégorie → Membres                  | 1 → N       |
| Fonction Encadrement → Membres STAFF | 1 → N       |
| Évènement → Cotisations              | 1 → N       |
| Évènement → Bénéficiaires            | 1 → N       |
| Cotisation → Paiements               | 1 → N       |
| Évènement → Commentaires             | 1 → N       |
| Membre → Commentaires                | 1 → N       |
| Membre → Propositions                | 1 → N       |

---

# 5. Règles métier majeures

## Encadrement

Le personnel d'encadrement :

* ne peut pas être membre régulier ;
* ne peut pas appartenir à un Bureau.

---

## Bureau

Un membre régulier peut :

* appartenir au Bureau de sa Projection ;
* appartenir simultanément au Bureau Général.

---

## Transparence

Tous les membres peuvent consulter :

* les statistiques globales ;
* les scores globaux ;
* les finances globales.

---

## Isolation

Les données internes d'une Projection :

* sont visibles uniquement par ses membres.

---

## Administrateur

L'Administrateur possède un accès technique complet.

Il peut :

* consulter toutes les données ;
* intervenir partout ;
* corriger les incohérences.

Cependant :

* il ne constitue pas un acteur métier ;
* il n'appartient pas automatiquement aux Bureaux.

---

# 6. Philosophie du modèle

Le modèle privilégie :

* simplicité ;
* extensibilité ;
* cohérence métier ;
* transparence ;
* traçabilité.

Il évite volontairement :

* les mécanismes sociaux complexes ;
* les discussions internes ;
* les fonctionnalités temps réel avancées.
