<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Voiture extends CI_Controller {

	public function __construct()
	{
					parent::__construct();
					$this->load->database();
					$this->load->model("Voiture_model", "voiture");
	}

  public function index()
  {
      $data = $this->voiture->get_all();
      echo json_encode($data->result_array());
  }

  public function view($id)
  {
		$data = $this->voiture->get_one($id);

		if ($data->num_rows() > 0) {
				echo json_encode($data->result_array()[0]);
		} else {
				header("HTTP/1.0 404 Not Found");
				echo json_encode("404 : Product #$id not found");
		}
  }
}
