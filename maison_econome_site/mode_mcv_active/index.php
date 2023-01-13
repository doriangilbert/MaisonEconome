<?php

ini_set('display_errors', 1);

include("models/main_error.php");

if(isset($_GET[ 'cible' ]) && !empty($_GET[ 'cible' ])){
    $url = $_GET[ 'cible' ];
}else{
    $url = 'main';
}

include('controllers/' . $url . '.php');