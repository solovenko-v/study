<?php

class Controller_Portfolio extends Controller
{

	function __construct()
	{
		$this->model = new Model_Portfolio();
		$this->view = new View();
	}
	
	function action_index($page = null)
	{
		$count_of_sites = $this->model->get_count_of_sites();
		$data = $this->model->get_data(($page - 1) * 10);
		$maxpage = ceil($count_of_sites / 10); 
		echo $count_of_sites;		
		$this->view->generate('portfolio_view.php', 'template_view.php', $data, $page, $maxpage);
	}
}
