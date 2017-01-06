<?php
 
    session_start();

    $last_value = 'не задано';
    $current_value = 'не задано';

    if (isset($_SESSION['param1'])) {
        $last_value = $_SESSION['param1'];    
    }

    if (isset($_GET['param1'])) {
        $current_value = $_GET['param1'];
        $_SESSION['param1'] = $_GET['param1'];   
    }

    echo '<p><b>Last value: </b>'.$last_value.'</p>'.'<p><b>Current value: </b>'.$current_value.'</p>';

 ?>