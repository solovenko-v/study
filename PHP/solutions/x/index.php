<?php

    // master changes
    // 
    session_start();

    // routes
    if (isset($_POST['exit'])) { 
        session_destroy();
        showForm();
    } elseif (isset($_GET['toreg'])) {
        echo "showRegForm"; 
        showRegForm();  
    } elseif (isset($_POST['reg']) && isset($_POST['user']) && isset($_POST['pass'])) {
        createUser($_POST['user'], $_POST['pass']);    
    } else {
        if (isAuth()) {
            Hi();
        } else {
            if (formCheck()) {
                Hi();
            } else {
                showForm();
            }
        }        
    }

    function isAuth() {
        if (isset($_SESSION['user'])) {
            return true;
        } else {
            return false;
        }
    }

    function formCheck() { 
        $trueData = false;
        if (isset($_POST['user']) && isset($_POST['pass'])) {
            $db_user = getUserData($_POST['user']);
            if ($db_user != 0) {
                if ($_POST['pass'] == $db_user[2]) {
                    $_SESSION['user']=$_POST['user'];
                    // echo 'form is checked';
                    $trueData = true;
                } else {
                    print_r($db_user.password);
                    echo ''.$db_user.password.' '.$_POST['pass'];
                }
            } 
        }
        return $trueData;
    }
    function showForm() {
        $html = '<!DOCTYPE HTML>
        <html>
        <head>
        <meta charset="utf-8">
        <title>Authorization</title>
        </head>
        <body>

        <form name="test" method="post" action="">
        <p><b>Name:</b><br>
        <input type="text" name="user" size="40">
        </p>
            <p><b>Password:</b><br>
        <input type="password" name="pass" size="40">
        </p>
        <p><input type="submit" value="Login">
        <input type="reset" value="Reset">
        <a href = "/index.php?toreg=true"><input type="button" name="toReg" value="Regisration"></a></p>
        </form>
         </body>
        </html>';
        echo $html;
    }
    function showRegForm() {
        $html = '<!DOCTYPE HTML>
        <html>
        <head>
        <meta charset="utf-8">
        <title>Registration</title>
        </head>
        <body>

        <form name="test" method="post" action="">
        <p><b>Name:</b><br>
        <input type="text" name="user" size="40">
        </p>
            <p><b>Password:</b><br>
        <input type="password" name="pass" size="40">
        </p>
        <p><input type="submit" name="reg" value="Registration">
        <input type="reset" value="Reset"></p>
        </form>
         </body>
        </html>';
        echo $html;
    }
    function Hi() {
        echo 'Hello '.$_SESSION['user'].' <form name="logout" method="post" action=""><p><input type="submit" name ="exit" value="Logout"></p></form>';    
    }
    function getUserData($login) {
        $link = connectToMyDB('getUserData');
        $query = "SELECT * FROM users WHERE login = '$login'";
        $result = mysql_query($query);
        $row = 0;
        if (mysql_num_rows($result) > 0) {
            $row = mysql_fetch_row($result);
            print_r($row);
        }
        echo $query;
        mysql_close($link);
        return $row;
    }
    function createUser($login, $password) {
        $link = connectToMyDB('createUser');
        $query = 'SELECT * FROM users WHERE login = "$login"';
        $result = mysql_query($query);
        if (mysql_num_rows($result) > 0) {
            return false;
        } else {
            // $query = 'INSERT  * FROM users WHERE login = "$login"';
            // $result = mysql_query($query);
            // return true;
        }
        mysql_close($link);
    }
    function connectToMyDB($eventName) {
        $link = mysql_connect('localhost', 'root', '');
        if (!$link) {
            die("'$eventName': Connect is failed" . mysql_error());
        }
        echo "'$eventName': Connect succes";
        echo '<br/>';
        mysql_select_db('MyBase');
        return $link;
    }

 ?>