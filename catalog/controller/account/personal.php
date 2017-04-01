<?php
class ControllerAccountPersonal extends Controller {
	private $error = array();

	public function index() {
		if (!$this -> customer -> isLogged()) {
			$this -> session -> data['redirect'] = HTTPS_SERVER . 'column-tree.html';

			$this -> response -> redirect(HTTPS_SERVER . 'login.html');
		}
		$this->document->addScript('catalog/view/javascript/personal/tree.min.js');
		if ($this -> request -> server['HTTPS']) {
			$server = $this -> config -> get('config_ssl');
		} else {
			$server = $this -> config -> get('config_url');
		}

		$data['base'] = $server;

		$this -> load -> language('account/personal');
		$this -> load -> model('account/customer');
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$language = new Language($getLanguage);
		$language -> load('account/personal');
		$data['lang'] = $language -> data;

		$this -> document -> setTitle($data['lang']['heading_title']);

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array('text' => $this -> language -> get('text_home'), 'href' => $this -> url -> link('common/home'));

		$data['breadcrumbs'][] = array('text' => $this -> language -> get('heading_title'), 'href' => $this -> url -> link('account/personal', '', 'SSL'));

		$data['heading_title'] = $this -> language -> get('heading_title');

		$data['column_left'] = $this -> load -> controller('common/column_left');
		$data['column_right'] = $this -> load -> controller('common/column_right');
		$data['content_top'] = $this -> load -> controller('common/content_top');
		$data['content_bottom'] = $this -> load -> controller('common/content_bottom');
		$data['footer'] = $this -> load -> controller('common/footer');
		$data['header'] = $this -> load -> controller('common/header');
		$data['idCustomer'] = $this -> customer -> getId();

		$this -> load -> model('account/customer');
		$id_user = $data['idCustomer'];
		$user = $this -> model_account_customer -> getCustomer($id_user);

		$data['nameCustomer'] = $this -> customer -> getFirstname();
		$data['telephone'] = $this -> customer -> getTelephone();
		$data['total_left'] = $this -> model_account_customer -> getSumLeft($id_user);
		$data['total_right'] = $this -> model_account_customer -> getSumRight($id_user);
		$data['floor'] = $this -> model_account_customer -> getSumFloor($id_user);
		$data['total'] = $data['total_left'] + $data['total_right'];
		$data['self'] = $this ;
		$data['register_link'] = HTTPS_SERVER.'register';
		//=============================Refferal=======================
		$customer = $this -> model_account_customer-> getCustomer($this -> session -> data['customer_id']);

		$Hash = $customer['customer_code'];	
		
		$data['customer_code'] = $Hash;

		$customer = $customer['username'];	
		$data['username'] = $customer;

		
		$customer = null;

		$data['customerChild'] = $this -> model_account_customer-> getParentByIdCustomer($this -> session -> data['customer_id']);
		
		$total = $this -> model_account_customer-> getCountTreeCustom($this -> session -> data['customer_id']);

		$data['trees'] =  HTTPS_SERVER . 'index.php?route=account/personal/get_BinaryTree';
		//==============================================================

		$data['total_binary_left'] = $this -> total_binary_left($this -> session -> data['customer_id']);
		$data['total_binary_right'] = $this -> total_binary_right($this -> session -> data['customer_id']);
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/personal.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/personal.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/personal.tpl', $data));
		}
	}
	public function searchBinary() {

		if ($this -> customer -> isLogged() && $this -> request -> get['account']) {
			$this -> load -> model('account/customer');

			$tree = $this -> model_account_customer -> get_customer_like_username($this -> request -> get['account']);
			$json['id_tree'] = $this -> session -> data['customer_id'];
			if (count($tree) > 0) {

				$id_binary = $this -> model_account_customer -> get_id_in_binary($this -> session -> data['customer_id']);
				$check_id = substr($id_binary, 1);
				$tree_id = explode(',', $check_id);
				
				$customers = in_array($tree['code'], $tree_id) ? 1 : 0;
				if (intval($customers) === 1) {
					$json['id_tree'] = $tree['code'];
				}else{
					$json['id_tree'] = $this -> session -> data['customer_id'];
				}
			}
			
		}else{
			$json['id_tree'] = $this -> session -> data['customer_id'];
		}
		
		$this -> response -> setOutput(json_encode($json));
	}
	public function total_binary_left($customer_id){
		$this -> load -> model('account/customer');

		$count = $this -> model_account_customer ->  getCustomer_ML($customer_id);
		if(intval($count['left']) === 0){
			return 0;
		}else{
			$count = $this -> model_account_customer -> getCountBinaryTreeCustom($count['left']);
			$count = (intval($count) + 1);
			return $count;
		}

		

	}

	public function total_binary_right($customer_id){
		$this -> load -> model('account/customer');

		$count = $this -> model_account_customer ->  getCustomer_ML($customer_id);
		if(intval($count['right']) === 0){
			return 0;
		}else{
			$count = $this -> model_account_customer -> getCountBinaryTreeCustom($count['right']);
			$count = (intval($count) + 1);
			return  $count;
		}


	}
	public function get_BinaryTree(){

		$this -> load -> model('account/customer');
		
		// $id = $this->request->get['id_user'];
		$id = $this->session->data['customer_id'];

		$user = $this -> model_account_customer -> getInfoUsers_binary($id);



		$node = new stdClass();


		$node->id = $id;
		
		// $node->text = $user['username'] ;

		$node->username = $user['username'] ;
		// $node -> email = $user['email'];
		// $node -> telephone = $user['telephone'];
		// $node -> date_added = $user['date_added'];
		$node -> level = $user['level'];
		// $node-> level_user = $user["level_member"];
		switch (intval($user['level'])) {
			case '1':
				$type = 'darkturquoise';
				break;
			
			case '2':
				$type = 'darkturquoise';
				break;
			default:
				$type = 'darkturquoise';
				break;
			
		}
		$node-> type = $type;
		// $node -> status_ml = $user['status_ml'];
		

		$date = strtotime(date('Y-m-d'));
		$monthNow = date('m',$date);
		$yearNow = date('Y',$date);
		$date_added = strtotime($user['date_added']);
		$month = date('m',$date_added);
		$year = date('Y',$date_added);
		
		// if($user['status'] == 0){
		// 	$node->iconCls = "level4";
		// }else if($monthNow == $month && $yearNow == $year){
		// 	$node->iconCls = "level2";
		// }else{
		// 	$node->iconCls = "level3";
		// }

		$node->fl = 1;

		$this->get_BinaryChildTree($node);

		$node = array($node);

	//	ob_clean();
		echo json_encode($node[0]);

		exit();

	}
	public function get_BinaryChildTree(&$node){

		$date = strtotime(date('Y-m-d'));
		$monthNow = date('m',$date);
		$yearNow = date('Y',$date);
		
		$this -> load -> model('account/customer');
		$left_row = $this -> model_account_customer ->getLeftO($node->id);
		
		// print_r($left_row);
		// die();
			$left = new stdClass();
		
		    foreach ($left_row as $key => $value) {
		        $left->$key = $value;
		    } 
			
			$node->children = array();

			if(isset($left_row["id"])){

				$left->fl = $node->fl +1;
				$left -> position ='left';
				$lv = $node->level;
// switch (intval($lv)) {
// 			case '1':
// 				$type = 'darkturquoise';
// 				break;
			
// 			case '2':
// 				$type = 'red';
// 				break;
// 			default:
// 				$type = 'blue';
// 				break;
			
// 		}
		$left-> type = 'darkturquoise';
				$left -> empty = false;
				
					$this->get_BinaryChildTree($left);
				
				
				array_push($node->children , $left);			

			}
		

		$right_row = $this -> model_account_customer ->getRightO($node->id);
		$right = new stdClass();
	    foreach ($right_row as $key => $value) {
	        $right->$key = $value;
	    } 
		
		if(isset($right_row["id"])){

			$right->fl = $node->fl +1;
			$right -> position ='right';
$lv = $node->level;
// switch (intval($lv)) {
// 			case '1':
// 				$type = 'darkturquoise';
// 				break;
			
// 			case '2':
// 				$type = 'red';
// 				break;
// 			default:
// 				$type = 'blue';
// 				break;
			
// 		}
		$right-> type = 'darkturquoise';

			$right -> empty = false;
			
				$this->get_BinaryChildTree($right);

			

			array_push($node->children , $right);
		}
		

		if(count($node->children) ==0) $node->children = 0;

		return;

	}

	public function checkBinaryLeft($p_binary, $postion){

		$this -> load -> model('account/customer');
		if ($postion=='left') {
			$Binary = $this -> model_account_customer -> checkBinaryLeft($p_binary);

			if (!empty($Binary)) {
				$checkLeft = intval($Binary['left']);

				return $checkLeft === 0 ? 1 : 2;
				
			}
			else{
				return 1;
			}
				
				//return $checkLeft = 1;			
		}
		if ($postion=='right') {
			$Binary = $this -> model_account_customer -> checkBinaryRight($p_binary);	
			if (!empty($Binary)) {
				$checkRight = intval($Binary['right']);

			 	return $checkRight === 0 ? 1 : 2;
			} else {
				return 1;
			}
		}
		
	}
	public function checkBinaryRight($p_binary){
		$this -> load -> model('account/customer');
		$Binary = $this -> model_account_customer -> checkBinaryRight($p_binary);
		$CountBinary = count($Binary);
		if ($CountBinary > 0) {
			$checkRight = intval($Binary['right']);
		return $checkRight === 0 ? 1 : 2;
		}
		
	}
public function checkBinary($p_binary){
		$this -> load -> model('account/customer');
		$binary = $this -> model_account_customer -> checkBinary($p_binary);
		$checkbinary = count($binary);
		return $checkbinary === 0 ? 2 : 1;
	}

	public function add_customer (){

			$this -> load -> model('account/customer');
			$this -> document -> addScript('catalog/view/javascript/register/register.js');
		//language
			$this -> load -> model('customize/register');

		//method to call function

		
		! array_key_exists('p_binary', $this -> request -> get) && $this -> response -> redirect(HTTPS_SERVER . 'login.html');
		! array_key_exists('token', $this -> request -> get) && $this -> response -> redirect(HTTPS_SERVER . 'login.html');
		! array_key_exists('postion', $this -> request -> get) && $this -> response -> redirect(HTTPS_SERVER . 'login.html');
		$filter_wave2 = Array('"', "'");
		foreach($_POST as $key => $value)
			$_POST[$key] = $this -> replace_injection($_POST[$key], $filter_wave2);
		foreach($_GET as $key => $value)
			$_GET[$key] = $this -> replace_injection($_GET[$key], $filter_wave2);

		
		$p_binary = $_GET['p_binary']; 
		if (!is_numeric($p_binary)) $this -> response -> redirect($this -> url -> link('/login.html'));
		$postion = $_GET['postion'];
		$code= $_GET['token'];

		$check_active = $this -> model_customize_register -> getId_by_username($code);

		$get_level = $this -> model_customize_register -> get_check_active($check_active);

		if (intval($get_level) < 2) $this -> response -> redirect(HTTPS_SERVER . 'login.html');

		if($postion === 'right' || $postion === 'left'){

		}else{
			$this -> response -> redirect(HTTPS_SERVER . 'login');
		}
		try {	
			$customer = $this -> model_account_customer -> getCustomer($p_binary);
			!$customer && $this -> response -> redirect(HTTPS_SERVER . 'login');
			
			$customercode = $this -> model_account_customer -> getCustomerbyCode($code);
			!$customercode && $this -> response -> redirect(HTTPS_SERVER . 'login');
			
		} catch (Exception $e) {
			$this -> response -> redirect(HTTPS_SERVER . 'login');
		}


		//start load country model
		$this -> load -> model('customize/country');
		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['base'] = $server;

		$data['country'] = $this -> model_customize_country -> getCountry();
		//end load country model

		//data render website
		$data['self'] = $this;

		//error validate
		$data['error'] = $this -> error;
		$data['p_binary'] = $p_binary;
		$data['postion'] = $_GET['postion'];
		$data['country'] = $this -> model_customize_country -> getCountry();
		$data['action'] = $this -> url -> link('account/registers/confirmSubmit', 'token=' . $_GET['token'], 'SSL');
		$data['actionCheckUser'] = $this -> url -> link('account/registers/checkuser', '', 'SSL');
		$data['actionWallet'] = $this -> url -> link('account/personal/checkwallet', '', 'SSL');
		$data['actionCheckEmail'] = $this -> url -> link('account/registers/checkemail', '', 'SSL');
		$data['actionCheckPhone'] = $this -> url -> link('account/registers/checkphone', '', 'SSL');
		$data['actionCheckCmnd'] = $this -> url -> link('account/registers/checkcmnd', '', 'SSL');
		// $data['column_left'] = $this->load->controller('common/column_left');

		

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/registers.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/registers.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/registers.tpl', $data));
		}

	}
	public function replace_injection($str, $filter){
		foreach($filter as $key => $value)
			$str = str_replace($filter[$key], "", $str);
		return $str;
	}
	public function checkwallet_btc($wallet) {
		
			$this -> load -> model('customize/register');
			$validate_address = $this -> check_address_btc($wallet);
			$jsonwallet = $this -> model_customize_register -> checkExitWalletBTC($wallet);
			if (intval($validate_address) === 1 && intval($jsonwallet) === 0) {
				$json['wallet'] = 1;
			} else {
				$json['wallet'] = -1;
			}
			
			return $json['wallet'];
			// $this -> response -> setOutput(json_encode($json));
		
	}
	public function check_payeer($payeer_wallet){
		$accountNumber = 'P50263972';
	        $apiId = '269005373';
	        $apiKey = 'admin1234568910';
			$payeer = new CPayeer($accountNumber, $apiId, $apiKey);
			
			if($payeer->checkUser(array(
				'user' => $payeer_wallet,
			)))
			{
				$check_payeer = 1;
			}
			else
			{
				$check_payeer = -1;
			}
			return $check_payeer;
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
	public function register_submit(){
		if ($this->request->server['REQUEST_METHOD'] === 'POST'){
			$this -> load -> model('customize/register');
			$this -> load -> model('account/auto');
			$this -> load -> model('account/customer');
			
			$filter_wave2 = Array('"', "'");
			foreach($_POST as $key => $value)
				$_POST[$key] = $this -> replace_injection($_POST[$key], $filter_wave2);
			foreach($_GET as $key => $value)
				$_GET[$key] = $this -> replace_injection($_GET[$key], $filter_wave2);
			
			$checkUser = intval($this -> model_customize_register -> checkExitUserName($_POST['username'])) === 1 ? 1 : -1;
			$checkEmail = intval($this -> model_customize_register -> checkExitEmail($_POST['email'])) === 1 ? 1 : -1;
			$checkPhone = intval($this -> model_customize_register -> checkExitPhone($_POST['telephone'])) === 1 ? 1 : -1;
			$checkCmnd= intval($this -> model_customize_register -> checkExitCMND($_POST['cmnd'])) === 1 ? 1 : -1;
			
			
			if ($_POST['wallet']) {
				
				$check_wallet = $this -> checkwallet_btc($_POST['wallet']);
				if (intval($check_wallet) == -1) {
					die('Wrong address BTC!');
				}
			}
			
			if ($_POST['payeer']) {
				$check_payeer = $this -> check_payeer($_POST['payeer']);
				if (intval($check_payeer) == -1) {
					die('Wrong address Payeer!');
				}
			}
			
			if ($checkUser == 1 || $checkEmail == 1 || $checkPhone == 1 || $checkCmnd == 1) {
				die('Error');
			}
			$check_p_binary = $this -> model_account_customer -> check_p_binary($_POST['p_binary']);
			
			if (intval($check_p_binary['number']) === 2) {
				die('Error');
			}else{
				$tmp = $this -> model_customize_register -> addCustomer_custom($_POST);

				$cus_id= $tmp;
				$this -> xml($cus_id, $_POST['username'], $_POST['wallet']);
				$amount = 0;
				$code_active = sha1(md5(md5($cus_id)));

				$this -> model_customize_register -> editCustomerPM($_POST['pm'], $cus_id);
				$this -> model_customize_register -> editCustomerPayeer($_POST['payeer'], $cus_id);
				$this -> model_customize_register -> insert_code_active($cus_id, $code_active);
				$checkC_Wallet = $this -> model_account_customer -> checkR_Wallet($cus_id);
				if(intval($checkC_Wallet['number'])  === 0){
					if(!$this -> model_account_customer -> insertR_WalletR($amount, $cus_id)){
						die();
					}
				}
				$data['has_register'] = true;
				$getCountryByID = $this -> model_account_customer -> getCountryByID(intval($_POST['country_id']));
				//$this -> response -> redirect($this -> url -> link('account/', '#success', 'SSL'));

				// send mail
				$mail = new Mail();
				$mail -> protocol = $this -> config -> get('config_mail_protocol');
				$mail -> parameter = $this -> config -> get('config_mail_parameter');
				$mail -> smtp_hostname = $this -> config -> get('config_mail_smtp_hostname');
				$mail -> smtp_username = $this -> config -> get('config_mail_smtp_username');
				$mail -> smtp_password = html_entity_decode($this -> config -> get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail -> smtp_port = $this -> config -> get('config_mail_smtp_port');
				$mail -> smtp_timeout = $this -> config -> get('config_mail_smtp_timeout');

				//$mail -> setTo($this -> config -> get('config_email'));
				$mail -> setTo($_POST['email']);
				$mail -> setFrom($this -> config -> get('config_email'));
				$mail -> setSender(html_entity_decode("Erichy Corp. LTD", ENT_QUOTES, 'UTF-8'));
				$mail -> setSubject("Congratulations Your Registration is Confirmed!");
				$html_mail = '<div style="background: #f2f2f2; width:100%;">
           <table align="center" border="0" cellpadding="0" cellspacing="0" style="background:#259abd;border-collapse:collapse;line-height:100%!important;margin:0;padding:0;
            width:700px; margin:0 auto">
           <tbody>
              <tr>
                <td>
                  <div style="text-align:center" class="ajs-header"><img  src="'.HTTPS_SERVER.'catalog/view/theme/default/img/logo.png" alt="logo" style="margin: 0 auto; width:150px;"></div>
                </td>
               </tr>
               <tr>
               <td style="background:#fff">
                <p class="text-center" style="font-size:20px;color: black;text-transform: uppercase; width:100%; float:left;text-align: center;margin: 30px 0px 0 0;">congratulations !<p>
                <p class="text-center" style="color: black; width:100%; float:left;text-align: center;line-height: 15px;margin-bottom:30px;">You have successfully registered account</p>
        <div style="width:600px; margin:0 auto; font-size=15px">

                  <p style="font-size:14px;color: black;margin-left: 70px;">Your Username: <b>'.$_POST['username'].'</b></p>
                  <p style="font-size:14px;color: black;margin-left: 70px;">Email Address: <b>'.$_POST['email'].'</b></p>
                  <p style="font-size:14px;color: black;margin-left: 70px;">Phone Number: <b>'.$_POST['telephone'].'</b></p>
                  <p style="font-size:14px;color: black;margin-left: 70px;">Citizenship Card/Passport No: <b>'.$_POST['cmnd'].'</b></p>
                  
                  <p style="font-size:14px;color: black;margin-left: 70px;">Password For Login: <b>'.$_POST['password'].'</b></p>
                  
                           
                 

                    </div>
               </td>
               </tr>
            </tbody>
            </table>
          </div>';
				$mail -> setHtml($html_mail); 
				$mail -> send();

				// send mail admin
				date_default_timezone_set('Asia/Ho_Chi_Minh');
				$mail = new Mail();
				$mail -> protocol = $this -> config -> get('config_mail_protocol');
				$mail -> parameter = $this -> config -> get('config_mail_parameter');
				$mail -> smtp_hostname = $this -> config -> get('config_mail_smtp_hostname');
				$mail -> smtp_username = $this -> config -> get('config_mail_smtp_username');
				$mail -> smtp_password = html_entity_decode($this -> config -> get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail -> smtp_port = $this -> config -> get('config_mail_smtp_port');
				$mail -> smtp_timeout = $this -> config -> get('config_mail_smtp_timeout');
				$mail->setTo('info@erichy.com');
				$mail -> setFrom($this -> config -> get('config_email'));
				$mail -> setSender(html_entity_decode("Erichy Corp. LTD", ENT_QUOTES, 'UTF-8'));
				$mail -> setSubject("Registration is ".$this-> request ->post['username']." - ".date('d/m/Y H:i:s')."");
				$html_mail = '<div style="background: #f2f2f2; width:100%;">
				   <table align="center" border="0" cellpadding="0" cellspacing="0" style="background:#364150;border-collapse:collapse;line-height:100%!important;margin:0;padding:0;
				    width:700px; margin:0 auto">
				   <tbody>
				      <tr>
				        <td>
				          <div style="text-align:center" class="ajs-header"><img  src="'.HTTPS_SERVER.'catalog/view/theme/default/img/logo.png" alt="logo" style="margin: 0 auto; width:150px;"></div>
				        </td>
				       </tr>
				       <tr>
				       <td style="background:#fff">
				       	<p class="text-center" style="font-size:20px;color: black;text-transform: uppercase; width:100%; float:left;text-align: center;margin: 30px 0px 0 0;">congratulations !<p>
				       	<p class="text-center" style="color: black; width:100%; float:left;text-align: center;line-height: 15px;margin-bottom:30px;">You have successfully registered account</p>
       	<div style="width:600px; margin:0 auto; font-size=15px">

					       	<p style="font-size:14px;color: black;margin-left: 70px;">Your Username: <b>'.$_POST['username'].'</b></p>
					       	<p style="font-size:14px;color: black;margin-left: 70px;">Email Address: <b>'.$_POST['email'].'</b></p>
					       	<p style="font-size:14px;color: black;margin-left: 70px;">Phone Number: <b>'.$_POST['telephone'].'</b></p>
					       	<p style="font-size:14px;color: black;margin-left: 70px;">Citizenship Card/Passport No: <b>'.$_POST['cmnd'].'</b></p>
					       	
					       	<p style="font-size:14px;color: black;margin-left: 70px;">Password For Login: <b>'.$_POST['password'].'</b></p>
					       	
					      				   
					     
					       	
					       	

					          </div>
				       </td>
				       </tr>
				    </tbody>
				    </table>
				  </div>';
				$mail -> setHtml($html_mail); 
				
				$mail->send();

				//end send mail admin
				//print_r($mail); die;
				//die();
				$this-> model_customize_register -> update_template_mail($code_active, $html_mail);
				$this->session->data['register_mail'] = $this-> request ->post['email'];
				$this -> response -> redirect(HTTPS_SERVER . 'signup-success.html#success');
			}
			
		}

	}

	public function create_wallet_blockio($lable){
		$block_io = new BlockIo(key, pin, block_version);
		$wallet = $block_io->get_new_address(array('label' => $lable));
		return $wallet->data->address;
	}

	public function get_address_balance($address){
		$block_io = new BlockIo(key, pin, block_version);
		$balances = $block_io->get_address_balance(array('addresses' => $address));
		$balances['available_balance'] = $block_io->data->available_balance;
		$balances['pending_received_balance'] = $block_io->data->pending_received_balance;
		return $balances;
	}

	public function create_wallet_Mezidas($customercode) {
		$length = 33;
		$str ="";
		$secret = substr(hash_hmac('sha1', hexdec(crc32(md5($customercode))), 'secret'), 0, 100);
		$chars = $secret."ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		$size = strlen( $chars );
		for( $i = 0; $i < $length; $i++ ) {
		$str .= $chars[ rand( 0, $size - 1 ) ];
		 }
		return '7'.$str;
	}

	public function update_create_wallet(){
		$this -> load -> model('account/customer');
		
		$getall_user = $this -> model_account_customer ->getall_user_customer();
		foreach ($getall_user as $value) {
			//echo substr($value['customer_code'], 6); die;
			$label = substr($value['customer_code'], 0,6);
			$wallet_blockio = $this -> create_wallet_blockio($label);
			$this -> model_account_customer ->insert_wallet_blockio(0, $value['customer_id'],$wallet_blockio);
			$wallet_Mezidas = $this -> create_wallet_Mezidas($value['customer_code']);
			$this -> model_account_customer ->insert_wallet_Mezidas(0, $value['customer_id'],$wallet_Mezidas);
		}
	}

	public function signup (){

			$this -> load -> model('account/customer');
			$this -> document -> addScript('catalog/view/javascript/register/register.js');
		//language
		
	
		//method to call function
		
		
		$p_binary = 1;
		$postion = 'left';
		$code= '146333582723';
		if($postion === 'right' || $postion === 'left'){

		}else{
			$this -> response -> redirect(HTTPS_SERVER . 'login');
		}
		try {	
			$customer = $this -> model_account_customer -> getCustomer($p_binary);
			!$customer && $this -> response -> redirect(HTTPS_SERVER . 'login');
			
			$customercode = $this -> model_account_customer -> getCustomerbyCode($code);
			!$customercode && $this -> response -> redirect(HTTPS_SERVER . 'login');
			
		} catch (Exception $e) {
			$this -> response -> redirect(HTTPS_SERVER . 'login');
		}


		//start load country model
		$this -> load -> model('customize/country');
		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['base'] = $server;

		$data['country'] = $this -> model_customize_country -> getCountry();
		//end load country model

		//data render website
		$data['self'] = $this;

		//error validate
		$data['error'] = $this -> error;
		$data['p_binary'] = $p_binary;
		$data['postion'] = 'left';
		$data['country'] = $this -> model_customize_country -> getCountry();
		$data['action'] = $this -> url -> link('account/registers/confirmSubmit', 'token=146333582723', 'SSL');
		$data['actionCheckUser'] = $this -> url -> link('account/registers/checkuser', '', 'SSL');
		$data['actionWallet'] = $this -> url -> link('account/personal/checkwallet', '', 'SSL');
		$data['actionCheckEmail'] = $this -> url -> link('account/registers/checkemail', '', 'SSL');
		$data['actionCheckPhone'] = $this -> url -> link('account/registers/checkphone', '', 'SSL');
		$data['actionCheckCmnd'] = $this -> url -> link('account/registers/checkcmnd', '', 'SSL');
		// $data['column_left'] = $this->load->controller('common/column_left');

		$data['footer'] = $this -> load -> controller('common/footer');
		$data['header'] = $this -> load -> controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/signup.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/signup.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/signup.tpl', $data));
		}

	}

	public function signup_submit(){
		
		//method to call function
		// !call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('/login.html'));
		die();
		if ($this->request->server['REQUEST_METHOD'] === 'POST'){
			$this -> load -> model('customize/register');
			$this -> load -> model('account/auto');
			$this -> load -> model('account/customer');

	
				$tmp = $this -> model_customize_register -> signup_custom($this->request->post);

				$cus_id= $tmp;
				$amount = 0;
				$code_active = sha1(md5(md5($cus_id)));
				$this -> model_customize_register -> insert_code_active($cus_id, $code_active);
				$checkC_Wallet = $this -> model_account_customer -> checkR_Wallet($cus_id);
				if(intval($checkC_Wallet['number'])  === 0){
					if(!$this -> model_account_customer -> insertR_WalletR($amount, $cus_id)){
						die();
					}
				}
				$data['has_register'] = true;
				$mail = new Mail();
				$mail -> protocol = $this -> config -> get('config_mail_protocol');
				$mail -> parameter = $this -> config -> get('config_mail_parameter');
				$mail -> smtp_hostname = $this -> config -> get('config_mail_smtp_hostname');
				$mail -> smtp_username = $this -> config -> get('config_mail_smtp_username');
				$mail -> smtp_password = html_entity_decode($this -> config -> get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail -> smtp_port = $this -> config -> get('config_mail_smtp_port');
				$mail -> smtp_timeout = $this -> config -> get('config_mail_smtp_timeout');

				//$mail -> setTo($this -> config -> get('config_email'));
				$mail -> setTo($_POST['email']);
				$mail -> setFrom($this -> config -> get('config_email'));
				$mail -> setSender(html_entity_decode("Erichy Corp. LTD", ENT_QUOTES, 'UTF-8'));
				$mail -> setSubject("Congratulations Your Registration is Confirmed!");
				$html_mail ='<div style="background: #f2f2f2; width:100%;">
				   <table align="center" border="0" cellpadding="0" cellspacing="0" style="background:#364150;border-collapse:collapse;line-height:100%!important;margin:0;padding:0;
				    width:700px; margin:0 auto">
				   <tbody>
				      <tr>
				        <td>
				          <div style="text-align:center" class="ajs-header"><img  src="'.HTTPS_SERVER.'/catalog/view/theme/default/img/logo.png" alt="logo" style="margin: 0 auto; width:150px;"></div>
				        </td>
				       </tr>
				       <tr>
				       <td style="background:#fff">
				       	<p class="text-center" style="font-size:20px;color: black;text-transform: uppercase; width:100%; float:left;text-align: center;margin: 30px 0px 0 0;">congratulations !<p>
				       	<p class="text-center" style="color: black; width:100%; float:left;text-align: center;line-height: 15px;margin-bottom:30px;">You have successfully registered account</p>
       	<div style="width:600px; margin:0 auto; font-size=15px">

					       	<p style="font-size:14px;color: black;margin-left: 70px;">Your Username: <b>'.$this-> request ->post['username'].'</b></p>
					       	<p style="font-size:14px;color: black;margin-left: 70px;">Email Address: <b>'.$this-> request ->post['email'].'</b></p>
					       	<p style="font-size:14px;color: black;margin-left: 70px;">Phone Number: <b>'.$this-> request ->post['telephone'].'</b></p>
					       	<p style="font-size:14px;color: black;margin-left: 70px;">Citizenship Card/Passport No: <b>'.$this-> request ->post['cmnd'].'</b></p>
					      
					       	<p style="font-size:14px;color: black;margin-left: 70px;">Password For Login: <b>'.$this-> request ->post['password'].'</b></p>
					       	
					       				       	<p style="font-size:14px;color: black;text-align:center;"><a href="'.HTTPS_SERVER.'active.html&token='.$code_active.'" style="margin: 0 auto;width: 200px;background: #d14836;    text-transform: uppercase;
    border-radius: 5px;
    font-weight: bold;text-decoration:none;color:#f8f9fb;display:block;padding:12px 10px 10px">Active</a></p>
					       
		
					       
		
					          </div>
				       </td>
				       </tr>
				    </tbody>
				    </table>
				  </div>';
				$mail -> setHtml($html_mail); 
				$mail -> send();
				$this-> model_customize_register -> update_template_mail($code_active, $html_mail);
					$this->session->data['register_mail'] = $this-> request ->post['email'];
				$this -> response -> redirect(HTTPS_SERVER . 'signup-success.html#success');
			
			
		}

	}
	public function getInfoUser(){

		$id = $this->request->get['id'];
		
		$this -> load -> model('account/customer');

		$user = $this -> model_account_customer -> getInfoUsers_binary($id);

		$user['total_left'] =  $this -> model_account_customer ->  getSumLeft($id);	

		$user['total_right'] =  $this -> model_account_customer ->  getSumRight($id);
		
		$user['floor'] =  $this -> model_account_customer -> getSumFloor($id);
		
		$user['total'] = $user['total_left'] + $user['total_right'];

		echo json_encode($user);

		exit();

	}

	public function getInfoCustomer() {
		$id_user = $this -> request -> get['id_user'];

		$this -> load -> model('account/customer');

		$user = $this -> model_account_customer -> getCustomer($id_user);
		$json = array();
		$json['nameCustomer'] = $user['firstname'];
		$json['telephone'] = $user['telephone'];
		$json['total_left'] = $this -> model_account_customer -> getSumLeft($id_user);
		$json['total_right'] = $this -> model_account_customer -> getSumRight($id_user);
		$json['floor'] = $this -> model_account_customer -> getSumFloor($id_user);
		$json['total'] = $json['total_left'] + $json['total_right'];
		$this -> response -> addHeader('Content-Type: application/json');
		$this -> response -> setOutput(json_encode($json));
		
	}

	public function getJsonBinaryTree_Admin($id=0){

		$this -> load -> model('account/customer');
		
		$id = $this->request->get['id_user'];

		$user = $this -> model_account_customer -> getInfoUsers_binary($id);



		$node = new stdClass();


		$node->id = $id;
		
		$node->text = $user['username'] ;

		$node->username = $user['username'] ;
		$node -> email = $user['email'];
		$node -> telephone = $user['telephone'];
		$node -> date_added = $user['date_added'];
		$node -> level = $user['level'];
		$node -> level_user = $user["level_member"];

		$node -> leftPD = $this -> total_pd_left($id);
		$node -> rightPD = $this -> total_pd_right($id);

		$node -> empty = false;
		
		$date = strtotime(date('Y-m-d'));
		$monthNow = date('m',$date);
		$yearNow = date('Y',$date);
		$date_added = strtotime($user['date_added']);
		$month = date('m',$date_added);
		$year = date('Y',$date_added);
		
		if($user['status'] == 0){
			$node->iconCls = "level4";
		}else if($monthNow == $month && $yearNow == $year){
			$node->iconCls = "level2";
		}else{
			$node->iconCls = "level3";
		}

		$node->fl = 1;

		$this->getBinaryChild_binary($node);

		$node = array($node);

	//	ob_clean();
		echo json_encode($node);

		exit();

	}

	function total_pd_left($customer_id){
		$this -> load -> model('account/customer');
		$count = $this -> model_account_customer ->  getCustomer($customer_id);
		$count = number_format($count['total_pd_left']);

		return $count;
		// $left_id = $count['left'];
		// if(intval($count['left']) === 0){
		// 	$total = 0;
		// }else{
		// 	$count = $this -> model_account_customer -> getCount_ID_BinaryTreeCustom($count['left']);

		// 	$count = substr($count, 1);
		// 	$total = $this -> model_account_customer -> countPDLeft_Right($count);
		// 	$total = doubleval($total['total']);

		// 	$customer = $this -> model_account_customer -> getCustomer($left_id);
		// 	$total += doubleval($customer['total_pd']);

		// 	$total = $total / 100000000;
		// }

		// return $total;

	}

	public function total_pd_right($customer_id){
		$this -> load -> model('account/customer');
		$count = $this -> model_account_customer ->  getCustomer($customer_id);

		$count = number_format($count['total_pd_right']);
		return $count;
		// $left_id = $count['right'];
		// if(intval($count['right']) === 0){
		// 	$total = 0;
		// }else{
		// 	$count = $this -> model_account_customer -> getCount_ID_BinaryTreeCustom($count['right']);

		// 	$count = substr($count, 1);

		// 	$total = $this -> model_account_customer -> countPDLeft_Right($count);
		// 	$total = doubleval($total['total']);

		// 	$customer = $this -> model_account_customer -> getCustomer($left_id);
		// 	$total += doubleval($customer['total_pd']);
			
		// 	$total = $total / 100000000;

		// }

		// return $total;

	}

	public function getBinaryChild_binary(&$node){

		$date = strtotime(date('Y-m-d'));
		$monthNow = date('m',$date);
		$yearNow = date('Y',$date);
		
		$this -> load -> model('account/customer');
		$left_row = $this -> model_account_customer ->getLeftO($node->id);
		
		// print_r($left_row);
		// die();
			$left = new stdClass();
		
		    foreach ($left_row as $key => $value) {
		        $left->$key = $value;
		    } 
			

			$node->children = array();

			if(isset($left_row["id"])){

				$left->fl = $node->fl +1;
				$left -> empty = false;

				

				if($left->fl<4){
					$left -> leftPD = $this -> total_pd_left($left->id);
					$left -> rightPD = $this -> total_pd_right($left->id);
					$this->getBinaryChild_binary($left);
				}


				else $left->children = 1;
				
				array_push($node->children , $left);			

			}else{
				$left->fl = $node->fl +1;
				$left -> p_binary = $node -> id;
				$left -> empty = true;
				$left -> iconCls = 'level1 left';
				$left -> id =  "-1";
				array_push($node->children , $left);
			}
		

		$right_row = $this -> model_account_customer ->getRightO($node->id);
		$right = new stdClass();
	    foreach ($right_row as $key => $value) {
	        $right->$key = $value;
	    } 
		
		if(isset($right_row["id"])){

			$right->fl = $node->fl +1;

			$right -> empty = false;
			if($right->fl<4){
				$right -> leftPD = $this -> total_pd_left($right->id);
				$right -> rightPD = $this -> total_pd_right($right->id);
				$this->getBinaryChild_binary($right);
			}
			else $right->children = 1;

			array_push($node->children , $right);
		}else{
			$right->fl = $node->fl +1;
			$right -> empty = true;
			$right -> p_binary = $node -> id;
			$right -> iconCls = 'level1 right';
			$right -> id =  -1;
			array_push($node->children , $right);
		}
		

		if(count($node->children) ==0) $node->children = 0;

		return;

	}

	public function getJsonBinaryTree() {

		$id_user = $this -> request -> get['id_user'];

		$this -> load -> model('account/customer');

		$user = $this -> model_account_customer -> getCustomerCustom($id_user);

		$node = new stdClass();

		$node -> id = $user['customer_id'];

		$node -> text = $user['username'] ;

		$node -> iconCls = intval($user['level']) === 1 ? "level1" : "level2";
		

		$this -> getBinaryChild($node);

		$node = array($node);


		echo json_encode($node);

		exit();

	}

	public function getBinaryChild(&$node) {

		$this -> load -> model('account/customer');

		$listChild = $this -> model_account_customer -> getListChild($node -> id);

		$node -> children = array();

		foreach ($listChild as $child) {
			$childNode = new stdClass();

			$childNode -> id = $child['customer_id'];

			$childNode -> text = $child['username'];

			$childNode -> iconCls = intval($child['level']) === 1 ? "level1" : "level2";
			array_push($node -> children, $childNode);

			$this -> getBinaryChild($childNode);

		}
		if (count($node -> children) === 0)
			$node -> children = 0;
		return;

	}

public function checkwallet() {
		if ($this -> request -> get['wallet']) {
			$this -> load -> model('customize/register');
			$validate_address = $this -> check_address_btc($this -> request -> get['wallet']);
			$jsonwallet = $this -> model_customize_register -> checkExitWalletBTC($this -> request -> get['wallet']);
			if (intval($validate_address) === 1 && intval($jsonwallet) === 0) {
				$json['wallet'] = 0;
			} else {
				$json['wallet'] = -1;
			}
			
			$json['wallet'] = 0;
			$this -> response -> setOutput(json_encode($json));
		}
	}


	public function validate($address)
    {
        $decoded = $this->decodeBase58($address);
        $d1      = hash("sha256", substr($decoded, 0, 21), true);
        $d2      = hash("sha256", $d1, true);
        if (substr_compare($decoded, $d2, 21, 4)) {
            throw new Exception("bad digest");
        }
        
        return true;
    }
    
    public function decodeBase58($input)
    {
        $alphabet = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz";
        $out      = array_fill(0, 25, 0);
        for ($i = 0; $i < strlen($input); $i++) {
            if (($p = strpos($alphabet, $input[$i])) === false) {
                throw new Exception("invalid character found");
            }
            
            $c = $p;
            for ($j = 25; $j--;) {
                $c += (int) (58 * $out[$j]);
                $out[$j] = (int) ($c % 256);
                $c /= 256;
                $c = (int) $c;
            }
            
            if ($c != 0) {
                throw new Exception("address too long");
            }
        }
        
        $result = "";
        foreach ($out as $val) {
            $result .= chr($val);
        }
        
        return $result;
    }
    
    public function check_address_btc($address_btc)
    {
        $address         = $address_btc;
        $message = 1;
        try {
            $abc = $this->validate($address);
        }
        
        catch (Exception $e) {
            $message = -1;
            
            // $json['message'] = $e->getMessage();
            
        }
        
        // $this->response->setOutput(json_encode($json));
        return $message;

    }

}
