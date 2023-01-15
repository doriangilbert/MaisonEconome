<?php
session_start(); 
include "connexion.php";
if (
    isset($_POST['name']) && 
    isset($_POST['surname']) && 
    isset($_POST['birthDate']) && 
    isset($_POST['genre']) && 
    isset($_POST['userPhone']) && 
    isset($_POST['password'])
    ) {

    function validate_string($data){

       $data = trim($data);
       $data = stripslashes($data);
       $data = htmlspecialchars($data);
       return $data;

    }

    function refactor_date($date){
        
        $newDate = date("Y-m-d", strtotime($date));
        return $newDate;

    }

    function convert_genre($genre){
        
        if($genre == "male"){
            $genre = 0;
        }else{
            $genre = 1;
        }
        return $genre;

    }

    $userFirstname = validate_string($_POST['name']);
    $userSurname = validate_string($_POST['surname']);
    $userPhone = validate_string($_POST['userPhone']);
    $userPass = validate_string($_POST['password']);
    $userEmail = validate_string($_POST['userEmail']);

    $userGenre = convert_genre(validate_string($_POST['genre']));

    $userBdate = refactor_date(validate_string($_POST['birthDate']));

    if (empty($userFirstname)) {

        header("Location: ../index.php?cible=main&fonction=register&error=Veuillez entrer votre nom.");
        exit();

    }else if(empty($userSurname)){

        header("Location: ../index.php?cible=main&fonction=register&error=Veuillez entrer votre prénom.");
        exit();

    }else if(empty($userEmail)){

        header("Location: ../index.php?cible=main&fonction=register&error=Veuillez entrer votre adresse mail.");
        exit();

    }else if(empty($userPhone)){

        header("Location: ../index.php?cible=main&fonction=register&error=Veuillez entrer votre numéro de téléphone.");
        exit();

    }else if(empty($userBdate)){

        header("Location: ../index.php?cible=main&fonction=register&error=Veuillez entrer votre date de naissance.");
        exit();

    }else if(empty($userPass)){

        header("Location: ../index.php?cible=main&fonction=register&error=Un mot de passe est requis.");
        exit();

    }else{

        $username = $userSurname. '.' .$userFirstname;

        $sql = "INSERT INTO utilisateur (userDate, userState, userIsAdmin, userFirstname, userSurname, userBirth, userGender, userEmail, userTag, userPhone, userPassword)
                VALUES (CURRENT_DATE, 1, 0, '$userFirstname', '$userSurname', '$userBdate', '$userGenre', '$userEmail', '$username', '$userPhone', '$userPass')";
        $is_sent = mysqli_query($bdd, $sql);

        if($is_sent){

            header("Location: ../index.php?cible=main&fonction=login");
            exit();

        }else{
            header("Location: ../index.php?cible=main&fonction=register&error=Une erreur est survenu lors de la création du compte.");
            exit();
        }
    }
}










           /* $row = mysqli_fetch_assoc($result);

            if ($row['userTag'] === $username && $row['userPassword'] === $pass) {

                echo "Logged in!";
                $_SESSION['id'] = $row['userId'];
                $_SESSION['userTag'] = $row['userTag'];
                $_SESSION['isAdmin'] = $row['userIsAdmin'];
                $_SESSION['userDate'] = $row['userDate'];
                $_SESSION['userState'] = $row['userState'];
                $_SESSION['userFirstname'] = $row['userFirstname'];
                $_SESSION['userSurname'] = $row['userSurname'];
                $_SESSION['userBirth'] = $row['userId'];
                $_SESSION['userGender'] = $row['userGender'];
                $_SESSION['userEmail'] = $row['userEmail'];
                $_SESSION['userPhone'] = $row['userPhone'];
                header("Location: ../index.php?cible=main&fonction=profil");
                exit();

            }else{

                header("Location: ../index.php?cible=main&fonction=register&error=Mot de passe ou nom d'utilisateur invalide.");
                exit();

            }
        }else{

            header("Location: ../index.php?cible=main&fonction=register&error=Mot de passe ou nom d'utilisateur invalide.");
            exit();

        }
    }
}else{
    header("Location: ../index.php?cible=main&fonction=register");
    exit();
}*/