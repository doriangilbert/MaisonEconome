<?php 
session_start();
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title><?php echo $title; ?></title>
        <link rel="stylesheet" href="./style/style.css">
    </head>
    <body>

        <div class="header">
            <a href="index.php?cible=main&fonction=welcome" class="logo">Maison Économe</a>
            <div class="header-right">
                <a href="accueil.php" class="header_button">Accueil</a>
                <a href="mon_compte.php" class="header_button">Mon Compte</a>
                <?php if(isset($_SESSION['id']) && isset($_SESSION['userTag'])) {
                    include('models/header_deconnexion.php');
                } ?>
            </div>
        </div>