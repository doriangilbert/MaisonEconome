<?php 
include "connexion.php";
if (isset($_POST['immeubleId'])) {
    function validate($data){
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    $immeubleId = validate($_POST['immeubleId']);
    $sql = "DELETE FROM immeuble WHERE immeubleId='$immeubleId'";
    $is_sent = mysqli_query($bdd, $sql);
    if($is_sent){

        header("Location: ../index.php?cible=main&fonction=gestion_maisons&success=La maison a bien été supprimée.");
        exit();

    }else{
        header("Location: ../index.php?cible=main&fonction=gestion_maisons&error=Une erreur est survenue lors de la suppression de la maison.");
        exit();
    }
}else{
    header("Location: ../index.php?cible=main&fonction=login");
    exit();
}
?>