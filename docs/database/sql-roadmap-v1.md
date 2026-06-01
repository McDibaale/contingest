# ContinGest — Feuille de Route SQL V1

Version : 1.0
Statut : Référence de développement
Dernière mise à jour : Juin 2026

---

# 1. Objectif

Ce document définit l'ordre officiel de création des tables SQL de ContinGest V1.

L'objectif est d'éviter :

- les dépendances circulaires ;
- les modifications répétitives ;
- les erreurs de clés étrangères ;
- les incohérences du modèle de données.

Chaque étape doit être validée avant de passer à la suivante.

---

# 2. Principe général

Les tables sont créées dans l'ordre suivant :

1. Référentiels
2. Structure organisationnelle
3. Membres
4. Gouvernance
5. Évènements
6. Finances
7. Scores
8. Collaboration
9. Notifications
10. Audit

---

# PHASE 1 — RÉFÉRENTIELS

Ces tables ne dépendent d'aucune autre.

---

## 1. ctg_category

Catégories de cotisation.

Exemples :

- Officiers
- Sous-Officiers
- Militaires du Rang

---

## 2. ctg_grade

Grades militaires.

Lié à :

```text
ctg_category
```

---

## 3. ctg_role

Fonctions configurables.

Exemples :

- Président
- SG
- Trésorier
- Directeur FETTA
- Chef de Section

---

## 4. ctg_setting

Paramètres généraux du système.

---

# PHASE 2 — STRUCTURE ORGANISATIONNELLE

---

## 5. ctg_projection

Entité centrale du système.

Contient :

- nom
- logo
- bannière
- couleur

---

# PHASE 3 — MEMBRES

---

## 6. ctg_member

Dépend de :

```text
ctg_projection
ctg_grade
```

---

# PHASE 4 — GOUVERNANCE

---

## 7. ctg_assignment

Dépend de :

```text
ctg_member
ctg_role
```

Permet :

- Bureau Général
- Bureau Projection
- Encadrement

---

# PHASE 5 — ÉVÈNEMENTS

---

## 8. ctg_event

Dépend de :

```text
ctg_projection
```

---

## 9. ctg_event_member

Dépend de :

```text
ctg_event
ctg_member
```

Permet d'associer plusieurs membres à un évènement particulier.

---

# PHASE 6 — FINANCES

---

## 10. ctg_contribution

Dépend de :

```text
ctg_event
ctg_category
```

---

## 11. ctg_payment

Dépend de :

```text
ctg_member
ctg_contribution
```

---

## 12. ctg_transaction

Dépend de :

```text
ctg_event
```

---

## 13. ctg_attachment

Dépend de :

```text
ctg_transaction
```

---

# PHASE 7 — SCORES

---

## 14. ctg_score

Dépend de :

```text
ctg_member
```

Types :

```text
GLOBAL
PROJECTION
```

---

# PHASE 8 — COLLABORATION

---

## 15. ctg_proposal

Dépend de :

```text
ctg_member
```

---

## 16. ctg_event_feedback

Dépend de :

```text
ctg_event
ctg_member
```

---

# PHASE 9 — NOTIFICATIONS

---

## 17. ctg_notification

Dépend de :

```text
ctg_member
```

---

# PHASE 10 — AUDIT

---

## 18. ctg_audit_log

Historisation globale.

Aucune dépendance métier obligatoire.

---

# 3. Ordre SQL officiel

L'ordre définitif de création est :

```text
01 - ctg_category
02 - ctg_grade
03 - ctg_role
04 - ctg_setting

05 - ctg_projection

06 - ctg_member

07 - ctg_assignment

08 - ctg_event
09 - ctg_event_member

10 - ctg_contribution
11 - ctg_payment
12 - ctg_transaction
13 - ctg_attachment

14 - ctg_score

15 - ctg_proposal
16 - ctg_event_feedback

17 - ctg_notification

18 - ctg_audit_log
```

---

# 4. Méthode de travail

Pour chaque table :

## Étape 1

Créer la table.

---

## Étape 2

Vérifier :

- structure ;
- noms ;
- contraintes ;
- index.

---

## Étape 3

Valider la cohérence métier.

---

## Étape 4

Commit Git.

Exemple :

```bash
git add .
git commit -m "feat(database): add ctg_projection"
git push
```

---

# 5. Règle importante

Aucune table ne doit être créée directement dans Supabase sans avoir été :

1. définie dans `database-model-v1.md` ;
2. validée dans cette feuille de route.

---

# 6. Prochaine étape

Après validation de cette feuille de route :

1. création de `ctg_category`
2. création de `ctg_grade`
3. création de `ctg_role`
4. création de `ctg_setting`

Puis démarrage du schéma SQL réel V1 dans Supabase.