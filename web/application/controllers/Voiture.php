<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Voiture extends CI_Controller {

	public function __construct()
	{
					parent::__construct();
					$this->load->database();
					$this->load->model("Voiture_model", "voiture");
					$this->load->model("Modele_voiture_model", "modele");
					$this->load->model("Marque_model", "marque");
					$this->load->model("Contrat_model", "contrat");
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
				$voiture = $data->result_array()[0];
				$voiture["contrat"] = $this->contrat->get_one($voiture["id_contrat"])->result_array()[0];
				$voiture["marque"] = $this->marque->get_one($voiture["id_contrat"])->result_array()[0]["nom"];
				$voiture["modele"] = $this->modele->get_one($voiture["id_contrat"])->result_array()[0]["nom"]	;
				echo json_encode($voiture);
		} else {
				header("HTTP/1.0 404 Not Found");
				echo json_encode("404 : Product #$id not found");
		}
  }
}
