<?php 
if(isset($_SESSION['id']) && isset($_SESSION['userTag'])){
  if($_SESSION['isAdmin'] == 1){
?>

<h1>
    Gestion des utilisateurs
</h1>

<?php
include('models/connexion.php');
$result = mysqli_query($bdd, "SELECT * FROM utilisateur ORDER BY userId");

echo "<table>";
echo "<tr><th>Numéro</th><th>Date d'inscription</th><th>Statut</th><th>Administrateur ?</th><th>Nom</th><th>Prénom</th><th>Date de naissance</th><th>Sexe</th><th>Email</th><th>Login</th><th>Téléphone</th></tr>";

while ($row = mysqli_fetch_assoc($result)) {
    $userId = $row['userId'];
    $userDate = $row['userDate'];
    $userState = $row['userState'];
    if ($userState == 1) {
        $userState_Text = "Actif";
    } else {
        $userState_Text = "Inactif";
    }
    $userIsAdmin = $row['userIsAdmin'];
    if ($userIsAdmin == 1) {
        $userIsAdmin_Text = "Oui";
    } else {
        $userIsAdmin_Text = "Non";
    }
    $userFirstname = $row['userFirstname'];
    $userSurname = $row['userSurname'];
    $userBirth = $row['userBirth'];
    $userGender = $row['userGender'];
    if ($userGender == 0) {
        $userGender_Text = "Homme";
    } else {
        $userGender_Text = "Femme";
    }
    $userEmail = $row['userEmail'];
    $userTag = $row['userTag'];
    $userPhone = $row['userPhone'];
    echo "<tr>
    <td>" . $userId . "</td>
    <td>" . $userDate . "</td>
    <td>" . $userState_Text . "</td>
    <td>" . $userIsAdmin_Text . "</td>
    <td>" . $userFirstname . "</td>
    <td>" . $userSurname . "</td>
    <td>" . $userBirth . "</td>
    <td>" . $userGender_Text . "</td>
    <td>" . $userEmail . "</td>
    <td>" . $userTag . "</td>
    <td>" . $userPhone . "</td>
    <td>
    <form action='./models/user_delete.php' method='post'>
    <input type='hidden' name='userId' value='".$userId."'></input>
    <input type='submit' class='gestion_button' value='Supprimer utilisateur' name='supprimer_utilisateur'></input>
    </form>
    </td>";
    echo "</tr>";
}

echo "</table>";
?>

<div class="login-box">
    <a class="register" href="index.php?cible=main&fonction=gestion">Retour à la gestion</a>
</div>

<?php
  }else{
        header("Location: index.php?cible=main&fonction=accueil");
  }
}else{
    header("Location: index.php?cible=main&fonction=login");
}
?>