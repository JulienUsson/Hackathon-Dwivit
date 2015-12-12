<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Consommation_essence extends CI_Controller {

	public function __construct()
	{
					parent::__construct();
					$this->load->database();
					$this->load->model("Consommation_essence_model", "conso");
	}


  public function index()
  {
      $data = $this->conso->get_all();
      echo json_encode($data->result_array());
  }

  public function view($id)
  {
		$data = $this->conso->get_one($id);

		if ($data->num_rows() > 0) {
				echo json_encode($data->result_array()[0]);
		} else {
				header("HTTP/1.0 404 Not Found");
				echo json_encode("404 : Product #$id not found");
		}
  }

	public function view_all_voiture($id_voiture)
	{
		$data = $this->conso->get_all_voiture($id_voiture);
		echo json_encode($data->result_array());
	}

	public function create()
	{
			$post = json_decode(file_get_contents("php://input"));
			$id=$this->conso->post($post->date, $post->prix, $post->litres, $post->id_voiture);
			$this->view($id);
	}
}
