<?php 
if(!isset($_SESSION['id']) && !isset($_SESSION['userTag'])){
?>

<div class="bloc_bienvenu">
    <h1 class="titre">Bienvenue !</h1>
    <div class="login-box">
        <a href="index.php?cible=main&fonction=login" class="register">Cliquez ici pour commencer</a>
    </div>
</div>

<?php
}else{
    header("Location: index.php?cible=main&fonction=profil");
}
?>