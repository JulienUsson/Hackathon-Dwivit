<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Type_reparation_model extends CI_Model {

        public function __construct()
        {
                parent::__construct();
                $this->table = "type_reparation";
        }

        function get_all()
        {
            return $this->db->get($this->table);
        }

        function get_one($id)
        {
            $this->db->select("id_type_reparation, nom")
                     ->from($this->table)
                     ->where("id_type_reparation", $id)
                     ->limit(1);
            return $this->db->get();
        }
}
