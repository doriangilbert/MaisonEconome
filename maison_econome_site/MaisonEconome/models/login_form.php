<?php 
session_start(); 
include "connexion.php";
if (isset($_POST['username']) && isset($_POST['password'])) {

    function validate($data){

       $data = trim($data);
       $data = stripslashes($data);
       $data = htmlspecialchars($data);
       return $data;

    }

    $username = validate($_POST['username']);
    $pass = validate($_POST['password']);

    if (empty($username)) {

        header("Location: login.php?error=Un nom d'utilisateur est requis.");
        exit();

    }else if(empty($pass)){

        header("Location: login.php?error=Un mot de passe est requis.");
        exit();

    }else{

        $sql = "SELECT * FROM utilisateur WHERE userTag='$username' AND userPassword='$pass'";
        $result = mysqli_query($bdd, $sql);

        if (mysqli_num_rows($result) === 1) {

            $row = mysqli_fetch_assoc($result);

            if ($row['userTag'] === $username && $row['userPassword'] === $pass) {

                echo "Logged in!";
                $_SESSION['userTag'] = $row['userTag'];
                $_SESSION['isAdmin'] = $row['userIsAdmin'];
                $_SESSION['id'] = $row['userId'];
                header("Location: ../index.php?cible=main&fonction=home");
                exit();

            }else{

                header("Location: ../index.php?cible=main&fonction=login&error=Mot de passe ou nom d'utilisateur invalide.");
                exit();

            }
        }else{

            header("Location: ../index.php?cible=main&fonction=login&error=Mot de passe ou nom d'utilisateur invalide.");
            exit();

        }
    }
}else{
    header("Location: ../index.php?cible=main&fonction=login");
    exit();
}