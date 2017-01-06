<?php

    if (isset($_POST['Name']) && isset($_POST['Surname']))
    { 
        writeToDB($_POST['Name'], $_POST['Surname']);        
    }

    showForm();

    function showForm() 
    {
        $html = '<!DOCTYPE HTML>
        <html>
            <head>
                <meta charset="utf-8">
                <title>Person adding</title>
            </head>

            <body>
                <form name="test" method="post" action="">
                    <p>
                        <b>Name:</b><br>
                        <input type="text" name="Name" size="40">
                    </p>
                    <p>
                        <b>Password:</b><br>
                        <input type="text" name="Surname" size="40">
                    </p>
                    <p>
                        <input type="submit" value="Add person">
                    </p>
                </form>
            </body>
        </html>';
        echo $html;
    }

    function writeToDB($Name, $Surname) 
    {
        try {			
            $user = "root";				
            $pass = ''; // for lamp "VRKIooNEK";
            $dbname = 'mybase'; // for lamp 'solovenko'				
            $pdo = new PDO('mysql:host=localhost;dbname='.$dbname, $user, $pass);
            $pdo->query('INSERT INTO persons (Name, Surname) VALUES ("'.$Name.'", "'.$Surname.'")');
            echo 'person '.$Name.' '.$Surname.' was added';		
        }
        catch (PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";				
            die();			
        }	        
    }
 ?>