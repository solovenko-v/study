<?php
class Template {
    private $tpl; // name of templste
    private $var; // vars array 

    public function setTpl($tpl_name) { // set template name
        $this->tpl = $tpl_name;
    }
    public function setVars($tpl_var) { // set vars
        $this->var = $tpl_var;
    }
    public function render() { // fill the template by vars
        extract($this->var);
        ob_start();
        include $this->tpl;
        return ob_get_clean();
    }
}
?>