<?php 
if(isset($_SESSION['id']) && isset($_SESSION['userTag'])){
  if($_SESSION['isAdmin'] == 1){
?>

<head>
    <style>
        /* Style à reporter dans le CSS */
        table,
        th,
        td {
            border: 1px solid white;
            border-collapse: collapse;
            padding: 10px;
        }

        table {
            margin: 2%;
        }

        th,
        td {
            text-align: center;
        }

        .button {
            background-color: #484848;
            color: #e9e9e9;

            font-size: 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;

            border: none;
            border-radius: 10px;

            padding: 10px 20px;
            margin: 4px 2px;
            cursor: pointer;
        }
    </style>
</head>

<h1>
    Gestion des substances
</h1>

<?php
include('models/connexion.php');
$result = mysqli_query($bdd, "SELECT * FROM substance ORDER BY substanceId");

echo "<table>";
echo "<tr><th>Numéro</th><th>Libellé</th><th>Description</th><th>Valeur minimale</th><th>Valeur maximale</th><th>Valeur critique</th><th>Valeur idéale</th></tr>";

while ($row = mysqli_fetch_assoc($result)) {
    $substanceId = $row['substanceId'];
    $substanceLibelle = $row['substanceLibelle'];
    $substanceDescription = $row['substanceDescription'];
    $substanceValMin = $row['substanceValMin'];
    $substanceValMax = $row['substanceValMax'];
    $substanceValCritique = $row['substanceValCritique'];
    $substanceValIdeale = $row['substanceValIdeale'];
    echo "<tr>
    <td>" . $substanceId . "</td>
    <td>" . $substanceLibelle . "</td>
    <td>" . $substanceDescription . "</td>
    <td>" . $substanceValMin . "</td>
    <td>" . $substanceValMax . "</td>
    <td>" . $substanceValCritique . "</td>
    <td>" . $substanceValIdeale . "</td>
    <td>
    <form action='./models/substance_delete.php' method='post'>
    <input type='hidden' name='substanceId' value='".$substanceId."'></input>
    <input type='submit' class='button' value='Supprimer substance' name='supprimer_substance'></input>
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