# ContinGest — Analyse Fonctionnelle V1

## 1. Présentation générale

ContinGest est une plateforme communautaire de gestion de solidarité destinée à un Contingent composé de plusieurs Projections.

L’objectif principal est de :

* gérer les évènements solidaires ;
* suivre les cotisations ;
* assurer la transparence financière ;
* mesurer la participation des membres ;
* faciliter la gouvernance des Projections et du Bureau Général.

---

# 2. Structure organisationnelle

## 2.1 Contingent

Le Contingent représente l’organisation principale.

Il contient :

* plusieurs Projections ;
* un Bureau Coordinateur Général ;
* des évènements globaux ;
* une caisse globale.

---

## 2.2 Projection

Une Projection représente un groupe d’individus ayant suivi leur formation ensemble.

Une Projection possède :

* ses membres ;
* son personnel d’encadrement ;
* son bureau ;
* ses évènements internes ;
* sa caisse interne ;
* ses statistiques internes.

---

# 3. Types de membres

## 3.1 Membres réguliers

Les membres réguliers :

* appartiennent à une Projection ;
* peuvent participer aux évènements ;
* peuvent cotiser ;
* peuvent consulter les statistiques ;
* peuvent soumettre des propositions.

Certains membres réguliers peuvent aussi :

* faire partie du Bureau de leur Projection ;
* faire partie du Bureau Général.

---

## 3.2 Personnel d’encadrement

Le personnel d’encadrement :

* appartient à une Projection ;
* ne peut pas être membre d’un Bureau ;
* peut participer aux évènements ;
* peut cotiser ;
* peut être inclus ou exclu de certaines règles selon les paramètres système.

Les fonctions d’encadrement doivent être configurables afin d’éviter les incohérences d’écriture.

Exemples :

* Directeur FETTA ;
* Directeur FETTA Adjoint ;
* Chef de section ;
* Petit gradé d’encadrement.

---

# 4. Bureaux

## 4.1 Bureau de Projection

Chaque Projection possède son propre Bureau.

Le Bureau de Projection gère :

* les membres de la Projection ;
* les validations de comptes ;
* les évènements internes ;
* la caisse projectionnelle ;
* les propositions internes.

---

## 4.2 Bureau Général

Le Bureau Général gère :

* les évènements globaux ;
* la caisse globale ;
* les statistiques globales ;
* les propositions globales.

Les membres du Bureau Général ne doivent pas automatiquement avoir accès aux détails internes des autres Projections.

---

# 5. Gestion des comptes

Tous les utilisateurs doivent créer eux-mêmes leur compte.

---

## 5.1 Validation des membres réguliers

Les comptes des membres réguliers et du personnel d’encadrement doivent être validés par un membre du Bureau de leur Projection.

Un membre du Bureau peut également créer directement un membre. Dans ce cas, le compte est automatiquement validé.

---

## 5.2 Validation des membres du Bureau

Les membres du Bureau des Projections doivent être validés par l’Administrateur système.

---

# 6. Gestion des évènements

## 6.1 Types d’évènements

Deux grandes catégories existent :

### Évènements globaux

Concernent :

* tout le Contingent ;
* plusieurs Projections ;
* ou une activité générale.

### Évènements projectionnels

Concernent uniquement une Projection.

---

## 6.2 Nature des évènements

Un évènement peut être :

* général ;
* particulier.

Un évènement particulier peut concerner un ou plusieurs membres.

Exemples :

* décès ;
* mariage ;
* naissance ;
* anniversaire.

---

# 7. Cycle de vie des évènements

Les évènements suivent plusieurs états :

* DRAFT ;
* ACTIVE ;
* COMPLETED ;
* CLOSING ;
* CLOSED ;
* ARCHIVED.

---

# 8. Cotisations

Les cotisations sont définies :

* par catégorie ;
* par évènement.

Exemple :

* Officiers ;
* Sous-officiers ;
* MDR.

Les paiements partiels sont autorisés.

---

# 9. Score de solidarité

Le score de solidarité représente le niveau de participation financière d’un membre.

Il influence :

* les aides futures ;
* les montants réellement demandés aux autres membres lors d’un évènement particulier.

---

## 9.1 Score projectionnel

Basé uniquement sur :

* les évènements internes ;
* les cotisations internes.

Visible uniquement dans la Projection concernée.

---

## 9.2 Score global

Basé sur :

* les évènements globaux ;
* les participations générales ;
* les statistiques du Contingent.

Visible par tous les membres du Contingent.

---

# 10. Transparence

Tout membre peut consulter :

* les statistiques globales ;
* les finances globales ;
* les taux de participation globaux.

Mais un membre ne peut pas consulter :

* les détails internes d’une autre Projection ;
* la caisse interne d’une autre Projection.

---

# 11. Propositions

Les membres peuvent soumettre :

* des propositions à leur Bureau de Projection ;
* ou au Bureau Général.

Les propositions :

* ne donnent pas lieu à des discussions internes dans l’application ;
* reçoivent un accusé de réception ;
* peuvent être acceptées ou rejetées.

La communication publique peut ensuite être faite via WhatsApp.

---

# 12. Notifications

Le système devra gérer des notifications simples :

* validation de compte ;
* nouvelles propositions ;
* nouveaux évènements ;
* nouveaux paiements ;
* commentaires ;
* clôtures.

---

# 13. Philosophie produit

ContinGest n’est pas un réseau social.

L’application doit rester :

* simple ;
* structurée ;
* institutionnelle ;
* orientée solidarité ;
* orientée gouvernance ;
* orientée transparence.

Les fonctionnalités sociales complexes sont volontairement exclues :

* chat interne ;
* forum ;
* réseau social ;
* sondages complexes.
