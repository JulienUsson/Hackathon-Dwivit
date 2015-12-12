<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Marque_model extends CI_Model {

        public function __construct()
        {
                parent::__construct();
                $this->table = "marque";
        }

        function get_all()
        {
            return $this->db->order_by('nom', 'ASC')
                            ->get($this->table);
        }

        function get_one($id)
        {
            $this->db->select("id_marque, nom")
                     ->from($this->table)
                     ->where("id_marque", $id)
                     ->limit(1);
            return $this->db->get();
        }
}
