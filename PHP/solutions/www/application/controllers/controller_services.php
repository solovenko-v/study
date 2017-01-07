<?php

class Controller_Services extends Controller
{

	function action_index($page = null)
	{
		$this->view->generate('services_view.php', 'template_view.php');
	}
}
