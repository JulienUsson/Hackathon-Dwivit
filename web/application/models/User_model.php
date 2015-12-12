<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_model extends CI_Model {

        public function __construct()
        {
                parent::__construct();
                $this->table = "user";
        }

        function get_all()
        {
            return $this->db->get($this->table);
        }

        function get_one($id)
        {
            $this->db->select("id_user, nom, prenom, email, adresse, code_postal, ville")
                     ->from($this->table)
                     ->where("id_user", $id)
                     ->limit(1);
            return $this->db->get();
        }
}
