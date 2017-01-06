<?php

echo '<head>

        <title>TABLE</title>
        <style>
        table { 
            border-color: black; 
            border-style: solid;  
        }
        </style>
    </head>';

$ttitle = '<table border="5" border-color="black">
   <caption>GET-парамеры</caption>
   <tr>
    <th>Параметр</th>
    <th>Значение</th>
   </tr>';

$tbody = '';
foreach ($_GET as $key => $value)
{
    $tbody = $tbody.'<tr><td>'.$key.'</td><td>'.$value.'</td></tr>';   
}

$tfooter = '</table>';

echo $ttitle.$tbody.$tfooter;