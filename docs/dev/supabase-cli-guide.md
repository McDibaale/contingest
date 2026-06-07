# ContinGest — Guide Supabase CLI

## Objectif

Ce document décrit les étapes permettant :

* d'installer Supabase CLI ;
* de connecter un projet local à Supabase ;
* d'exporter le schéma SQL ;
* d'effectuer les opérations de maintenance courantes.

---

# 1. Prérequis

## Homebrew

Vérifier l'installation :

```bash
brew --version
```

Mettre à jour :

```bash
brew update
```

---

# 2. Installation de Supabase CLI

```bash
brew install supabase/tap/supabase
```

Vérification :

```bash
supabase --version
```

---

# 3. Authentification

Connexion au compte Supabase :

```bash
supabase login
```

Le navigateur ouvre une page permettant de saisir un code de vérification.

---

# 4. Création d'un Access Token

Depuis le tableau de bord Supabase :

```text
Account
 → Access Tokens
 → Generate New Token
```

Exemple :

```text
sbp_xxxxxxxxxxxxxxxxx
```

Ne jamais versionner ce jeton dans Git.

---

# 5. Liaison du projet

Récupérer le Project Reference :

```text
Project Settings
 → General
 → Reference ID
```

Puis :

```bash
supabase link --project-ref PROJECT_REF
```

---

# 6. Docker

Certaines commandes Supabase utilisent Docker.

Installation :

```text
Docker Desktop
```

Vérification :

```bash
docker --version
```

Démarrer Docker Desktop avant d'utiliser les commandes de base de données.

---

# 7. Export du schéma SQL

Exporter la structure actuelle :

```bash
supabase db dump -f schema_v1.sql
```

ou :

```bash
supabase db dump --schema public -f schema_v1.sql
```

Le résultat est un fichier SQL représentant l'état réel de la base.

---

# 8. Utilisation dans ContinGest

Le dump SQL permet :

* de vérifier les tables réellement créées ;
* d'auditer les contraintes ;
* de reconstruire un schéma ;
* de préparer les migrations.

---

# 9. Commandes utiles

Version :

```bash
supabase --version
```

Connexion :

```bash
supabase login
```

Liaison du projet :

```bash
supabase link --project-ref PROJECT_REF
```

Export du schéma :

```bash
supabase db dump -f schema_v1.sql
```

---

# 10. Bonnes pratiques

* Ne jamais stocker les tokens dans Git.
* Toujours exporter le schéma avant une refonte majeure.
* Conserver les dumps importants dans un dossier d'archives.
* Versionner les migrations SQL dans le dépôt Git.
* Documenter chaque évolution structurelle importante.

---

# 11. Référence ContinGest

Projet :

```text
contingest-dev
```

Le schéma SQL exporté constitue la source de vérité pour la validation du modèle de données V1.
