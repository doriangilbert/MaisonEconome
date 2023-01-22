<?php 
include "connexion.php";
if (isset($_POST['appartementId'])) {
    function validate($data){
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    $appartementId = validate($_POST['appartementId']);
    $sql = "DELETE FROM appartement WHERE appartementId='$appartementId'";
    $is_sent = mysqli_query($bdd, $sql);
    if($is_sent){

        header("Location: ../index.php?cible=main&fonction=gestion_maisons&success=L'appartement a bien été supprimé.");
        exit();

    }else{
        header("Location: ../index.php?cible=main&fonction=gestion_maisons&error=Une erreur est survenue lors de la suppression de l'appartement.");
        exit();
    }
}else{
    header("Location: ../index.php?cible=main&fonction=login");
    exit();
}
?>