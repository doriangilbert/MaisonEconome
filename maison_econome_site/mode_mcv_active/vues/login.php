<h2 class="titre">Connexion</h2>

<div class="login-box">
    <form action="./models/login-form.php" method="post" class="form">

        <?php if (isset($_GET['error'])) { ?>
        <p class="error">
            <?php echo $_GET['error']; ?>
        </p>
        <?php } ?>

        <label>Nom</label>
        <input type="text" name="username" placeholder="Nom" required><br>

        <label>Mot de passe</label>
        <input type="password" name="password" placeholder="Mot de passe" autocomplete="off" required><br>
            
        <button type="submit" class="button">Login</button>
    </form>
</div>
