<?php 
if(isset($_SESSION['id']) && isset($_SESSION['userTag'])){
  if($_SESSION['isAdmin'] == 1){
?>

<?php
include('models/connexion.php');
if (isset($_POST['immeubleId'])) {
    function validate($data){
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    $immeubleId = validate($_POST['immeubleId']);

    echo "<h1>Gestion des appartements pour la maison " . $immeubleId . "</h1>";

    $result = mysqli_query($bdd, "SELECT appartementId, appartementTypeLibelle, appartementSecurityLibelle FROM appartement NATURAL JOIN type_appartement NATURAL JOIN security_appartement WHERE immeubleId=".$immeubleId." ORDER BY appartementId");

    echo "<table>";
    echo "<tr><th>Numéro</th><th>Type</th><th>Degre de securite</th></tr>";

    while ($row = mysqli_fetch_assoc($result)) {
        $appartementId = $row['appartementId'];
        $appartementTypeLibelle = $row['appartementTypeLibelle'];
        $appartementSecurityLibelle = $row['appartementSecurityLibelle'];
        echo "<tr>
        <td>" . $appartementId . "</td>
        <td>" . $appartementTypeLibelle . "</td>
        <td>" . $appartementSecurityLibelle . "</td>
        <td>
        <form action='./vues/gestion_pieces.php' method='post'>
        <input type='hidden' name='appartementId' value='".$appartementId."'></input>
        <input type='submit' class='gestion_button' value='Gérer pièces' name='gerer_pieces'></input>
        </form>
        </td>
        <td>
        <form action='./models/appartement_delete.php' method='post'>
        <input type='hidden' name='appartementId' value='".$appartementId."'></input>
        <input type='submit' class='gestion_button' value='Supprimer appartement' name='supprimer_appartement'></input>
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
        header("Location: index.php?cible=main&fonction=profil");
  }
}else{
    header("Location: index.php?cible=main&fonction=login");
}
?>