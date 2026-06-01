# ContinGest — Matrice des Permissions V1

# 1. Objectif

Ce document définit les permissions principales de ContinGest V1.

L’objectif est :

* sécuriser les périmètres ;
* clarifier les responsabilités ;
* éviter les conflits d’accès ;
* préparer le système d’autorisation.

---

# 2. Acteurs

| Code  | Acteur                  |
| ----- | ----------------------- |
| ADMIN | Administrateur système  |
| BG    | Bureau Général          |
| BP    | Bureau Projection       |
| MR    | Membre régulier         |
| ENC   | Personnel d’encadrement |

---

# 3. Principes fondamentaux

## 3.1 Transparence globale

Tous les membres peuvent consulter :

* statistiques globales ;
* scores globaux ;
* caisse globale ;
* évènements globaux.

---

## 3.2 Isolation projectionnelle

Les données internes d’une Projection :

* ne sont visibles que par les membres de cette Projection.

---

## 3.3 Encadrement

Le personnel d’encadrement :

* ne peut pas appartenir à un Bureau ;
* ne possède pas de permissions administratives spécifiques.

---

# 4. Gestion des comptes

| Action                       | ADMIN | BG | BP | MR | ENC |
| ---------------------------- | ----- | -- | -- | -- | --- |
| Créer son compte             | ✅     | ✅  | ✅  | ✅  | ✅   |
| Se connecter                 | ✅     | ✅  | ✅  | ✅  | ✅   |
| Modifier son profil          | ✅     | ✅  | ✅  | ✅  | ✅   |
| Valider membre projection    | ❌     | ❌  | ✅  | ❌  | ❌   |
| Valider membre bureau        | ✅     | ❌  | ❌  | ❌  | ❌   |
| Désactiver compte projection | ❌     | ❌  | ✅  | ❌  | ❌   |

---

# 5. Gestion des projections

| Action                          | ADMIN | BG | BP | MR | ENC |
| ------------------------------- | ----- | -- | -- | -- | --- |
| Créer projection                | ✅     | ❌  | ❌  | ❌  | ❌   |
| Modifier projection             | ✅     | ❌  | ❌  | ❌  | ❌   |
| Désactiver projection           | ✅     | ❌  | ❌  | ❌  | ❌   |
| Voir projections                | ✅     | ✅  | ✅  | ✅  | ✅   |
| Voir détails projection externe | ❌     | ❌  | ❌  | ❌  | ❌   |

---

# 6. Gestion des membres

| Action                          | ADMIN | BG | BP | MR | ENC |
| ------------------------------- | ----- | -- | -- | -- | --- |
| Créer membre projection         | ❌     | ❌  | ✅  | ❌  | ❌   |
| Modifier membre projection      | ❌     | ❌  | ✅  | ❌  | ❌   |
| Désactiver membre projection    | ❌     | ❌  | ✅  | ❌  | ❌   |
| Voir membres projection         | ❌     | ❌  | ✅  | ✅  | ✅   |
| Voir membres autres projections | ❌     | ❌  | ❌  | ❌  | ❌   |

---

# 7. Gestion des évènements

| Action                     | ADMIN | BG | BP | MR | ENC |
| -------------------------- | ----- | -- | -- | -- | --- |
| Créer évènement global     | ❌     | ✅  | ❌  | ❌  | ❌   |
| Créer évènement projection | ❌     | ❌  | ✅  | ❌  | ❌   |
| Modifier évènement         | ❌     | ✅  | ✅  | ❌  | ❌   |
| Clôturer évènement         | ❌     | ✅  | ✅  | ❌  | ❌   |
| Archiver évènement         | ❌     | ✅  | ✅  | ❌  | ❌   |
| Voir évènements globaux    | ✅     | ✅  | ✅  | ✅  | ✅   |
| Voir évènements projection | ❌     | ❌  | ✅  | ✅  | ✅   |

---

# 8. Gestion financière

| Action                         | ADMIN | BG | BP | MR | ENC |
| ------------------------------ | ----- | -- | -- | -- | --- |
| Définir cotisations globales   | ❌     | ✅  | ❌  | ❌  | ❌   |
| Définir cotisations projection | ❌     | ❌  | ✅  | ❌  | ❌   |
| Enregistrer paiement           | ❌     | ✅  | ✅  | ❌  | ❌   |
| Voir caisse globale            | ✅     | ✅  | ✅  | ✅  | ✅   |
| Voir caisse projection         | ❌     | ❌  | ✅  | ✅  | ✅   |
| Voir caisse autre projection   | ❌     | ❌  | ❌  | ❌  | ❌   |

---

# 9. Gestion des scores

| Action                           | ADMIN | BG | BP | MR | ENC |
| -------------------------------- | ----- | -- | -- | -- | --- |
| Voir score global                | ✅     | ✅  | ✅  | ✅  | ✅   |
| Voir score projectionnel interne | ❌     | ❌  | ✅  | ✅  | ✅   |
| Voir score projectionnel externe | ❌     | ❌  | ❌  | ❌  | ❌   |

---

# 10. Gestion des propositions

| Action                           | ADMIN | BG | BP | MR | ENC |
| -------------------------------- | ----- | -- | -- | -- | --- |
| Soumettre proposition globale    | ✅     | ✅  | ✅  | ✅  | ✅   |
| Soumettre proposition projection | ❌     | ❌  | ✅  | ✅  | ✅   |
| Voir propositions projection     | ❌     | ❌  | ✅  | ❌  | ❌   |
| Voir propositions globales       | ❌     | ✅  | ❌  | ❌  | ❌   |
| Accepter proposition             | ❌     | ✅  | ✅  | ❌  | ❌   |
| Rejeter proposition              | ❌     | ✅  | ✅  | ❌  | ❌   |

---

# 11. Notifications

| Action                     | ADMIN | BG | BP | MR | ENC |
| -------------------------- | ----- | -- | -- | -- | --- |
| Recevoir notifications     | ✅     | ✅  | ✅  | ✅  | ✅   |
| Recevoir validation compte | ❌     | ❌  | ✅  | ❌  | ❌   |
| Recevoir proposition       | ❌     | ✅  | ✅  | ❌  | ❌   |

---

# 12. Restrictions importantes

## 12.1 Bureau Général

Le Bureau Général :

* ne possède pas automatiquement accès aux détails internes des Projections ;
* ne peut pas consulter la caisse interne d’une Projection externe.

---

## 12.2 Projection

Chaque Projection reste autonome pour :

* ses membres ;
* sa caisse ;
* ses évènements internes.

---

# 13. Philosophie Administrateur

L’Administrateur système possède un accès technique complet à l’ensemble de la plateforme.

Ses responsabilités incluent :

* maintenance ;
* dépannage ;
* récupération ;
* audit ;
* supervision ;
* correction des incohérences ;
* assistance technique.

L’Administrateur peut :

* accéder à toutes les données ;
* consulter toutes les Projections ;
* consulter toutes les caisses ;
* consulter tous les évènements ;
* gérer tous les comptes.

Cependant :
l’Administrateur ne constitue pas un organe métier de gouvernance.

Le Bureau Général et les Bureaux de Projection conservent la responsabilité fonctionnelle et organisationnelle du Contingent.
