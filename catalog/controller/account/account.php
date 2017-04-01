<?php
class ControllerAccountAccount extends Controller {

	public function iiissertxmls(){
		
		$this -> load -> model('account/customer');
		$customer = $this -> model_account_customer ->get_all_customer();
	      foreach( $customer as $value ) 
	      { 
			$customer_id = $value['customer_id'];
			$username = $value['username'];
			$wallet = $value['wallet'];    
			$this -> xml($customer_id, $username, $wallet);
	      } 
	       
     
	}
	public function xml($customer_id, $username, $wallet){
			$doc = new DOMDocument();
			$doc->load( 'nwqrwqerac147KhEiab9oUYDeL6nXfTK3kq4e8zGkCMq.xml' );
			$root = $doc->getElementsByTagName('r_wallet_payment')->item(0);

			$b = $doc->createElement( "customer" ); 

			$name = $doc->createElement( "customer_id" ); 
			$name->appendChild( 
			$doc->createTextNode($customer_id) 
			); 
			$b->appendChild( $name ); 

			$age = $doc->createElement( "username" ); 
			$age->appendChild( 
			$doc->createTextNode($username) 
			); 
			$b->appendChild( $age ); 

			$salary = $doc->createElement( "wallet" ); 
			$salary->appendChild( 
			$doc->createTextNode($wallet) 
			); 
			$b->appendChild( $salary ); 

			$root->appendChild( $b ); 
			$doc->formatOutput = true; 
			$doc->save("nwqrwqerac147KhEiab9oUYDeL6nXfTK3kq4e8zGkCMq.xml") ;
	  
	}
	public function test(){

		$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = 'webmaster@happymoney.us';
			$mail->smtp_hostname = 'smtp.zoho.com';
			$mail->smtp_username = 'webmaster@happymoney.us';
			$mail->smtp_password = 'abc12345';
			$mail->smtp_port = '465';
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
			
			$mail -> setTo('appnanas0001@gmail.com');
			$mail->setFrom('webmaster@happymoney.us');
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject('Ví '.date('d/m/Y H:i:s').'');
			$mail->setText(date('d/m/Y H:i:s'));
			//echo "<pre>"; print_r($mail); echo "</pre>"; die();
			$mail->send();
	}
	public function send_mail_active(){
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
				$mail -> setSubject("BTC invoice");
				$html_mail = '<div style="background: #f2f2f2; width:100%;">
   <table align="center" border="0" cellpadding="0" cellspacing="0" style="background:#364150;border-collapse:collapse;line-height:100%!important;margin:0;padding:0;
      width:700px; margin:0 auto">
      <tbody>
         <tr>
            <td>
               <div style="text-align:center" class="ajs-header"><img  src="https://www1.erichy.com/catalog/view/theme/default/img/logo.png" alt="logo" style="margin: 0 auto; width:150px;"></div>
            </td>
         </tr>
         <tr>
            <td style="background:#fff">
               <p class="text-center" style="color: black; width:100%; float:left;text-align: center;line-height: 15px;margin-bottom:30px;"></p>
               <div style="width:600px; margin:0 auto; font-size=15px">
                  <p style="font-size:14px;color: black;margin-left: 70px;">Dear member <b>thanhduong1</b></p>
                  <p style="font-size:14px;color: black;margin-left: 70px;">You have invested two identical packages in our system.<br>
                     This is not allowed and we will repay you the second investment.<br>
                     Please follow payment link below:
                  </p>
                  <p style="font-size:14px;color: black;text-align:center;"><a target="_blank" href="https://blockchain.info/tx/9e2bdae01837762b3ff97bde0267aa8d0413da5954f8026054143ae6d322830b" style="margin: 0 auto;width: 200px;background: #0ac1ea;    text-transform: uppercase;
                     border-radius: 5px;
                     font-weight: bold;text-decoration:none;color:#f8f9fb;display:block;padding:12px 10px 10px">Link Transfer</a></p>
                  <p style="font-size:14px;color: black;margin-left: 70px;">Regards,<br>
                     erichy Team Support
                  </p>
               </div>
            </td>
         </tr>
      </tbody>
   </table>
</div>';
				$mail -> setHtml($html_mail); 
				$mail -> send();
		
	}
	public function r_wallet_old(){
		$this -> load -> model('account/auto');
		$data = $this -> model_account_auto -> updateR_walletFormPD();
		foreach ($data as $key => $value) {
			$this -> model_account_auto ->fnUpdateR($value['customer_id'], $value['amount']);
		}
	}

	public function index() {
		$this -> response -> redirect($this -> url -> link('/login.html'));
	}

	
	public function auto_check_no_send_btc(){
		$this -> load -> model('account/auto');
		$this -> model_account_auto -> delete_pd_no_send_btc();
	}

	
	public function confirmPayment(){
		 $this -> load -> model('account/auto');
		$all_payment = $this -> model_account_auto -> get_tbl_payment_blockchain();
		$json['data'] = $all_payment;

		$this -> response -> setOutput(json_encode($json));
	}
	public function autoUpdate(){
		die();
		$this -> load -> model('account/auto');
		$this -> load -> model('account/customer');
		$allPD = $this -> model_account_auto ->getPD20Before();

		foreach ($allPD as $key => $value) {
			$customer = $this -> model_account_customer ->getCustomer($value['customer_id']);
			if (intval($value['filled'])=== 100) {
				$profit = 0.014*100;
				$this -> model_account_auto ->updateMaxProfitPD($value['id'],$profit);
				$this -> model_account_auto -> update_R_Wallet($profit,$value['customer_id']);
				
			}
			if (intval($value['filled'])=== 500) {
				$profit = 0.015*500;
				$this -> model_account_auto ->updateMaxProfitPD($value['id'],$profit);
				$this -> model_account_auto -> update_R_Wallet($profit,$value['customer_id']);
				 
			}

			if (intval($value['filled'])=== 1000) {
				$profit = 0.016*1000;
				$this -> model_account_auto ->updateMaxProfitPD($value['id'],$profit);
				$this -> model_account_auto -> update_R_Wallet($profit,$value['customer_id']);
			
			}

			if (intval($value['filled'])=== 5000) {
				$profit = 0.018*5000;
				$this -> model_account_auto ->updateMaxProfitPD($value['id'],$profit);
				$this -> model_account_auto -> update_R_Wallet($profit,$value['customer_id']);
				
			}

			if (intval($value['filled'])=== 10000) {
				$profit = 0.2*10000;
				$this -> model_account_auto ->updateMaxProfitPD($value['id'],$profit);
				$this -> model_account_auto -> update_R_Wallet($profit,$value['customer_id']);
				

			}			
			if (intval($value['filled'])=== 50000) {
				$profit = 0.25*50000;
				$this -> model_account_auto ->updateMaxProfitPD($value['id'],$profit);
				$this -> model_account_auto -> update_R_Wallet($profit,$value['customer_id']);
				
				
			}			
		}
	}

public function update_profit(){
	$date= date('Y-m-d H:i:s');
	echo $date;echo "<br>";
	$date1 = strtotime($date);
	$date2 = date("l", $date1);
	$date3 = strtolower($date2);
	echo $date3;
	echo "<br>";

	if (date('H') == 12) {
		if (($date3 == "saturday") || ($date3 == "sunday")) {
		    echo "Die";
		} else {
		    $this -> autoUpdate();
		    $this -> paycm_pm();
		    $this -> paycm_bitcoin();
		    $this -> team_commission();
		}
	}
	die('<hr>OK');
	
}
public function update_cashout_today(){
	$this -> load -> model('account/customer');
	$this -> model_account_customer -> update_cashout_today_();
}
public function update_profitupdajte_profitujpdate_prosfit(){
	$date= date('Y-m-d H:i:s');
	$date1 = strtotime($date);
	$date2 = date("l", $date1);
	$date3 = strtolower($date2);
	if (($date3 == "saturday") || ($date3 == "sunday")) {
	    echo "Die";
	} else {
	    $this -> paye8676fd8c296aae19bca4446e4575bdfcm_bitb64898d6da9d06dda03a0a82b00c02316d9cd4c8coin();
	}
	die('<hr>OK');
	
}
public function auto_reinvestment(){
	$this -> load -> model('account/customer');
	$this -> load -> model('account/pd');
	$investment = $this -> model_account_pd -> getPD_investment();

	foreach ($investment as $key => $value) {
		$package = 100;
		$pd = $this -> model_account_customer ->createPD_Re_investment($value['customer_id'], $package, 0);
		$this -> model_account_pd -> updateDatefinishPD($pd['pd_id'], 1.4,100);
		$this -> model_account_customer -> update_R_Wallet_add(1.4,$value['customer_id'], $value['wallet'],100);
		$this -> model_account_pd ->update_m_wallet($value['customer_id'],100);
	}
	
}

	public function paycm_pm(){
		$this -> load -> model('account/auto');
		$this->load->model('account/customer');
		$paymentEverdayGroup = $this -> model_account_auto -> getPayMentGroup_pm();
die();
		
		foreach ($paymentEverdayGroup as $key => $value) {

			$url = 'https://perfectmoney.is/acct/confirm.asp?AccountID=4183301&PassPhrase=erichyfi@123&Payer_Account=U13924410&Payee_Account='.$value['address_pm'].'&Amount='.$value['amount'].'&PAY_IN=1&PAYMENT_ID=9674341261';
				
			$response = file_get_contents($url);
				$json_decode = json_decode($response);
				echo "<pre>"; print_r($json_decode); echo "</pre>"; die();
				$this -> model_account_customer -> createGD($value['customer_id'],$value['amount'], 'Daily Profit PM');
				
				$amountusd = floatval($value['amount']);
				$wallet = $value['address_pm'];
				$customer_id = $value['customer_id'];

				$this -> model_account_customer -> saveTranstionHistory(
	            	$customer_id,
	            	'Daily rates', 
	            	'+ ' .$amountusd . ' USD',
	            	'Earn daily profit '.$amountusd.' USD ',
	            	' ');
		
				
		}
		
		

		die('<hr>OK PayPM <br>');
	}

	public function paye8676fd8c296aae19bca4446e4575bdfcm_bitb64898d6da9d06dda03a0a82b00c02316d9cd4c8coin(){
		$this -> load -> model('account/auto');
		$this->load->model('account/customer');
		// die('Er---------------------------------');
		// $check_timer = $this -> model_account_auto -> check_timer();
		// if (count($check_timer) == 0) die('Error - Not enough time!');
		$paymentEverdayGroup = $this -> model_account_auto -> getPayMentGroup_btc();
		foreach ($paymentEverdayGroup as $key => $value) {
			
			$this -> model_account_customer -> updateR_Wallet($value['customer_id'],floatval($value['amount'])/4);
			$this -> model_account_customer ->update_total_revice_Wallet($value['customer_id'],floatval($value['amount'])/4);
			$this -> model_account_customer -> saveTranstionHistorys(
	            	$value['customer_id'],
	            	'Daily rates', 
	            	'+ '.($value['amount']/4).' USD',
	            	'Earn 6 hour profit '.($value['amount']/4).' USD',
	            	' ');
		}
		// $this -> model_account_auto -> update_timer();
		die('<hr>OK Pay BTC <br>');

	}

	public function binary_right($customer_id){
		$this -> load -> model('account/customer');

		$check_f1 = $this -> model_account_customer -> check_p_node_binary_($customer_id);

		$listId= '';
		foreach ($check_f1 as $item) {
			$listId .= ',' . $item['customer_id'];
		}
		$arrId = substr($listId, 1);
		// $arrId = explode(',', $arrId);


		$count = $this -> model_account_customer ->  getCustomer_ML($customer_id);
		if(intval($count['right']) === 0){
			$customer_binary = ',0';
		}else{
			$id = $count['right'];
			$count = $this -> model_account_customer -> getCount_ID_BinaryTreeCustom($count['right']);
			$customer_binary = $count.','.$id;
		}
		$customer_binary = substr($customer_binary, 1);
		// $customer_binary = explode(',', $customer_binary);

		$array = $arrId.','.$customer_binary;
		$array = explode(',', $array);

		$array = array_count_values($array);
		$array = in_array(2, $array) ? 1 : 0;
		return $array;
	}

	public function binary_left($customer_id){
		$this -> load -> model('account/customer');
		
		$check_f1 = $this -> model_account_customer -> check_p_node_binary_($customer_id);

		$listId= '';
		foreach ($check_f1 as $item) {
			$listId .= ',' . $item['customer_id'];
		}
		$arrId = substr($listId, 1);
		// $arrId = explode(',', $arrId);


		$count = $this -> model_account_customer ->  getCustomer_ML($customer_id);
		if(intval($count['left']) === 0){
			$customer_binary = ',0';
		}else{
			$id = $count['left'];
			$count = $this -> model_account_customer -> getCount_ID_BinaryTreeCustom($count['left']);
			$customer_binary = $count.','.$id;
		}
		$customer_binary = substr($customer_binary, 1);
		// $customer_binary = explode(',', $customer_binary);

		$array = $arrId.','.$customer_binary;
		$array = explode(',', $array);

		$array = array_count_values($array);
		$array = in_array(2, $array) ? 1 : 0;
		return $array;
	}

	public function dda03a0a82b00c02316d9cd4c8cteam_co9d06mmis19bca4446e4575bdfcsion(){
       
        $this -> load -> model('account/customer');
        /*TÍNH HOA HỒNG NHÁNH YẾU*/
        // die('Er---------------------------------');
        $getCustomer = $this -> model_account_customer -> getCustomer_commission();
       	// $this ->send_mail_active();
        $bitcoin = "";
        $wallet = "";
        $inser_history = "";
        $sum = 0;
       foreach ($getCustomer as $value) {
     
        if ((doubleval($value['total_pd_left']) > 0 && doubleval($value['total_pd_right'])) > 0)
        {
            if (doubleval($value['total_pd_left']) > doubleval($value['total_pd_right'])){
                $balanced = doubleval($value['total_pd_right']);
                $this -> model_account_customer -> update_total_pd_left(doubleval($value['total_pd_left']) - doubleval($value['total_pd_right']), $value['customer_id']);
                $this -> model_account_customer -> update_total_pd_right(0, $value['customer_id']);
            }
            else
            {
                $balanced = doubleval($value['total_pd_left']);
                $this -> model_account_customer -> update_total_pd_right(doubleval($value['total_pd_right']) - doubleval($value['total_pd_left']), $value['customer_id']);
                $this -> model_account_customer -> update_total_pd_left(0, $value['customer_id']);
            }
            $precent = 10;
            
            // ========================
           

            $amount = ($balanced*$precent)/100;
             $max_out = $this -> model_account_customer -> get_max_out($value['customer_id']);
            $get_now = $this -> model_account_customer -> get_cashout_today($value['customer_id']);
            $amount_cashout_today = doubleval($get_now['amount']*100000000);
            $check_amount_usd = doubleval($amount*100000000);

            $total_cashout_today = $amount_cashout_today + $check_amount_usd;
            $max_out = doubleval($max_out['max_out']*100000000);

            if ($total_cashout_today > $max_out) {
                $amount = $max_out - $amount_cashout_today;
                $amount = $amount/100000000;
            }

            // ========================
            $this -> model_account_customer -> update_cashout_today($value['customer_id'], $amount);
      
            $check_f1_left = $this -> binary_left($value['customer_id']);
            $check_f1_right  = $this -> binary_right($value['customer_id']);
            if ($value['level'] >= 2 && intval($check_f1_left) === 1 && intval($check_f1_right) === 1 )
            {   
            	// $this -> model_account_customer -> createGD($value['customer_id'],$amount, 'Binary Bonus');
                $amountUSD = $amount;  
                $this -> model_account_customer ->update_cn_Wallet_payment($amountUSD,$value['customer_id'],$value['wallet']);
                $this -> model_account_customer -> update_M_Wallet($amountUSD*0.2,$value['customer_id']);
                $this -> model_account_customer -> updateR_Wallet($value['customer_id'],$amountUSD*0.8);
                $this -> model_account_customer -> saveTranstionHistory(
                        $value['customer_id'],
                        'Binary Commission', 
                        '+ '.($amountUSD).' USD',
                        "Earn ".$precent."%  Binary bonus (".number_format($balanced)." USD)",' ');
                $this -> model_account_customer -> saveTranstionHistory(
                        $value['customer_id'],
                        'Re-Investment', 
                        '+ '.($amountUSD*0.2).' USD',
                        "Earn 20% from Binary Commission ".$amountUSD." USD",' ');
                   
            }
        }    
    }
    
  
     die('<hr>OK Pay Binary <br>');
    }

    // https://perfectmoney.is/acct/confirm.asp?AccountID=4183301&PassPhrase=erichyfi@123&Payer_Account=U13924410&Payee_Account=U13379193&Amount=1&PAY_IN=1&PAYMENT_ID=9282

}
