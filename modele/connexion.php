<?php

try{	
    // Connection using PDO
    //$db = new PDO("mysql:host=localhost;dbname=maisonconnectee", "root", "");
    // Connection using mysqli
    //$bdd = mysqli_connect("127.0.0.1", "root", "","maisonconnectee");
    $bdd = mysqli_connect("127.0.0.1", "root", "","maisoneconome");
}
catch(Exception $e)
{
    die('Erreur : '.$e->getMessage());
}