<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class App extends CI_Controller {

	public function index()
	{
		$this->load->view('angular');
	}

	public function recapitulatif($id_voiture)
	{
		$this->load->database();
		$this->load->model("Reparation_model", "reparation");
		$this->load->model("Type_reparation_model", "tr");
		$this->load->model("Voiture_model", "voiture");
		$this->load->model("Modele_voiture_model", "modele");
		$this->load->model("Marque_model", "marque");
		$this->load->model("User_model", "user");
		$this->load->model("Contrat_model", "contrat");

		$voiture = $this->voiture->get_one($id_voiture)->result_array()[0];
		$voiture["marque"] = $this->marque->get_one($voiture["id_contrat"])->result_array()[0]["nom"];
		$voiture["modele"] = $this->modele->get_one($voiture["id_contrat"])->result_array()[0]["nom"]	;
		$voiture["contrat"] = $this->contrat->get_one($voiture["id_contrat"])->result_array()[0];

 		$user=$this->user->get_one($voiture["id_user"])->result_array()[0];

		$reparations=array();
		foreach($this->reparation->get_all_voiture($id_voiture)->result_array() as $result) {
			$type_reparation=$this->tr->get_one($result["id_type_reparation"])->result_array()[0]['nom'];
			$result["type_reparation"]=$type_reparation;
			$reparations[]=$result;
		}

		$this->load->view('recapitulatif', array('voiture' => $voiture, 'user' => $user, 'reparations' => $reparations));
	}
}
