<?php
 
    session_start();

    $last_value = 'не задано';
    $current_value = 'не задано';

    if (isset($_SESSION['param1'])) {
        $last_value = $_SESSION['param1'];    
    }

    $mod = null;
    if (isset($_GET['mod'])) {
        $mod = $_GET['mod'];
    }
    echo $mod;
    switch ($mod) {
        case 'create':
            include 'create.php';
            break;
        case 'read':
            include 'read.php';
            break;
        case 'delete':
            include 'delete.php';
            break;
        default:
            include 'nothing.php';
    }

 ?>