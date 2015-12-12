<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Modele_voiture_model extends CI_Model {

        public function __construct()
        {
                parent::__construct();
                $this->table = "modele_voiture";
        }

        function get_all()
        {
            return $this->db->order_by('nom', 'ASC')
                            ->get($this->table);
        }

        function get_one($id)
        {
            $this->db->select("id_modele_voiture, nom, id_marque")
                     ->from($this->table)
                     ->where("id_modele_voiture", $id)
                     ->limit(1);
            return $this->db->get();
        }
}
