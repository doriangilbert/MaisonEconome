<head>
    <style>
        /* Style à reporter dans le CSS */
        table, th, td {
            border: 1px solid white;
            border-collapse: collapse;
        }
        th, td {
            padding: 5px;
            text-align: left;
            color: white;
        }
    </style>
</head>
<?php
    include ('models/connexion.php');
    $result=mysqli_query($bdd,"SELECT * FROM utilisateur ORDER BY userId");

    echo "<table>";
    echo "<tr><th>Numéro</th><th>Date d'inscription</th><th>Statut</th><th>Administrateur ?</th><th>Nom</th><th>Prénom</th><th>Date de naissance</th><th>Sexe</th><th>Email</th><th>Login</th><th>Téléphone</th></tr>";

    while($row = mysqli_fetch_array($result)) {
        $userId = $row['userId'];
        $userDate = $row['userDate'];
        $userState = $row['userState'];
        if($userState == 1) {
            $userState = "Actif";
        }
        else {
            $userState = "Inactif";
        }
        $userIsAdmin = $row['userIsAdmin'];
        if($userIsAdmin == 1) {
            $userIsAdmin = "Oui";
        }
        else {
            $userIsAdmin = "Non";
        }
        $userFirstname = $row['userFirstname'];
        $userSurname = $row['userSurname'];
        $userBirth = $row['userBirth'];
        $userGender = $row['userGender'];
        if($userGender == 0) {
            $userGender = "Homme";
        }
        else {
            $userGender = "Femme";
        }
        $userEmail = $row['userEmail'];
        $userTag = $row['userTag'];
        $userPhone = $row['userPhone'];
        echo "<tr><td>".$userId."</td><td>".$userDate."</td><td>".$userState."</td><td>".$userIsAdmin."</td><td>".$userFirstname."</td><td>".$userSurname."</td><td>".$userBirth."</td><td>".$userGender."</td><td>".$userEmail."</td><td>".$userTag."</td><td>.$userPhone.</td><td><div class='login-box'><a class='register' href='index.php?cible=main&fonction=gestion_utilisateurs'>Supprimer l'utilisateur</a></td></tr>";
    } 

    echo "</table>";
