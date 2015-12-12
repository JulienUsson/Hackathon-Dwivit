<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Voiture_model extends CI_Model {

        public function __construct()
        {
                parent::__construct();
                $this->table = "voiture";
        }

        function get_all()
        {
            return $this->db->get($this->table);
        }

        function get_one($id)
        {
            $this->db->select("id_voiture, immatriculation, id_user, id_modele_voiture, id_contrat")
                     ->from($this->table)
                     ->where("id_voiture", $id)
                     ->limit(1);

            return $this->db->get();
        }
}
