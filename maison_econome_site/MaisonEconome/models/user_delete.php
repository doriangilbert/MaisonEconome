<?php 
include "connexion.php";
if (isset($_POST['userId'])) {
    function validate($data){
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    $userId = validate($_POST['userId']);
    var_dump($userId);
    print_r($userId);
    $sql = "DELETE FROM utilisateur WHERE userId='$userId'";
    print_r($sql);
    $is_sent = mysqli_query($bdd, $sql);
    if($is_sent){

        header("Location: ../index.php?cible=main&fonction=gestion_utilisateurs&success=Le compte a bien été supprimé.");
        exit();

    }else{
        header("Location: ../index.php?cible=main&fonction=gestion_utilisateurs&error=Une erreur est survenue lors de la suppression du compte.");
        exit();
    }
}else{
    header("Location: ../index.php?cible=main&fonction=login");
    exit();
}
?>