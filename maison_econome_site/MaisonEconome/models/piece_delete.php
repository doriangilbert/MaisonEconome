<?php 
include "connexion.php";
if (isset($_POST['pieceId'])) {
    function validate($data){
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    $pieceId = validate($_POST['pieceId']);
    $sql = "DELETE FROM piece WHERE pieceId='$pieceId'";
    $is_sent = mysqli_query($bdd, $sql);
    if($is_sent){

        header("Location: ../index.php?cible=main&fonction=gestion_maisons&success=La piece a bien été supprimée.");
        exit();

    }else{
        header("Location: ../index.php?cible=main&fonction=gestion_maisons&error=Une erreur est survenue lors de la suppression de la piece.");
        exit();
    }
}else{
    header("Location: ../index.php?cible=main&fonction=login");
    exit();
}
?>