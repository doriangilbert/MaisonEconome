<head>
    <style>
        /* Style à reporter dans le CSS */
        table, th, td {
            border: 1px solid white;
            border-collapse: collapse;
            padding: 5px;
        }

        table {
            margin: 2%;
        }

        .button {
            background-color: #484848;
            color: #e9e9e9;

            font-size: 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;

            border: none;
            border-radius: 10px;

            padding: 2%;
            margin: 2%;
        }
    </style>
</head>
<?php
include('models/connexion.php');
$result = mysqli_query($bdd, "SELECT * FROM utilisateur ORDER BY userId");

echo "<table>";
echo "<tr><th>Numéro</th><th>Date d'inscription</th><th>Statut</th><th>Administrateur ?</th><th>Nom</th><th>Prénom</th><th>Date de naissance</th><th>Sexe</th><th>Email</th><th>Login</th><th>Téléphone</th></tr>";

while ($row = mysqli_fetch_array($result)) {
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
    <td>".$userPhone."</td>
    <td><a class='button' href='index.php?cible=main&fonction=gestion_utilisateurs'>Supprimer l'utilisateur</a></td>";
    if ($userIsAdmin == 1) {
        echo "<td><input type='checkbox' id='admincheck' name='admincheck' checked><label for='admincheck'>Admin</label></td>";
    }
    else {
        echo "<td><input type='checkbox' id='admincheck' name='admincheck'><label for='admincheck'>Admin</label></td>";
    }
    echo "</tr>";

}

echo "</table>";
?>

<div class="login-box">
    <a class="register" href="index.php?cible=main&fonction=profil">Retour au profil</a>
</div>