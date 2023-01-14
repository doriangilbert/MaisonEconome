<?php 
if(isset($_SESSION['id']) && isset($_SESSION['userTag'])){
?>

<h1>
    Bienvenu <?php echo $_SESSION['userFirstname']; ?> !
</h1>

<?php
}else{
    header("Location: index.php?cible=main&fonction=login");
}
?>