<?php 
if(!isset($_SESSION['id']) && !isset($_SESSION['userTag'])){
?>

<h2 class="titre">Connexion</h2>

<div class="login-box">
    <form action="./models/login_form.php" method="post" class="form">

        <?php if (isset($error)) {
            include('models/login_error.php');
        } ?>

        <label>Nom :</label>
        <input type="text" name="username" placeholder="Nom" required><br>

        <label>Mot de passe :</label>
        <input type="password" name="password" placeholder="Mot de passe" autocomplete="off" required><br>
            
        <button type="submit">Se connecter</button>
    </form>
</div>

<?php
}else{
    header("Location: index.php?cible=main&fonction=home");
}
?>