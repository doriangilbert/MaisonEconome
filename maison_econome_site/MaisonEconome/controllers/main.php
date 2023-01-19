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

    case 'profil':
        $vue = "profil";
        $title = "Profil";
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

    case 'gestion_ressources_substances':
        $vue = "gestion_ressources_substances";
        $title = "Gestion des ressources et substances";
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
