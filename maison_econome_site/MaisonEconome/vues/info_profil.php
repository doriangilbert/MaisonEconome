<?php 
if(isset($_SESSION['id']) && isset($_SESSION['userTag'])){
?>

<h2 class="titre">Informations de votre profil</h2>

<div class="login-box">
    <form action="./models/update_profile_form.php" method="post" class="form">

        <?php if (isset($error)) {
            include('models/error.php');
        } ?>

        <label>Nom :</label>
        <input type="text" name="surname" placeholder="Nom" value="<?php echo($_SESSION['userSurname']); ?>" required><br>

        <label>Prénom :</label>
        <input type="text" name="firstname" placeholder="Prénom" value="<?php echo($_SESSION['userFirstname']); ?>" required><br>

        <label>Adresse E-mail :</label>
        <input type="text" name="userEmail" placeholder="Adresse E-mail" autocomplete="off" value="<?php echo($_SESSION['userEmail']); ?>" required><br>

        <label>Date de naissance :</label>
        <input type="date" name="birthDate" placeholder="Date de naissance" value="<?php echo($_SESSION['userBirth']); ?>" required><br>

        <label>Genre :</label>
        <select name="genre" required>
            <option value="male">Homme</option>
            <option value="female" <?php if($_SESSION['userGender'] == 1) { echo('selected'); } ?> >Femme</option>
        </select>

        <label>Numéro de téléphone :</label>
        <input type="text" name="userPhone" placeholder="Numéro de téléphone" autocomplete="off" value="<?php echo($_SESSION['userPhone']); ?>" pattern="\d{10,10}" required><br>

        <label>Nom de login :</label>
        <input readonly type="text" name="userTag" placeholder="Nom de login" autocomplete="off" value="<?php echo($_SESSION['userTag']); ?>" required><br>

        <button type="submit">Mettre a jour vos informations</button>
    </form>
</div>
<div class="div-block">
    <a class="a-button" href="index.php?cible=main&fonction=acceuil">Retour a l'acceuil</a>
</div>
<?php
}else{
    header("Location: index.php?cible=main&fonction=welcome");
}
?>