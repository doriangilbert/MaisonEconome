# MaisonEconome
_Bienvenu sur le repo du site "Maison Econome" !_

![image page de bienvenue](https://github.com/doriangilbert/MaisonEconome/blob/main/readme_src/bienvenu_screen.png?raw=true)
Ce site a été réalisé dans le cadre d'un projet étudiant ayant pour objectif de concevoir un site web communicant avec une base de données.

---

Technologies utilisées :
- PHP
- CSS
- HTML
- MySQL (le SGBD choisi)

---

Pour l'insctalation du site dans wamp, il faut se référer au README dans le dossier `maison_econome_site`.

---

Structure du site :
```
$RACINE_DU_PROJET
├── index.php				# Point d'entrée
├── controllers
|    └── main.php			# controlleur principal du site
├── models
|    ├── connexion.php			# permet la connexion a la bdd
|    ├── error.php			# permet l'affichage d'erreurs lors de l'inscription/la connexion
|    ├── header_deconnexion.php		# lien pour le header permettant la déconnexion
|    ├── login_form.php			# gère le formulaire de connexion
|    ├── logout.php			# gère la déconnexion au site
|    ├── main_error.php			# gère une erreur lors du chargement initial du site
|    └── register_form.php		# gère le formulaire d'inscription
├── style
|    ├── style.css			# différentes pages de style du site
|    ...
└── vues
     ├── error404.php			# body lorsque la page n'éxiste pas
     ├── footer.php			# footer du site
     ├── header.php			# header du site
     ├── login.php			# body pour la page de login
     ├── profil.php			# page menu du site lorsque connecté
     ├── register.php			# body pour la page d'inscription
     └── welcome.php			# body pour la 1ere page du site
```
