<?php
global $html;

$tpl = new Template;
$tpl->setTpl('view/registration.php');
$tpl->setVars(array('header' => 'Форма регистрации (новая)', 'footer' => 'Copyright ООО "Криворучки"'));
$html = $tpl->render();

?>