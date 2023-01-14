<?php

try{
    $bdd = mysqli_connect("127.0.0.1", "root", "","maisoneconome");
}
catch(Exception $e)
{
    die('Erreur : '.$e->getMessage());
}
