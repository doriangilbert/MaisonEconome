<?php 
if(isset($_SESSION['id']) && isset($_SESSION['userTag'])){
?>

<h1>
    Bienvenu <?php echo $_SESSION['userFirstname']; ?> !
</h1>
<div class="login-box">
    <a class="register" href="index.php?cible=main&fonction=stats">Accéder a vos statistiques</a>
    <a class="register" href="index.php?cible=main&fonction=info-profile">Informations de votre profil</a>
    
    <?php 
    if($_SESSION['isAdmin'] == 1){
    ?>

    <a class="register" href="index.php?cible=main&fonction=gestion">Gestion du site</a>
    
    <?php
    }
    ?>

</div>

<?php
}else{
    header("Location: index.php?cible=main&fonction=login");
}
?>