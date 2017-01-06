<?php
    $link = mysql_connect('localhost', 'root', '');
    if (!$link) {
        die('Connect is failed ' . mysql_error());
    }
    echo 'Connect succes';
    mysql_select_db('MyBase');
    $result = mysql_query('SELECT * FROM users');
    $row = mysql_fetch_row($result);
    print_r($row);
    mysql_close($link);
?>