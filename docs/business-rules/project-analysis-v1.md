# ContinGest — Analyse Fonctionnelle V1

## 1. Présentation générale

ContinGest est une plateforme web de gestion de solidarité destinée à un Contingent composé de plusieurs Projections.

L'application a pour objectif de :

* gérer les membres ;
* gérer les évènements solidaires ;
* suivre les cotisations ;
* assurer la transparence financière ;
* mesurer la participation des membres ;
* faciliter la gouvernance des Projections ;
* faciliter la gouvernance du Bureau Coordinateur Général.

ContinGest est avant tout un outil de gestion communautaire, financière et organisationnelle.

---

# 2. Structure organisationnelle

## 2.1 Contingent

Le Contingent représente l'organisation principale.

Il regroupe :

* plusieurs Projections ;
* un Bureau Coordinateur Général ;
* des évènements globaux ;
* une caisse globale ;
* des statistiques globales.

---

## 2.2 Projection

Une Projection représente un groupe d'individus ayant suivi leur formation ensemble.

Une Projection possède :

* ses membres ;
* son personnel d'encadrement ;
* son Bureau Coordinateur ;
* ses évènements internes ;
* sa caisse interne ;
* ses statistiques internes ;
* son identité visuelle.

Une Projection dispose notamment :

* d'un logo ;
* d'une bannière ;
* d'une couleur dominante.

---

# 3. Types de membres

Tous les utilisateurs du système sont des membres.

Un membre appartient toujours à une seule Projection.

---

## 3.1 Membre régulier

Le membre régulier :

* participe aux évènements ;
* effectue des cotisations ;
* consulte les statistiques ;
* consulte les finances autorisées ;
* soumet des propositions.

Un membre régulier peut également :

* appartenir au Bureau de sa Projection ;
* appartenir au Bureau Général.

---

## 3.2 Personnel d'encadrement

Le personnel d'encadrement :

* appartient à une Projection ;
* participe aux évènements ;
* peut cotiser ;
* possède un rôle d'encadrement historique ou professionnel.

Exemples :

* Directeur FETTA ;
* Directeur FETTA Adjoint ;
* Chef de section ;
* Encadreur ;
* Petit gradé d'encadrement.

Les fonctions d'encadrement doivent être configurables.

---

# 4. Règles d'appartenance

## 4.1 Exclusivité de l'encadrement

Un personnel d'encadrement :

* ne peut pas être membre régulier ;
* ne peut pas appartenir à un Bureau.

---

## 4.2 Cumul des responsabilités

Un membre régulier peut :

* appartenir au Bureau de sa Projection ;
* appartenir simultanément au Bureau Général.

Un seul compte utilisateur est utilisé.

Les permissions sont déterminées dynamiquement selon les affectations du membre.

---

# 5. Bureaux

## 5.1 Bureau de Projection

Chaque Projection possède son Bureau.

Le Bureau de Projection gère :

* les membres ;
* les validations de comptes ;
* les évènements internes ;
* la caisse projectionnelle ;
* les propositions internes.

---

## 5.2 Bureau Général

Le Bureau Général gère :

* les évènements globaux ;
* la caisse globale ;
* les statistiques globales ;
* les propositions globales ;
* les paramètres généraux autorisés.

Les membres du Bureau Général n'obtiennent pas automatiquement accès aux données internes des autres Projections.

---

# 6. Gestion des comptes

Tous les utilisateurs doivent posséder un compte.

L'authentification est obligatoire.

---

## 6.1 Création des comptes

Les membres créent eux-mêmes leur compte.

Le compte reste en attente tant qu'il n'est pas validé.

---

## 6.2 Validation des comptes

### Membres réguliers

Les comptes des membres réguliers sont validés par un membre du Bureau de leur Projection.

---

### Personnel d'encadrement

Les comptes du personnel d'encadrement sont validés par un membre du Bureau de leur Projection.

---

### Membres du Bureau

Les comptes des membres du Bureau de Projection sont validés par l'Administrateur système.

---

## 6.3 Création directe

Un membre habilité du Bureau peut créer directement un membre.

Dans ce cas :

* le compte est automatiquement validé ;
* l'utilisateur reçoit ses informations d'accès.

---

# 7. Gestion des évènements

## 7.1 Portée des évènements

Un évènement peut être :

### Global

Concerne :

* tout le Contingent ;
* plusieurs Projections ;
* une activité générale.

---

### Projectionnel

Concerne uniquement une Projection.

---

## 7.2 Nature des évènements

Un évènement peut être :

### Général

Exemples :

* anniversaire ;
* retrouvailles ;
* activité collective.

Aucun bénéficiaire particulier.

---

### Particulier

Concerne un ou plusieurs membres.

Exemples :

* décès ;
* mariage ;
* naissance ;
* hospitalisation ;
* soutien exceptionnel.

---

# 8. Cycle de vie des évènements

Les statuts prévus sont :

* DRAFT ;
* ACTIVE ;
* COMPLETED ;
* CLOSING ;
* CLOSED ;
* ARCHIVED.

---

# 9. Gestion financière

## 9.1 Cotisations évènementielles

Chaque évènement définit :

* un montant attendu par catégorie ;
* les règles de contribution.

Les paiements peuvent être :

* partiels ;
* multiples.

---

## 9.2 Cotisations périodiques

Le système doit permettre la gestion d'une caisse permanente.

Exemples :

* cotisation mensuelle ;
* cotisation trimestrielle ;
* cotisation exceptionnelle.

Ces cotisations participent au calcul des scores.

---

# 10. Score de solidarité

Le score de solidarité représente le niveau réel de participation d'un membre.

Il influence les aides futures.

---

## 10.1 Score projectionnel

Calculé à partir :

* des évènements de la Projection ;
* des cotisations de la Projection.

Visible uniquement dans la Projection concernée.

---

## 10.2 Score global

Calculé à partir :

* des évènements globaux ;
* des cotisations globales ;
* des statistiques globales.

Visible par tous les membres du Contingent.

---

# 11. Règle fondamentale d'aide

Lorsqu'un évènement particulier concerne un membre :

Le montant théorique de chaque catégorie est pondéré par le score de solidarité du bénéficiaire.

Exemple :

Montants nominaux :

* Officier : 20 000
* Sous-officier : 10 000
* MDR : 5 000

Score du bénéficiaire :

30 %

Montants réellement demandés :

* Officier : 6 000
* Sous-officier : 3 000
* MDR : 1 500

Si plusieurs bénéficiaires existent :

Le score utilisé est la moyenne des scores concernés.

---

# 12. Transparence

## 12.1 Données globales

Tous les membres peuvent consulter :

* les statistiques globales ;
* les scores globaux ;
* la caisse globale ;
* les taux de participation globaux ;
* les évènements globaux.

---

## 12.2 Données projectionnelles

Les données internes d'une Projection ne sont visibles que par les membres de cette Projection.

---

# 13. Propositions

Les membres peuvent soumettre :

* une proposition à leur Projection ;
* une proposition au Bureau Général.

Les propositions :

* reçoivent un accusé de réception ;
* sont étudiées ;
* peuvent être acceptées ;
* peuvent être rejetées.

Aucune discussion interne n'est prévue dans l'application.

La communication publique peut être réalisée via WhatsApp.

---

# 14. Notifications

Le système doit gérer :

* validation de compte ;
* nouvelle proposition ;
* nouvel évènement ;
* nouveau paiement ;
* commentaire ;
* clôture d'évènement ;
* demandes en attente.

---

# 15. Paramètres généraux

Les administrateurs et gestionnaires habilités doivent pouvoir configurer :

* règles de calcul des scores ;
* seuils minimaux ;
* participation de l'encadrement ;
* visibilité des statistiques ;
* paramètres financiers ;
* catégories et grades ;
* rôles d'encadrement.

---

# 16. Administrateur système

L'Administrateur système possède un accès complet à la plateforme.

Ses responsabilités :

* maintenance ;
* sécurité ;
* supervision ;
* récupération ;
* dépannage ;
* audit ;
* correction des incohérences.

L'Administrateur peut accéder à toutes les données.

Cependant :

* il ne constitue pas un organe métier ;
* il n'appartient pas automatiquement au Bureau Général ;
* il intervient principalement pour des raisons techniques.

---

# 17. Philosophie produit

ContinGest est une plateforme :

* de solidarité ;
* de gouvernance ;
* de transparence ;
* de gestion financière ;
* de gestion communautaire.

ContinGest n'est pas :

* un réseau social ;
* une messagerie ;
* un forum ;
* un outil collaboratif temps réel.

La priorité est donnée :

* à la simplicité ;
* à la traçabilité ;
* à la stabilité métier ;
* à l'évolutivité maîtrisée.
