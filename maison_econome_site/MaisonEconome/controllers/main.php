<?php

if (!isset($_GET['fonction']) || empty($_GET['fonction'])) {
    $function = "welcome";
} else {
    $function = $_GET['fonction'];
}

if (!isset($_GET['error']) || empty($_GET['error'])) {
    $error = NULL;
} else {
    $error = $_GET['error'];
}

switch ($function) {

    case 'welcome':
        $vue = "welcome";
        $title = "Accueil";
        break;

    case 'login':
        $vue = "login";
        $title = "Connexion";
        break;

    case 'register':
        $vue = "register";
        $title = "S'enregistrer";
        break;

    case 'acceuil':
        $vue = "acceuil";
        $title = "Acceuil";
        break;

    case 'info_profil':
        $vue = "info_profil";
        $title = "Information profil";
        break;

    case 'gestion':
        $vue = "gestion";
        $title = "Gestion du site";
        break;

    case 'gestion_utilisateurs':
        $vue = "gestion_utilisateurs";
        $title = "Gestion des utilisateurs";
        break;
    
    case 'gestion_maisons':
        $vue = "gestion_maisons";
        $title = "Gestion des maisons";
        break;

    case 'gestion_ressources':
        $vue = "gestion_ressources";
        $title = "Gestion des ressources";
        break;
    
    case 'gestion_substances':
        $vue = "gestion_substances";
        $title = "Gestion des substances";
        break;

    case 'gestion_appartements':
        $vue = "gestion_appartements";
        $title = "Gestion des appartements";
        break;

    default:
        // si aucune fonction ne correspond au paramètre function passé en GET
        $vue = "error404";
        $title = "Erreur 404";
        $message = "Erreur 404 : la page recherchée n'existe pas.";
}

include ('vues/header.php');
include ('vues/' . $vue . '.php');
include ('vues/footer.php');
