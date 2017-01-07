<?php
    global $html;

    $tpl = new Template;
	$tpl->setTpl('view/authorization.php');
	$tpl->setVars(array('header' => 'Форма авторизации (новая)', 'footer' => 'Copyright ООО "Криворучки"'));
	$html = $tpl->render();

?>
