<?php 
if(isset($_SESSION['id']) && isset($_SESSION['userTag'])){
  if($_SESSION['isAdmin'] == 1){
?>

<h1>
    Gestion des ressources
</h1>

<?php
include('models/connexion.php');
$result = mysqli_query($bdd, "SELECT * FROM ressource ORDER BY ressourceId");

echo "<table>";
echo "<tr><th>Numéro</th><th>Libellé</th><th>Description</th><th>Valeur minimale</th><th>Valeur maximale</th><th>Valeur critique</th><th>Valeur idéale</th></tr>";

while ($row = mysqli_fetch_assoc($result)) {
    $ressourceId = $row['ressourceId'];
    $ressourceLibelle = $row['ressourceLibelle'];
    $ressourceDescription = $row['ressourceDescription'];
    $ressourceValMin = $row['ressourceValMin'];
    $ressourceValMax = $row['ressourceValMax'];
    $ressourceValCritique = $row['ressourceValCritique'];
    $ressourceValIdeale = $row['ressourceValIdeale'];
    echo "<tr>
    <td>" . $ressourceId . "</td>
    <td>" . $ressourceLibelle . "</td>
    <td>" . $ressourceDescription . "</td>
    <td>" . $ressourceValMin . "</td>
    <td>" . $ressourceValMax . "</td>
    <td>" . $ressourceValCritique . "</td>
    <td>" . $ressourceValIdeale . "</td>
    <td>
    <form action='./models/ressource_delete.php' method='post'>
    <input type='hidden' name='ressourceId' value='".$ressourceId."'></input>
    <input type='submit' class='gestion_button' value='Supprimer ressource' name='supprimer_ressource'></input>
    </form>
    </td>";
    echo "</tr>";
}

echo "</table>";
?>

<div class="login-box">
    <a class="register" href="index.php?cible=main&fonction=gestion">Retour à la gestion</a>
</div>

<?php
  }else{
        header("Location: index.php?cible=main&fonction=profil");
  }
}else{
    header("Location: index.php?cible=main&fonction=login");
}
?>