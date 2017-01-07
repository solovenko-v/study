<?php
    
    $arr = array();
    for ($i=1; $i<=100; $i++) {
       $arr[$i] = $i;
    }

    function odd($var)
    {
        return($var & 1);
    }

    function even($var)
    {
        return(!($var & 1));
    }

    $even_arr = array_filter($arr, "even");

    foreach ($even_arr as $k => $value) {
       echo $even_arr[$value];
       echo '</br>';
    }

 ?>