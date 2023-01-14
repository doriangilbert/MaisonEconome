<?php

if (!isset($_GET['fonction']) || empty($_GET['fonction'])) {
    $function = "home";
} else {
    $function = $_GET['fonction'];
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

    default:
        // si aucune fonction ne correspond au paramètre function passé en GET
        $vue = "erreur404";
        $title = "error404";
        $message = "Erreur 404 : la page recherchée n'existe pas.";
}

include ('vues/header.php');
include ('vues/' . $vue . '.php');
include ('vues/footer.php');
