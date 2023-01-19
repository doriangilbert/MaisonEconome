<?php
session_start(); 
include "connexion.php";
if (
    isset($_POST['surname']) && 
    isset($_POST['firstname']) && 
    isset($_POST['birthDate']) && 
    isset($_POST['genre']) && 
    isset($_POST['userPhone'])
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

    $userFirstname = validate_string($_POST['firstname']);
    $userSurname = validate_string($_POST['surname']);
    $userPhone = validate_string($_POST['userPhone']);
    $userEmail = validate_string($_POST['userEmail']);

    $userGenre = convert_genre(validate_string($_POST['genre']));

    $userBdate = refactor_date(validate_string($_POST['birthDate']));

    if (empty($userFirstname)) {

        header("Location: ../index.php?cible=main&fonction=register&error=Veuillez entrer votre prénom.");
        exit();

    }else if(empty($userSurname)){

        header("Location: ../index.php?cible=main&fonction=register&error=Veuillez entrer votre nom de famille.");
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

    }else{

        $username = $userSurname. '.' .$userFirstname;

        $session_tag = $_SESSION['userTag'];
        $session_firstname = $_SESSION['userFirstname'];
        $session_surname = $_SESSION['userSurname'];
        $session_birth = $_SESSION['userBirth'];
        $session_gender = $_SESSION['userGender'];
        $session_email = $_SESSION['userEmail'];
        $session_phone = $_SESSION['userPhone'];

        $sql = "UPDATE utilisateur 
                SET userFirstname='$userFirstname', userSurname='$userSurname', userBirth='$userBdate', userGender='$userGenre', userEmail='$userEmail', userTag='$username', userPhone='$userPhone'
                WHERE userFirstname='$session_firstname' AND userSurname='$session_surname' AND userBirth='$session_birth' AND userGender='$session_gender' AND userEmail='$session_email' AND userTag='$session_tag' AND userPhone='$session_phone'";
        $is_sent = mysqli_query($bdd, $sql);

        if(mysqli_affected_rows($bdd) > 0){

            $_SESSION['userTag'] = $username;
            $_SESSION['userFirstname'] = $userFirstname;
            $_SESSION['userSurname'] = $userSurname;
            $_SESSION['userBirth'] = $userBdate;
            $_SESSION['userGender'] = $userGenre;
            $_SESSION['userEmail'] = $userEmail;
            $_SESSION['userPhone'] = $userPhone;

            header("Location: ../index.php?cible=main&fonction=info_profil&error=Mise a jour du profil réussie !");
            exit();

        }else{
            header("Location: ../index.php?cible=main&fonction=info_profil&error=Une erreur est survenu lors de la mise a jour du compte.");
            exit();
        }
    }
}
