<?php

if (!isset($_GET['fonction']) || empty($_GET['fonction'])) {
    $function = "home";
} else {
    $function = $_GET['fonction'];
}

switch ($function) {
    
    case 'home':
        //affichage de l'accueil
        $vue = "home";
        $title = "Accueil";
        break;
        
    case 'parametrage':
    // Paramétrage de l'application
        $vue = "parametrage";
        $title = "Paramétrage du site";
        $entete = "Paramétrage des entités";
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
