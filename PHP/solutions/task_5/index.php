<?php

    if (isset($_POST['Name']))
    { 
        writeToDB($_POST['Name']);        
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
                        <input type="submit" value="Submit">
                    </p>
                </form>
            </body>
        </html>';
        echo $html;
    }

    function writeToDB($Name) 
    {
        try {			
            $user = "root";				
            $pass = ''; // for lamp "VRKIooNEK";
            $dbname = 'mybase'; // for lamp 'solovenko'				
            $pdo = new PDO('mysql:host=localhost;dbname='.$dbname, $user, $pass);
            $pdo->query('INSERT INTO persons (Name) VALUES ("'.$Name.'")');
            echo 'person '.$Name.' was added';		
        }
        catch (PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";				
            die();			
        }	        
    }
 ?>