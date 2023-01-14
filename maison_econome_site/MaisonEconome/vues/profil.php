<?php 
if(isset($_SESSION['id']) && isset($_SESSION['userTag'])){
?>

<h1>
    Bienvenu <?php echo $_SESSION['userFirstname']; ?> !
</h1>
<div class="div-box">
    <a class="a_button" href="index.php?cible=main&fonction=stats">Accéder a vos statistiques</a>
    <a class="a_button" href="index.php?cible=main&fonction=info-profile">Informations de votre profil</a>
    
    <?php 
    if($_SESSION['isAdmin'] == 1){
    ?>

    <a class="a_button" href="index.php?cible=main&fonction=gestion">Informations de votre profil</a>
    
    <?php
    }
    ?>

</div>

<?php
}else{
    header("Location: index.php?cible=main&fonction=login");
}
?>