<?php 
if(isset($_SESSION['id']) && isset($_SESSION['userTag'])){
  if($_SESSION['isAdmin'] == 1){
?>

<h1>
    Gestion des maisons
</h1>

<?php
include('models/connexion.php');
$result = mysqli_query($bdd, "SELECT immeubleId, immeubleNom, immeubleNumero, immeubleRue, immeubleCP, villeLibelle, immeubleEvalBase, immeubleIsolation FROM immeuble NATURAL JOIN ville ORDER BY immeubleId");

echo "<table>";
echo "<tr><th>Numéro</th><th>Nom</th><th>Adresse</th><th>Evaluation de base</th><th>Degré d'isolation</th></tr>";

while ($row = mysqli_fetch_assoc($result)) {
    $immeubleId = $row['immeubleId'];
    $immeubleNom = $row['immeubleNom'];
    $immeubleNumero = $row['immeubleNumero'];
    $immeubleRue = $row['immeubleRue'];
    $immeubleCP = $row['immeubleCP'];
    $villeLibelle = $row['villeLibelle'];
    $immeubleEvalBase = $row['immeubleEvalBase'];
    $immeubleIsolation = $row['immeubleIsolation'];
    $adresse = $immeubleNumero." ".$immeubleRue.", ".$immeubleCP.", ".$villeLibelle;
    echo "<tr>
    <td>" . $immeubleId . "</td>
    <td>" . $immeubleNom . "</td>
    <td>" . $adresse . "</td>
    <td>" . $immeubleEvalBase . "</td>
    <td>" . $immeubleIsolation . "</td>
    <td>
    <form action='index.php?cible=main&fonction=gestion_appartements' method='post'>
    <input type='hidden' name='immeubleId' value='".$immeubleId."'></input>
    <input type='submit' class='gestion_button' value='Gérer appartements' name='gerer_appartements'></input>
    </form>
    </td>
    <td>
    <form action='./models/maison_delete.php' method='post'>
    <input type='hidden' name='immeubleId' value='".$immeubleId."'></input>
    <input type='submit' class='gestion_button' value='Supprimer maison' name='supprimer_maison'></input>
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