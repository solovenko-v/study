<?php

    try {			
        $user = "root";				
        $pass = ''; // for lamp "VRKIooNEK";
        $dbname = 'mybase'; // for lamp 'solovenko'				
        $pdo = new PDO('mysql:host=localhost;dbname='.$dbname, $user, $pass);
        $sql = 'SELECT * FROM persons ORDER BY ID LIMIT 1';
        // foreach ($pdo->query($sql) as $row) {
        //     print_r($row);
        // }
        $stmt = $pdo->query($sql);
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        while($row = $stmt->fetch())
        {
             print_r($row);
        }	
    }
    catch (PDOException $e) {
        print "Error!: " . $e->getMessage() . "<br/>";				
        die();			
    }	
 ?>