<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Modele_voiture extends CI_Controller {

	public function __construct()
	{
					parent::__construct();
					$this->load->database();
					$this->load->model("Modele_voiture_model", "modele");
	}


  public function index()
  {
      $data = $this->modele->get_all();
      echo json_encode($data->result_array());
  }

  public function view($id)
  {
		$data = $this->modele->get_one($id);

		if ($data->num_rows() > 0) {
				echo json_encode($data->result_array()[0]);
		} else {
				header("HTTP/1.0 404 Not Found");
				echo json_encode("404 : Product #$id not found");
		}
  }

	public function view_all_marque($id_marque)
	{
		$data = $this->modele->get_all_marque($id_marque);
		echo json_encode($data->result_array());
	}
}
