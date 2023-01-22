<?php
if(isset($_SESSION['id']) && isset($_SESSION['userTag'])){
  if($_SESSION['isAdmin'] == 1){
?>

<?php
include('models/connexion.php');
if (isset($_POST['pieceId'])) {
    function validate($data){
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    $pieceId = validate($_POST['pieceId']);

    echo "<h1>Gestion des équipements pour la pièce " . $pieceId . "</h1>";

    $result = mysqli_query($bdd, "SELECT equipementId, equipementLibelle, equipementDescription, descriptionLieu, typeEquipementLibelle FROM equipement NATURAL JOIN type_equipement WHERE pieceId=".$pieceId." ORDER BY equipementId");

    echo "<table>";
    echo "<tr><th>Numéro</th><th>Libelle</th><th>Description</th><th>Lieu</th><th>Type</th></tr>";

    while ($row = mysqli_fetch_assoc($result)) {
        $equipementId = $row['equipementId'];
        $equipementLibelle = $row['equipementLibelle'];
        $equipementDescription = $row['equipementDescription'];
        $descriptionLieu = $row['descriptionLieu'];
        $typeEquipementLibelle = $row['typeEquipementLibelle'];
        echo "<tr>
        <td>" . $equipementId . "</td>
        <td>" . $equipementLibelle . "</td>
        <td>" . $equipementDescription . "</td>
        <td>" . $descriptionLieu . "</td>
        <td>" . $typeEquipementLibelle . "</td>
        <td>
        <form action='./models/equipement_delete.php' method='post'>
        <input type='hidden' name='equipementId' value='".$equipementId."'></input>
        <input type='submit' class='gestion_button' value='Supprimer équipement' name='supprimer_equipement'></input>
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