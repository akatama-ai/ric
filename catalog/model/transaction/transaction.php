<?php
class ModelTransactionTransaction extends Model {
	
	public function get_all_transferlist_by_id(){

	}
	public function get_all_transferlist_by_id_sell($customer_id){
		$query = $this -> db -> query("
			SELECT * 
			FROM ".DB_PREFIX."customer_transfer_list
			WHERE pd_id_customer = ".$customer_id."  ORDER BY id DESC
		");
		return $query -> rows;
	}
	public function get_all_transferlist_by_id_buy($customer_id){
		$query = $this -> db -> query("
			SELECT * 
			FROM ".DB_PREFIX."customer_transfer_list
			WHERE gd_id_customer = ".$customer_id." ORDER BY id DESC
		");
		return $query -> rows;
	}
	public function getUsername($customer_id){
		$query = $this->db->query("SELECT username
			FROM " . DB_PREFIX . "customer WHERE customer_id = ".$customer_id."");
		return $query -> row['username'];
	}
}