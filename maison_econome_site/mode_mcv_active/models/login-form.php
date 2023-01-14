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

        $sql = "SELECT * FROM utilisateur WHERE user_name='$username' AND password='$pass'";
        $result = mysqli_query($bdd, $sql);

        if (mysqli_num_rows($result) === 1) {

            $row = mysqli_fetch_assoc($result);

            if ($row['user_name'] === $username && $row['password'] === $pass) {

                echo "Logged in!";
                $_SESSION['user_name'] = $row['user_name'];
                $_SESSION['name'] = $row['name'];
                $_SESSION['id'] = $row['id'];
                header("Location: welcome.php");
                exit();

            }else{

                header("Location: login.php?error=Mot de passe ou nom d'utilisateur invalide.");
                exit();

            }
        }else{

            header("Location: login.php?error=Mot de passe ou nom d'utilisateur invalide.");
            exit();

        }
    }
}else{
    header("Location: login.php");
    exit();
}