<?php

class Connect
{
	
	private $connect;	
	private static $_instance = null;
	
	private function __construct() {
		
			try {			
				$user = "root";				
				$pass = "VRKIooNEK";				
				$this->connect = new PDO('mysql:host=localhost;dbname=solovenko', $user, $pass);			
			}
			catch (PDOException $e) {
				print "Error!: " . $e->getMessage() . "<br/>";				
				die();			
			}		
		
	}
		
	private function __clone() {			
		
	}
	
	static public function getInstance() {
			
		if(is_null(self::$_instance))
		{
						
			self::$_instance = new self();			
			
		}
				
		return self::$_instance;
				
	}

	public function get() {
		return $this->connect;
	}
		
}

