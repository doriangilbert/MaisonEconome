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

    case 'home':
        $vue = "home";
        $titre = "Menu principal";
        break;

    default:
        // si aucune fonction ne correspond au paramètre function passé en GET
        $vue = "erreur404";
        $title = "error404";
        $message = "Erreur 404 : la page recherchée n'existe pas.";
}

include ('vues/header.php');
include ('vues/' . $vue . '.php');
include ('vues/footer.php');
