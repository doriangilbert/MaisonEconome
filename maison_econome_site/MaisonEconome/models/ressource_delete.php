<?php 
include "connexion.php";
if (isset($_POST['ressourceId'])) {
    function validate($data){
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    $ressourceId = validate($_POST['ressourceId']);
    $sql = "DELETE FROM ressource WHERE ressourceId='$ressourceId'";
    $is_sent = mysqli_query($bdd, $sql);
    if($is_sent){

        header("Location: ../index.php?cible=main&fonction=gestion_ressources&success=La ressource a bien été supprimée.");
        exit();

    }else{
        header("Location: ../index.php?cible=main&fonction=gestion_ressources&error=Une erreur est survenue lors de la suppression de la ressource.");
        exit();
    }
}else{
    header("Location: ../index.php?cible=main&fonction=login");
    exit();
}
?>