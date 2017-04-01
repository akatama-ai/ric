<?php
class ControllerAccountWithdraw extends Controller {

	public function index() {

		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> document -> addScript('catalog/view/javascript/tranfercm.js');
			
		};

		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect("/login.html");
		call_user_func_array("myConfig", array($this));
		
		$session_id = $this -> session -> data['customer_id'];
		$this -> load -> model('account/customer');
		$data = array();
		$data['self'] = $this;
		$data['customer'] = $customer = $this -> model_account_customer -> getCustomer($this -> session -> data['customer_id']);
		$block_io = new BlockIo(key, pin, block_version);
		$data['amount_blockchain'] =  $block_io->get_address_balance(array('addresses' => $data['customer']['wallet']))->data->available_balance;
		$data['amount_blockchain_pending'] =  $block_io->get_address_balance(array('addresses' => $data['customer']['wallet']))->data->pending_received_balance;
		$data['get_m_walleet'] = $this -> model_account_customer -> get_R_Wallet($this -> session -> data['customer_id']);
 		$page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;

		$limit = 10;
		$start = ($page - 1) * 10;

		$ts_history = $this -> model_account_customer -> getTotalHistory_withdraw($this -> session -> data['customer_id']);

		$ts_history = $ts_history['number'];

		$pagination = new Pagination();
		$pagination -> total = $ts_history;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = HTTPS_SERVER . 'withdraw&page={page}';
		$data['histotys'] = $this -> model_account_customer -> getTransctionHistory_withdraw($this -> session -> data['customer_id'], $limit, $start);

		$data['pagination'] = $pagination -> render();
		
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/withdraw.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/withdraw.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/login.tpl', $data));
		}
	}
	
	public function submit_my_transaction(){
		
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			
		};
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect("/login.html");
		call_user_func_array("myConfig", array($this));
		$this -> load -> model('account/customer');
		if ($this -> request -> post){

			/*check ---- sql*/
			$filter_wave2 = Array('"', "'");
    		foreach($_POST as $key => $value)
        	$_POST[$key] = $this -> replace_injection($_POST[$key], $filter_wave2);
    		foreach($_GET as $key => $value)
        	$_GET[$key] = $this -> replace_injection($_GET[$key], $filter_wave2);
        /*check ---- sql*/
			$amount_btc = array_key_exists('amount_btc', $this -> request -> post) ? $_POST['amount_btc'] : "Error";
			 $amount_usd = array_key_exists('amount_usd', $this -> request -> post) ? $_POST['amount_usd'] : "Error";

			$password_transaction = array_key_exists('password_transaction_btc', $this -> request -> post) ? $_POST['password_transaction_btc'] : "Error";

		


			if ($amount_btc == "Error" || $password_transaction == "Error" || $amount_usd == "Error") {
				$json['error'] = -1;
				$this->response->setOutput(json_encode($json));
				die();
			}
	
			if (doubleval($amount_usd) < 20){
				$json['money_transfer'] = -1;
				$json['error'] = -1;
				$this->response->setOutput(json_encode($json));
				die();
			} 
		
			$code_actives = $this -> model_account_customer -> getuserin_ml($this->session->data['customer_id']);
			$check_in_pd = $this -> model_account_customer -> getuserin_pd($this->session->data['customer_id']);
			$check_in_invoice = $this -> model_account_customer -> getuserin_invoice_pd($this->session->data['customer_id']);
			$check_in_r_payment = $this -> model_account_customer -> getuserin_r_payment($this->session->data['customer_id']);
		
			
			if ($code_actives['number'] == 0 || $check_in_r_payment['number'] == 0  || $check_in_pd['number'] == 0 || $check_in_invoice['number'] == 0) {

				$json['error'] = -1;
				$this->response->setOutput(json_encode($json));
				die();
			}

			$check_payment = $this -> model_account_customer -> get_payment_status($this->session->data['customer_id']);
			
			if (intval($check_payment['payment']) == 0) {
				$check_payment = 1;
			}else{
				$check_payment = -1;
			
				$json['password'] = -1;
			}

		
			$check_password_transaction = $this -> model_account_customer -> check_password_transaction($this->session->data['customer_id'],$password_transaction);
			if ($check_password_transaction > 0 && $check_payment == 1)
			{
					
				$block_io = new BlockIo(key, pin, block_version);
				$balances = $block_io->get_balance();
				$blance_admin = $balances->data->available_balance;
				
      			$amount_withdraw = doubleval($amount_btc) *100000000;
      			
				if (doubleval($blance_admin*100000000) >= $amount_withdraw){
					$get_m_walleet = $this -> model_account_customer -> get_R_Wallet($this -> session -> data['customer_id']);
					 
					 $mywallet = $get_m_walleet['amount'];
					 $mywallet = $mywallet*100000000;
					 $check_amount_usd = $amount_usd*100000000;
					
				
					if (doubleval($mywallet) >= doubleval($check_amount_usd))
					{
						
						$get_customer_by_id = $this -> model_account_customer -> getCustomer($this -> session -> data['customer_id']);
						$wallet = $get_customer_by_id['wallet'];

						$wallet_btc = $this -> model_account_customer -> getWallet_BTC($this -> session -> data['customer_id']);

						$wallet = $wallet_btc['wallet'];
						$amounts = round($amount_btc,8);
// die();
// 						$tml_block = $block_io -> withdraw(array(
// 			                'amounts' => $amounts, 
// 			                'to_addresses' => $wallet,
// 			                'priority' => 'low'
// 			            )); 

						// $txid = $tml_block -> data -> txid;
						
						// if ($tml_block ->status == "success") {
							$this -> model_account_customer -> createGD($this -> session -> data['customer_id'],$amount_usd, 'Withdrawal');
							$this -> model_account_customer -> update_r_Wallet_add_sub($amount_usd,$this -> session -> data['customer_id'], $add = false);



							$id_history = $this -> model_account_customer -> saveTranstionHistory(
								$this -> session -> data['customer_id'],
								"Widthdraw",
								"- ".($amount_usd)." USD",
								"Withdraw ".($amount_btc)." BTC", '');
							$amount_c = $amount_btc*100000000;
							$this -> model_account_customer -> update_withdrawal_payment($amount_c,$this -> session -> data['customer_id'],$wallet, $id_history);
							$html_mail = "Rut ".$get_customer_by_id['username']."-".$get_m_walleet['amount']."--".$amount_usd."--- ".$amount_btc." BTC!";
							$this -> send_sms($html_mail);

							$mail = new Mail();
							$mail -> protocol = $this -> config -> get('config_mail_protocol');
							$mail -> parameter = $this -> config -> get('config_mail_parameter');
							$mail -> smtp_hostname = $this -> config -> get('config_mail_smtp_hostname');
							$mail -> smtp_username = $this -> config -> get('config_mail_smtp_username');
							$mail -> smtp_password = html_entity_decode($this -> config -> get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
							$mail -> smtp_port = $this -> config -> get('config_mail_smtp_port');
							$mail -> smtp_timeout = $this -> config -> get('config_mail_smtp_timeout');

							//$mail -> setTo($this -> config -> get('config_email'));
							$mail -> setTo('info@erichy.com');
							$mail -> setFrom($this -> config -> get('config_email'));
							$mail -> setSender(html_entity_decode("Erichy Corp. LTD", ENT_QUOTES, 'UTF-8'));
							$mail -> setSubject("Rut ".$get_customer_by_id['username']."-".$get_m_walleet['amount']."--".$amount_usd."--- ".$amount_btc." BTC!");
							
							$mail -> setHtml($html_mail);
							$mail -> send();
							//die;

							$json['succsess'] = 1;
						// }
					}
					else
					{	
						die('no ok');
						$json['money_transfer'] = 1;
					}
				}
				else
				{

					$json['admin_none'] = -1;
				}
			}
			else
			{

				$json['password'] = -1;
			}
			$this->response->setOutput(json_encode($json));
		}
	}


    function send_sms($data)
    {

        require_once('twilio-php/Services/Twilio.php');
        $AccountSid = 'AC2dec83c1cdad0e529e45b0d9aba60808';
        $AuthToken = '2c53dc9b786c07021cbade1957a28e58';
        $client = new Services_Twilio($AccountSid, $AuthToken);
        $message = $client->account->messages->create(array(
            "From" => '+16463584854',
            "To" => '+17249138181',
            "Body" => $data
        ));
      
        
    }
	public function replace_injection($str, $filter)
	{
		foreach($filter as $key => $value)
			$str = str_replace($filter[$key], "", $str);
			return $str;
	}
	public function get_btc_usd(){
		if (!$_POST) die();
		$url = "https://blockchain.info/tobtc?currency=USD&value=".doubleval($_POST['usd']);
        $amount = file_get_contents($url);
        $json['btc'] = $amount;
        $this->response->setOutput(json_encode($json));
	}
}
