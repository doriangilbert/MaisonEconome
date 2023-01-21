<?php 
session_start();
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title><?php echo $title; ?></title>
        <link rel="stylesheet" href="./style/style.css">
        <link rel="stylesheet" href="./style/style_profil.css">
        <link rel="stylesheet" href="./style/style_login.css">
        <link rel="stylesheet" href="./style/style_register.css">
        <link rel="stylesheet" href="./style/style_header.css">
        <link rel="stylesheet" href="./style/style_form.css">
        <link rel="stylesheet" href="./style/style_gestion.css">
    </head>
    <body>

        <div class="header">
            <a href="./index.php?cible=main&fonction=welcome" class="logo">Maison Économe</a>
            <div class="header-right">
                <a href="index.php?cible=main&fonction=acceuil" class="header_button">Accueil</a>
                <a href="index.php?cible=main&fonction=info_profil" class="header_button">Mon Compte</a>
                <?php if(isset($_SESSION['id']) && isset($_SESSION['userTag'])) {
                    include('models/header_deconnexion.php');
                } ?>
            </div>
        </div>
        <div class="body">