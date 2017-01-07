<?php
    
    interface ICollection
    {
        public function Add($element);
        public function Clear();
    }

    class MyList implements ICollection
    {
        private $list = array();
        public function Add($element) {
            $this->list[] = $element;
        }
        public function Clear() {
            $this->list = array();
        }
        public function Show() {
            print_r($this->list);
            echo '</br>';
        }               
    }

    $myList = new MyList();
    for ($i=0; $i<10; $i++) {
        $myList->Add($i);
    };
    $myList->Show();
    $myList->Clear();
    $myList->Show();
 ?>