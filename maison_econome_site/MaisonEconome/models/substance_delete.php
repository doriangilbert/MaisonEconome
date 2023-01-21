<?php 
include "connexion.php";
if (isset($_POST['substanceId'])) {
    function validate($data){
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    $substanceId = validate($_POST['substanceId']);
    $sql = "DELETE FROM substance WHERE substanceId='$substanceId'";
    $is_sent = mysqli_query($bdd, $sql);
    if($is_sent){

        header("Location: ../index.php?cible=main&fonction=gestion_substances&success=La substance a bien été supprimée.");
        exit();

    }else{
        header("Location: ../index.php?cible=main&fonction=gestion_substances&error=Une erreur est survenue lors de la suppression de la substance.");
        exit();
    }
}else{
    header("Location: ../index.php?cible=main&fonction=login");
    exit();
}
?>