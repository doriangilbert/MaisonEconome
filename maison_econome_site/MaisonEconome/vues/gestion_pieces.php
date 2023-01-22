<?php 
if(isset($_SESSION['id']) && isset($_SESSION['userTag'])){
  if($_SESSION['isAdmin'] == 1){
?>

<?php
include('models/connexion.php');
if (isset($_POST['appartementId'])) {
    function validate($data){
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    $appartementId = validate($_POST['appartementId']);

    echo "<h1>Gestion des pièces pour l'appartement " . $appartementId . "</h1>";

    $result = mysqli_query($bdd, "SELECT pieceId, pieceLibelle, typePieceLibelle FROM piece NATURAL JOIN type_piece WHERE appartementId=".$appartementId." ORDER BY pieceId");

    echo "<table>";
    echo "<tr><th>Numéro</th><th>Libelle</th><th>Type</th></tr>";

    while ($row = mysqli_fetch_assoc($result)) {
        $pieceId = $row['pieceId'];
        $pieceLibelle = $row['pieceLibelle'];
        $typePieceLibelle = $row['typePieceLibelle'];
        echo "<tr>
        <td>" . $pieceId . "</td>
        <td>" . $pieceLibelle . "</td>
        <td>" . $typePieceLibelle . "</td>
        <td>
        <form action='index.php?cible=main&fonction=gestion_equipements' method='post'>
        <input type='hidden' name='pieceId' value='".$pieceId."'></input>
        <input type='submit' class='gestion_button' value='Gérer équipements' name='gerer_equipements'></input>
        </form>
        </td>
        <td>
        <form action='./models/piece_delete.php' method='post'>
        <input type='hidden' name='pieceId' value='".$pieceId."'></input>
        <input type='submit' class='gestion_button' value='Supprimer pièce' name='supprimer_piece'></input>
        </form>
        </td>";
        echo "</tr>";
    }

    echo "</table>";
}else{
    header("Location: ../index.php?cible=main&fonction=login");
    exit();
}
?>

<div class="login-box">
    <a class="register" href="index.php?cible=main&fonction=gestion_maisons">Retour à la gestion des maisons</a>
</div>

<?php
  }else{
        header("Location: index.php?cible=main&fonction=accueil");
  }
}else{
    header("Location: index.php?cible=main&fonction=login");
}
?>