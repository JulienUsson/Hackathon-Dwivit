<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reparation extends CI_Controller {

	public function __construct()
	{
					parent::__construct();
					$this->load->database();
					$this->load->model("Reparation_model", "reparation");
					$this->load->model("Type_reparation_model", "tr");
	}

  public function index()
  {
      $data = $this->reparation->get_all();
      echo json_encode($data->result_array());
  }

  public function view($id)
  {
		$data = $this->reparation->get_one($id);

		if ($data->num_rows() > 0) {
				echo json_encode($data->result_array()[0]);
		} else {
				header("HTTP/1.0 404 Not Found");
				echo json_encode("404 : Product #$id not found");
		}
  }

		public function view_all_voiture($id_voiture)
		{
			$data = $this->reparation->get_all_voiture($id_voiture);
			$response=array();
			foreach($data->result_array() as $result) {
				$type_reparation=$this->tr->get_one($result["id_type_reparation"])->result_array()[0]['nom'];
				$result["type_reparation"]=$type_reparation;
				$response[]=$result;
			}
			echo json_encode($response);
		}

		public function stats_reparation($id_voiture)
		{
			$data = $this->reparation->get_stats_reparation($id_voiture);
			echo json_encode($data->result_array());
		}
}
