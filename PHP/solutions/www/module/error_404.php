<?php
    global $html;

    $tpl = new Template;
	$tpl->setTpl('view/error_404.php');
	$tpl->setVars(array());
	$html = $tpl->render();

?>