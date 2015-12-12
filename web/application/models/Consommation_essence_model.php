<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Consommation_essence_model extends CI_Model {

        public function __construct()
        {
                parent::__construct();
                $this->table = "consommation_essence";
        }

        function get_all()
        {
            return $this->db->order_by('date', 'DESC')
                            ->get($this->table);
        }

        function get_one($id)
        {
            $this->db->select("id_consommation_essence, date, prix, litres, id_voiture")
                     ->from($this->table)
                     ->where("id_consommation_essence", $id)
                     ->limit(1);
            return $this->db->get();
        }

        function get_all_voiture($id_voiture)
        {
            return $this->db->order_by('date', 'DESC')
                            ->get_where($this->table, array('id_voiture' => $id_voiture));
        }
}
