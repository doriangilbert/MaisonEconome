<?php 
if(!isset($_SESSION['id']) && !isset($_SESSION['userTag'])){
?>

<h2 class="titre">Inscription</h2>

<div class="login-box">
    <form action="./models/register_form.php" method="post" class="form">

        <?php if (isset($error)) {
            include('models/error.php');
        } ?>

        <label>Nom :</label>
        <input type="text" name="name" placeholder="Nom" required><br>

        <label>Prénom :</label>
        <input type="text" name="surname" placeholder="Prénom" required><br>

        <label>Adresse E-mail :</label>
        <input type="text" name="userEmail" placeholder="Adresse E-mail" autocomplete="off" required><br>

        <label>Date de naissance :</label>
        <input type="date" name="birthDate" placeholder="Date de naissance" required><br>

        <label>Genre :</label>
        <select name="genre" required>
            <option value="male">Homme</option>
            <option value="female">Femme</option>
        </select>

        <label>Numéro de téléphone :</label>
        <input type="text" name="userPhone" placeholder="Numéro de téléphone" autocomplete="off" pattern="\d{10,10}" required><br>

        <label>Mot de passe :</label>
        <input type="password" name="password" placeholder="Mot de passe" autocomplete="off" required><br>
            
        <button type="submit">S'inscrire</button>
    </form>
</div>
<div class="div-block">
    <a class="a-button" href="index.php?cible=main&fonction=register">Se connecter</a>
</div>

<?php
}else{
    header("Location: index.php?cible=main&fonction=home");
}
?>