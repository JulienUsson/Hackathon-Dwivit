<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Contrat_model extends CI_Model {

        public function __construct()
        {
                parent::__construct();
                $this->table = "contrat";
        }

        function get_all()
        {
            return $this->db->get($this->table);
        }

        function get_one($id)
        {
            $this->db->select("id_contrat, categorie, km, prix, diesel")
                     ->from($this->table)
                     ->where("id_contrat", $id)
                     ->limit(1);
            return $this->db->get();
        }
}
