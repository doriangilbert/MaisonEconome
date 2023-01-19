<?php 
if(isset($_SESSION['id']) && isset($_SESSION['userTag'])){
  if($_SESSION['isAdmin'] == 1){
?>
<h1>
    Gestion du site
</h1>
<div class="login-box">
    <a class="register" href="index.php?cible=main&fonction=gestionutilisateurs">Gestion des utilisateurs</a>
    <a class="register" href="index.php?cible=main&fonction=gestionmaisons">Gestion des maisons</a>
    <a class="register" href="index.php?cible=main&fonction=gestionressourcessubstances">Gestion des ressources et substances</a>
    <a class="register" href="index.php?cible=main&fonction=profil">Retour au profil</a>
</div>

<?php
  }else{
        header("Location: index.php?cible=main&fonction=profil");
  }
}else{
    header("Location: index.php?cible=main&fonction=login");
}
?>