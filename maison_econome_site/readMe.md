# Installation

---
- Pour installer le site web, copiez le dossier `MaisonEconome` dans le dossier `www` du repertoire de wamp.
---

## Installation rapide

Si wamp est installé dans le répertoire par défaut, ouvrez un terminal et naviguez naviguez dans le répertoire du projet `maison_econome_site` .md, puis tapez les comandes suivantes :
```
mkdir C:\wamp64\www\MaisonEconome;
Xcopy /E MaisonEconome C:\wamp64\www\MaisonEconome;
```

Ouvrez ensuite le lien suivant dans un navigateur :

```
localhost/MaisonEconome
```

## Base de données

Pour intaller la base de données il vous faudra vous rendre à l'adresse suivante :

```
localhost/phpmyadmin
```

Puis vous rendre dans le volet `importer` pour importer le script de création de tables nommé `CreationTablesMaisonEconome.sql`
Enfin, il faudra vous rendre sur la page de la base de données `maisoneconome`
puis dans le volet `importer` pour importer les données grace au script nommé `DateMaisonEconome.sql`