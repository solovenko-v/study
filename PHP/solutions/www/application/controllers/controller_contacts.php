<?php

class Controller_Contacts extends Controller
{
	
	function action_index($page = null)
	{
		$this->view->generate('contacts_view.php', 'template_view.php');
	}
}
