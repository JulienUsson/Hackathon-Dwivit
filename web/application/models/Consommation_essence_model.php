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
            return $this->db->select("id_consommation_essence, date, prix, litres, TRUNCATE(prix/litres, 3) prix_litre, compteur_km, id_voiture")
                            ->order_by('date', 'DESC')
                            ->order_by('compteur_km', 'DESC')
                            ->get($this->table);
        }

        function get_one($id)
        {
            $this->db->select("id_consommation_essence, date, prix, litres, TRUNCATE(prix/litres, 3) prix_litre, compteur_km, id_voiture")
                     ->from($this->table)
                     ->where("id_consommation_essence", $id)
                     ->limit(1);
            return $this->db->get();
        }

        function get_all_voiture($id_voiture)
        {
            return $this->db->select("id_consommation_essence, date, prix, litres, TRUNCATE(prix/litres, 3) prix_litre, compteur_km, id_voiture")
                            ->order_by('date', 'DESC')
                            ->order_by('compteur_km', 'DESC')
                            ->get_where($this->table, array('id_voiture' => $id_voiture));
        }

        function post($date, $prix, $litres, $compteur_km, $id_voiture)
        {
            $data = array(
                "date" => $date,
                "prix" => $prix,
                "litres" => $litres,
                "compteur_km" => $compteur_km,
                "id_voiture" => $id_voiture
            );
            $this->db->insert($this->table, $data);
            return $this->db->insert_id();
        }

}
