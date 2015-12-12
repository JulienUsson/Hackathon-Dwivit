<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reparation_model extends CI_Model {

        public function __construct()
        {
                parent::__construct();
                $this->table = "reparation";
        }

        function get_all()
        {
            return $this->db->order_by('date', 'DESC')
                            ->get($this->table);
        }

        function get_one($id)
        {
            $this->db->select("id_reparation, date, commentaire, id_type_reparation, id_voiture")
                     ->from($this->table)
                     ->where("id_reparation", $id)
                     ->limit(1);
            return $this->db->get();
        }

        function get_all_voiture($id_voiture)
        {
            return $this->db->order_by('date', 'DESC')
                            ->get_where($this->table, array('id_voiture' => $id_voiture));
        }
}
