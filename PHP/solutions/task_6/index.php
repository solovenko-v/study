<?php
    
    class A
    {
        private $is_alive = false;
        public function Set() {
            $this->is_alive = true; 
            echo 'A is alive';
            echo '</br>';
            echo $this->is_alive;
            echo '</br>';
        }
        public function Unset() {
            $this->is_alive = false;
            echo 'A is not alive';
            echo '</br>';
            echo $this->is_alive;
            echo '</br>';
        }
    }

    class B extends A
    {
        public function Set() {
            $this->is_alive = true; 
            echo 'B is alive';
            echo '</br>';
            echo $this->is_alive;
            echo '</br>';
        }
    }

    $a = new A;
    $a->Set();
    $a->Unset();

    $b = new B;
    $b->Set();
    $b->Unset();    
 ?>