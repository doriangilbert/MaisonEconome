<?php 
include "connexion.php";
if (isset($_POST['equipementId'])) {
    function validate($data){
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    $equipementId = validate($_POST['equipementId']);
    $sql = "DELETE FROM equipement WHERE equipementId='$equipementId'";
    $is_sent = mysqli_query($bdd, $sql);
    if($is_sent){

        header("Location: ../index.php?cible=main&fonction=gestion_maisons&success=L'equipement a bien été supprimé.");
        exit();

    }else{
        header("Location: ../index.php?cible=main&fonction=gestion_maisons&error=Une erreur est survenue lors de la suppression de l'equipement.");
        exit();
    }
}else{
    header("Location: ../index.php?cible=main&fonction=login");
    exit();
}
?>