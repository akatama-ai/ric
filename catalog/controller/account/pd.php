<?php
class ControllerAccountPd extends Controller {

	public function index() {

		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> document -> addScript('catalog/view/javascript/countdown/jquery.countdown.min.js');
			$self -> document -> addScript('catalog/view/javascript/pd/countdown.js');
		};
		$this -> load -> model('account/customer');
		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('/login.html'));
		call_user_func_array("myConfig", array($this));

		//language
		$this -> load -> model('account/customer');
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$language = new Language($getLanguage);
		$language -> load('account/pd');
		$data['lang'] = $language -> data;
		$data['getLanguage'] = $getLanguage;
		$customer = $this -> model_account_customer -> getCustomer($this -> session -> data['customer_id']);



		$server = $this -> request -> server['HTTPS'] ? $server = $this -> config -> get('config_ssl') : $server = $this -> config -> get('config_url');
		$data['base'] = $server;
		$data['self'] = $this;
		$page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;

		$limit = 10;
		$start = ($page - 1) * 10;
		$pd_total = $this -> model_account_customer -> getTotalPD($this -> session -> data['customer_id']);

		$pd_total = $pd_total['number'];

		$pagination = new Pagination();
		$pagination -> total = $pd_total;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = str_replace('/index.php?route=', "/", $this -> url -> link('investment-detail.html', 'page={page}', 'SSL'));

		$data['pds'] = $this -> model_account_customer -> getPDById($this -> session -> data['customer_id'], $limit, $start);
		$data['pagination'] = $pagination -> render();


		//get all PD
		$data['pd_all'] = $this -> model_account_customer ->getPD($this -> session -> data['customer_id']);
		$data['pd_re_investment'] = $this -> model_account_customer -> getPDById_re_investment($this -> session -> data['customer_id'], $limit, $start);

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/pd.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/pd.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/pd.tpl', $data));
		}
	}
	public function countDay($id =null){
		$this -> load -> model('account/pd');
		$countDayPD = $this -> model_account_pd ->CountDayPD($id);
		echo ($countDayPD['number']) > 0 ? 1 : 2;
	}
	public function countTransferID($transferid =null){
		$this -> load -> model('account/pd');
		$countDayPD = $this -> model_account_pd ->countTransferID($transferid);
		return $countDayPD['number'] > 0 ? 1 : 2;
	}

	public function payconfirm() {
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> load -> model('account/customer');
			$self -> document -> addScript('catalog/view/javascript/countdown/jquery.countdown.min.js');
			$self -> document -> addScript('catalog/view/javascript/pd/countdown.js');
		};

		!$this -> request -> get['token'] && $this -> response -> redirect($this -> url -> link('account/dashboard', '', 'SSL'));
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('/login.html'));
		call_user_func_array("myConfig", array($this));

		//language
		$this -> load -> model('account/customer');
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$language = new Language($getLanguage);
		$language -> load('account/pd');
		$data['lang'] = $language -> data;
		$data['getLanguage'] = $getLanguage;

		$getPDCustomer = $this -> model_account_customer -> getPDByCustomerIDAndToken($this -> session -> data['customer_id'], $this -> request -> get['token']);

		$getPDCustomer['number'] == 0 && $this -> response -> redirect($this -> url -> link('account/dashboard', '', 'SSL'));
		$getPDCustomer = null;

		$server = $this -> request -> server['HTTPS'] ? $server = $this -> config -> get('config_ssl') : $server = $this -> config -> get('config_url');
		$data['base'] = $server;
		$data['self'] = $this;
		$data['pd_id'] = $this -> request -> get['token'];

		$data['PdUser'] = $this -> model_account_customer -> getPDConfirm($this -> request -> get['token']);

		$data['wallet'] = $this -> config -> get('config_wallet');
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/pay_confirm.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/pay_confirm.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/pay_confirm.tpl', $data));
		}

	}

	public function PayconfirmSubmit() {
		
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};
		function myConfig($self) {
			$self -> load -> model('account/customer');
			$self -> load -> model('account/pd');
		};
		//method to call function

		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('/login.html'));
		call_user_func_array("myConfig", array($this));
		!array_key_exists('amount', $this -> request -> get) && $this -> response -> redirect($this -> url -> link('/login.html'));
		//language

		//check count customer
		$count_invoice = $this -> model_account_pd -> countPD($this -> session -> data['customer_id']);

		$count_invoice = $count_invoice['number'];
		$data['notCreate'] = false;

		if ($count_invoice > 5)
			$data['notCreate'] = true;
		//save invoice
		if (!$data['notCreate']) {
			$secret = substr(hash_hmac('ripemd160', hexdec(crc32(md5(microtime()))), 'secret'), 0, 16);

			$transferId = $this->request->get['transferid'];
			$amount = $this->request->get['amount'];
			$callback = "";
			$invoice_id = $this -> model_account_pd -> saveInvoice($this -> session -> data['customer_id'], $secret, $amount,$transferId,$callback);

			$invoice_id === -1 && die('Server error , Please try again !!!!');
			$invoice_id_hash = hexdec(crc32(md5($invoice_id)));
			//create API Blockchainapi.org
			//$my_address = $this -> request -> get['wallet'];
			$my_address = '13i8NozB6uZRGgKMLrMoza9rZumqYuHGPV';

			//$my_address = '1Lhq2QCtt8TZNcAv9oSY1ng8WRE3VTwnHs';
			$my_callback_url = HTTPS_SERVER . 'index.php?route=account/pd/callback&invoice_id=' . $invoice_id_hash . '&secret=' . $secret;
			$api_base = 'https://blockchainapi.org/api/receive';
			$response = $api_base . '?method=create&address=' . $my_address . '&callback=' . urlencode($my_callback_url);
			$fcontents = implode('', file($response));
			$object = json_decode($fcontents);
			//update input address and fee_percent
			!$this -> model_account_pd -> updateInaddressAndFree($invoice_id, $invoice_id_hash, $object -> input_address, $object -> fee_percent, $object -> destination) && die('Server Error !!!!');
			$data['wallet'] = $object -> input_address;
			//setup and check show qr code
			$data['bitcoin'] = $amount;
			!intval($data['bitcoin']) && $this -> response -> redirect($this -> url -> link('/login.html'));
			$data['bitcoin'] = intval($data['bitcoin']);
		       $data['self'] = $this;
            $json['link'] = HTTPS_SERVER . 'invoice&invoice_hash=' . $invoice_id_hash;
            
            $this->response->setOutput(json_encode($json));
        } else {
            $data['invoice'] = $this->model_account_pd->getAllInvoiceByCustomer_notCreateOrder($this->session->data['customer_id']);
            $json['link']    = HTTPS_SERVER . 'index.php?route=account/pd/show_invoice_pending';
            $this->response->setOutput(json_encode($json));
        }

	}

	public function show_invoice_pending()
    {
        function myCheckLoign($self)
        {
            return $self->customer->isLogged() ? true : false;
        }
        ;
        function myConfig($self)
        {
            $self->load->model('account/customer');
            $self->load->model('account/pd');
        }
        ;
        //method to call function
        !call_user_func_array("myCheckLoign", array(
            $this
        )) && $this->response->redirect(HTTPS_SERVER . 'login.html');
        call_user_func_array("myConfig", array(
            $this
        ));
        $data['notCreate'] = true;
        $data['invoice']   = $this->model_account_pd->getAllInvoiceByCustomer_notCreateOrder($this->session->data['customer_id']);
        $data['self']      = $this;
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/confirmPending.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/confirmPending.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/confirmPending.tpl', $data));
        }
    }
	 public function show_invoice()
    {
    
        function myCheckLoign($self)
        {
            return $self->customer->isLogged() ? true : false;
        }
        ;
        function myConfig($self)
        {
        	$self -> document -> addScript('catalog/view/javascript/pd/confirm.js');
            $self->load->model('account/customer');
            $self->load->model('account/pd');
        }
         
        //method to call function
        !call_user_func_array("myCheckLoign", array(
            $this
        )) && $this->response->redirect(HTTPS_SERVER . 'login.html');
        call_user_func_array("myConfig", array(
            $this
        ));

        !array_key_exists('invoice_hash', $this->request->get) && die();
        $invoice_hash = $this->request->get['invoice_hash'];

        $invoice      = $this->model_account_pd->getInvoceFormHash($invoice_hash, $this->session->data['customer_id']);

        !$invoice && $this->response->redirect(HTTPS_SERVER . 'login.html');
         
        $count_invoice     = $this->model_account_pd->countPD($this->session->data['customer_id']);
        $count_invoice     = $count_invoice['number'];
        $data['notCreate'] = false;
        if ($count_invoice > 6) {
            $data['notCreate'] = true;
            $data['invoice']   = $this->model_account_token->getAllInvoiceByCustomer_notCreateOrder($this->session->data['customer_id']);
        } else {
            $data['bitcoin'] = $invoice['amount'];
            $data['wallet']  = $invoice['input_address'];
            $data['date_added']  = $invoice['date_created'];
            $data['transfer_id']  = $invoice['transfer_id'];
            $data['received']  = $invoice['received'];
         	$data['confirmations']  = $invoice['confirmations'];
     	}
        $this -> load -> model('account/customer');
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$language = new Language($getLanguage);
		$language -> load('account/pd');
		$data['lang'] = $language -> data;

        $data['self'] = $this;
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/checkConfirmPd.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/checkConfirmPd.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/checkConfirmPd.tpl', $data));
        }
    }
    public function callback_payeer(){
         $this -> load -> model('account/pd');
        $this -> load -> model('account/auto');
        $this -> load -> model('account/customer');

        if (isset($_POST['m_operation_id']) && isset($_POST['m_sign']))
            {
                $m_key = '7Wrd4FxK7Wrd4FxK7Wrd4FxK';
                $arHash = array(
                    $_POST['m_operation_id'],
                    $_POST['m_operation_ps'],
                    $_POST['m_operation_date'],
                    $_POST['m_operation_pay_date'],
                    $_POST['m_shop'],
                    $_POST['m_orderid'],
                    $_POST['m_amount'],
                    $_POST['m_curr'],
                    $_POST['m_desc'],
                    $_POST['m_status']
                );

                if (isset($_POST['m_params']))
                {
                    $arHash[] = $_POST['m_params'];
                }
                $arHash[] = $m_key;
                $sign_hash = strtoupper(hash('sha256', implode(':', $arHash)));

                if ($_POST['m_sign'] == $sign_hash && $_POST['m_status'] == 'success')
                {
                    // ================================================
                     $invoice = $this -> model_account_pd -> getInvoceForm_InvoiceIdHash($_POST['m_orderid']);
                        $pd_tmp_pd = $this -> model_account_pd -> getPD($invoice['transfer_id']);
                      //   if (floatval($_POST['m_amount']) < floatval($pd_tmp_pd['filled']) ) die('error');
                       intval($invoice['confirmations']) >= 3 && die();
              
                        if (floatval($_POST['m_amount']) < floatval($pd_tmp_pd['filled']) ) die('error');
                            $this -> model_account_customer ->updateLevel($invoice['customer_id'], 2);

                            $this -> model_account_pd -> updateConfirm($invoice['invoice_id_hash'], 3, '', '');

                            //update PD
                            $this -> model_account_pd -> updateStatusPD($invoice['transfer_id'], 1);

                            
                            $pd_tmp_ = $pd_tmp_pd ;
                            $pd_tmp_ = $pd_tmp_['filled'];

                            switch ($pd_tmp_) {
                                case 50:
                                    $pc = 0.016;
                                    $day = 100;
                                    $this -> model_account_customer -> insert_max_out($invoice['customer_id'], 200);
                                    break;
                                case 200:
                                    $pc = 0.016;
                                    $day = 100;
                                    $this -> model_account_customer -> insert_max_out($invoice['customer_id'], 500);
                                    break;
                                case 500:
                                    $pc = 0.018;
                                    $day = 100;
                                    $this -> model_account_customer -> insert_max_out($invoice['customer_id'], 1000);
                                    break;
                                case 1000:
                                    $pc = 0.02;
                                    $day = 100;
                                    $this -> model_account_customer -> insert_max_out($invoice['customer_id'], 2000);
                                    break;
                                case 5000:
                                    $pc = 0.022;
                                    $day = 100;
                                    $this -> model_account_customer -> insert_max_out($invoice['customer_id'], 2000);
                                    break;
                                case 10000:
                                    $pc = 0.025;
                                    $day = 100;
                                    $this -> model_account_customer -> insert_max_out($invoice['customer_id'], 3000);
                                    break;
                                
                            }

                            $pd_tmp_ = $pd_tmp_ * $pc;

                            $this -> model_account_pd -> updateDatefinishPD($invoice['transfer_id'], $pd_tmp_,$day);
                            
                            $customer = $this -> model_account_customer ->getCustomer($invoice['customer_id']);
                       
                          
                            
                            // $max_profit = $amountPD * 0.02;

                            $this -> model_account_customer -> update_R_Wallet_add_payeer($pd_tmp_,$invoice['customer_id'], $customer['wallet_payeer'],$day);
                      

                            $check_signup = intval($customer['check_signup']);

                                //update pd left and right
                                //get customer_ml p_binary
                                $customer_ml = $this -> model_account_customer -> getTableCustomerMLByUsername($invoice['customer_id']);

                                $customer_first = true ;
                                if(intval($customer_ml['p_binary']) !== 0 && $check_signup !== 1){
                                    $amount_binary = doubleval($pd_tmp_pd['filled']);
                                    while (true) {
                                        //lay thang cha trong ban Ml
                                        $customer_ml_p_binary = $this -> model_account_customer -> getTableCustomerMLByUsername($customer_ml['p_binary']);

                                        if($customer_first){
                                            //kiem tra la customer dau tien vi day la gia tri callback mac dinh
                                            if(intval($customer_ml_p_binary['left']) === intval($invoice['customer_id']) )  {
                                                //nhanh trai
                                                if (intval($customer_ml_p_binary['level']) === 2) {
                                                    $this -> model_account_customer -> update_pd_binary(true, $customer_ml_p_binary['customer_id'], $amount_binary );
                                                    $this -> model_account_customer -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'Amount Left', '+ ' . number_format($amount_binary) . ' USD', "From ".$customer['username']." Active Package # (".number_format($amount_binary)." USD)");   
                                                    $this -> model_account_customer -> update_btc_binary(true, $customer_ml_p_binary['customer_id'], $amount_binary );
                                                }
                                               
                                            }else{
                                                //nhanh phai
                                                if (intval($customer_ml_p_binary['level']) === 2) {
                                                    $this -> model_account_customer -> update_pd_binary(false, $customer_ml_p_binary['customer_id'], $amount_binary );
                                                    $this -> model_account_customer -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'Amount Right', '+ ' . number_format($amount_binary) . ' USD', "From ".$customer['username']." active Package # (".number_format($amount_binary)." USD)");   
                                                    $this -> model_account_customer -> update_btc_binary(false, $customer_ml_p_binary['customer_id'], $amount_binary );
                                                }
                                               
                                            }
                                            $customer_first = false;
                                        }else{
                                
                                            if(intval($customer_ml_p_binary['left']) === intval($customer_ml['customer_id']) ) {
                                                //nhanh trai
                                                if (intval($customer_ml_p_binary['level']) === 2) {
                                                    $this -> model_account_customer -> update_pd_binary(true, $customer_ml_p_binary['customer_id'], $amount_binary );
                                                    $this -> model_account_customer -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'Amount Left', '+ ' . number_format($amount_binary) . ' USD', "From ".$customer['username']." active Package # (".number_format($amount_binary)." USD)");   
                                                    $this -> model_account_customer -> update_btc_binary(true, $customer_ml_p_binary['customer_id'], $amount_binary );
                                                }
                                               
                                            }else{
                                                //nhanh phai
                                                if (intval($customer_ml_p_binary['level']) === 2) {
                                                    $this -> model_account_customer -> update_pd_binary(false, $customer_ml_p_binary['customer_id'], $amount_binary );
                                                    $this -> model_account_customer -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'Amount Right', '+ ' . number_format($amount_binary) . ' USD', "From ".$customer['username']." active Package # (".number_format($amount_binary)." USD)");   
                                                    $this -> model_account_customer -> update_btc_binary(false, $customer_ml_p_binary['customer_id'], $amount_binary );
                                                }
                                                
                                            }
                                        }
                                        
                                        

                                        if(intval($customer_ml_p_binary['customer_id']) === 1){
                                            break;
                                        }
                                        //lay tiep customer de chay len tren lay thang cha
                                        $customer_ml = $this -> model_account_customer -> getTableCustomerMLByUsername($customer_ml_p_binary['customer_id']);

                                    } 
                                }

                                 //=========Hoa hong bao tro=====================
                                
                                $partent = $this -> model_account_customer ->getCustomer($customer['p_node']);

                               if (!empty($partent) && $check_signup !== 1) {

                                // Check ! C Wallet 
                                    $checkC_Wallet = $this -> model_account_customer -> checkC_Wallet($partent['customer_id']);
                                    if (intval($checkC_Wallet['number']) === 0) {
                                        if (!$this -> model_account_customer -> insertC_Wallet($partent['customer_id'])) {
                                            die();
                                        }
                                    }

                                    // if (intval($partent['active_tree']) === 1) {
                                     $customer = $this -> model_account_customer ->getCustomer($invoice['customer_id']);
                                    //$percent = floatval($this -> config -> get('config_percentcommission'));
                                    
                                    $amountPD = intval($pd_tmp_pd['filled']);

                                 $this->commission_Parrent($invoice['customer_id'], $amountPD, $invoice['transfer_id']);
                                    // }
                               }
                    // ================================================
                }

                //echo $_POST['m_orderid'].'|error';
            }
    }
    public function callback_pm(){
        $this -> load -> model('account/pd');
        $this -> load -> model('account/auto');
        $this -> load -> model('account/customer');

        $secret = strtoupper( md5('tV7K7TQg42izLf4EbrTdhrzFi'));
        $hash = $_POST['PAYMENT_ID'].':'.
        $_POST['PAYEE_ACCOUNT'].':'.
        $_POST['PAYMENT_AMOUNT'].':'.
        $_POST['PAYMENT_UNITS'].':'.
        $_POST['PAYMENT_BATCH_NUM'].':'.
        $_POST['PAYER_ACCOUNT'].':'.
        $secret.':'.
        $_POST['TIMESTAMPGMT'];
        $mail = new Mail();
        $mail -> protocol = $this -> config -> get('config_mail_protocol');
        $mail -> parameter = $this -> config -> get('config_mail_parameter');
        $mail -> smtp_hostname = $this -> config -> get('config_mail_smtp_hostname');
        $mail -> smtp_username = $this -> config -> get('config_mail_smtp_username');
        $mail -> smtp_password = html_entity_decode($this -> config -> get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mail -> smtp_port = $this -> config -> get('config_mail_smtp_port');
        $mail -> smtp_timeout = $this -> config -> get('config_mail_smtp_timeout');
        //$mail -> setTo($this -> config -> get('config_email'));
        $mail -> setTo('appnanas0001@gmail.com');
    
        $mail -> setFrom($this -> config -> get('config_email'));
        $mail -> setSender(html_entity_decode("erichy, Inc", ENT_QUOTES, 'UTF-8'));
        $mail -> setSubject("BTC invoice");
        $html_mail = 'Hash='. $hash.'<br> V_HAS'.$_POST['V2_HASH'];
        $mail -> setHtml($html_mail); 
        $mail -> send();
        

        $hash = strtoupper( md5($hash) );

       if ( $hash != $_POST['V2_HASH'] ) exit('error');

        $invoice = $this -> model_account_pd -> getInvoceForm_InvoiceIdHash($_POST['PAYMENT_ID']);
        $pd_tmp_pd = $this -> model_account_pd -> getPD($invoice['transfer_id']);

        if (floatval($_POST['PAYMENT_AMOUNT']) < floatval($pd_tmp_pd['filled']) ) die('error');

            $this -> model_account_customer ->updateLevel($invoice['customer_id'], 2);

            $this -> model_account_pd -> updateConfirm($invoice['invoice_id_hash'], 3, '', '');

            //update PD
            $this -> model_account_pd -> updateStatusPD($invoice['transfer_id'], 1);

            
            $pd_tmp_ = $pd_tmp_pd ;
            $pd_tmp_ = $pd_tmp_['filled'];

            
            switch ($pd_tmp_) {
                case 50:
                    $pc = 0.016;
                    $day = 100;
                    $this -> model_account_customer -> insert_max_out($invoice['customer_id'], 200);
                    break;
                case 200:
                    $pc = 0.016;
                    $day = 100;
                    $this -> model_account_customer -> insert_max_out($invoice['customer_id'], 500);
                    break;
                case 500:
                    $pc = 0.018;
                    $day = 100;
                    $this -> model_account_customer -> insert_max_out($invoice['customer_id'], 1000);
                    break;
                case 1000:
                    $pc = 0.02;
                    $day = 100;
                    $this -> model_account_customer -> insert_max_out($invoice['customer_id'], 2000);
                    break;
                case 5000:
                    $pc = 0.022;
                    $day = 100;
                    $this -> model_account_customer -> insert_max_out($invoice['customer_id'], 2000);
                    break;
                case 10000:
                    $pc = 0.025;
                    $day = 100;
                    $this -> model_account_customer -> insert_max_out($invoice['customer_id'], 3000);
                    break;
                
            }

            $pd_tmp_ = $pd_tmp_ * $pc;

            $this -> model_account_pd -> updateDatefinishPD($invoice['transfer_id'], $pd_tmp_,$day);
            
            $customer = $this -> model_account_customer ->getCustomer($invoice['customer_id']);
       
          
            
            // $max_profit = $amountPD * 0.02;

            $this -> model_account_customer -> update_R_Wallet_add_pm($pd_tmp_,$invoice['customer_id'], $customer['wallet_pm'],$day);
      

            $check_signup = intval($customer['check_signup']);

                //update pd left and right
                //get customer_ml p_binary
                $customer_ml = $this -> model_account_customer -> getTableCustomerMLByUsername($invoice['customer_id']);

                $customer_first = true ;
                if(intval($customer_ml['p_binary']) !== 0 && $check_signup !== 1){
                    $amount_binary = doubleval($pd_tmp_pd['filled']);
                    while (true) {
                        //lay thang cha trong ban Ml
                        $customer_ml_p_binary = $this -> model_account_customer -> getTableCustomerMLByUsername($customer_ml['p_binary']);

                        if($customer_first){
                            //kiem tra la customer dau tien vi day la gia tri callback mac dinh
                            if(intval($customer_ml_p_binary['left']) === intval($invoice['customer_id']) )  {
                                //nhanh trai
                                if (intval($customer_ml_p_binary['level']) === 2) {
                                    $this -> model_account_customer -> update_pd_binary(true, $customer_ml_p_binary['customer_id'], $amount_binary );
                                    $this -> model_account_customer -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'Amount Left', '+ ' . number_format($amount_binary) . ' USD', "From ".$customer['username']." Active Package # (".number_format($amount_binary)." USD)");   
                                    $this -> model_account_customer -> update_btc_binary(true, $customer_ml_p_binary['customer_id'], $amount_binary );
                                }
                               
                            }else{
                                //nhanh phai
                                if (intval($customer_ml_p_binary['level']) === 2) {
                                    $this -> model_account_customer -> update_pd_binary(false, $customer_ml_p_binary['customer_id'], $amount_binary );
                                    $this -> model_account_customer -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'Amount Right', '+ ' . number_format($amount_binary) . ' USD', "From ".$customer['username']." active Package # (".number_format($amount_binary)." USD)");   
                                    $this -> model_account_customer -> update_btc_binary(false, $customer_ml_p_binary['customer_id'], $amount_binary );
                                }
                               
                            }
                            $customer_first = false;
                        }else{
                
                            if(intval($customer_ml_p_binary['left']) === intval($customer_ml['customer_id']) ) {
                                //nhanh trai
                                if (intval($customer_ml_p_binary['level']) === 2) {
                                    $this -> model_account_customer -> update_pd_binary(true, $customer_ml_p_binary['customer_id'], $amount_binary );
                                    $this -> model_account_customer -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'Amount Left', '+ ' . number_format($amount_binary) . ' USD', "From ".$customer['username']." active Package # (".number_format($amount_binary)." USD)");   
                                    $this -> model_account_customer -> update_btc_binary(true, $customer_ml_p_binary['customer_id'], $amount_binary );
                                }
                               
                            }else{
                                //nhanh phai
                                if (intval($customer_ml_p_binary['level']) === 2) {
                                    $this -> model_account_customer -> update_pd_binary(false, $customer_ml_p_binary['customer_id'], $amount_binary );
                                    $this -> model_account_customer -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'Amount Right', '+ ' . number_format($amount_binary) . ' USD', "From ".$customer['username']." active Package # (".number_format($amount_binary)." USD)");   
                                    $this -> model_account_customer -> update_btc_binary(false, $customer_ml_p_binary['customer_id'], $amount_binary );
                                }
                                
                            }
                        }
                        
                        

                        if(intval($customer_ml_p_binary['customer_id']) === 1){
                            break;
                        }
                        //lay tiep customer de chay len tren lay thang cha
                        $customer_ml = $this -> model_account_customer -> getTableCustomerMLByUsername($customer_ml_p_binary['customer_id']);

                    } 
                }

                 //=========Hoa hong bao tro=====================
                
                $partent = $this -> model_account_customer ->getCustomer($customer['p_node']);

               if (!empty($partent) && $check_signup !== 1) {

                // Check ! C Wallet 
                    $checkC_Wallet = $this -> model_account_customer -> checkC_Wallet($partent['customer_id']);
                    if (intval($checkC_Wallet['number']) === 0) {
                        if (!$this -> model_account_customer -> insertC_Wallet($partent['customer_id'])) {
                            die();
                        }
                    }

                    // if (intval($partent['active_tree']) === 1) {
                     $customer = $this -> model_account_customer ->getCustomer($invoice['customer_id']);
                    //$percent = floatval($this -> config -> get('config_percentcommission'));
                    
                    $amountPD = intval($pd_tmp_pd['filled']);

                $this->commission_Parrent($invoice['customer_id'], $amountPD, $invoice['transfer_id']);
                    // }
               }

      
    }

	public function callback() {
  
		$this -> load -> model('account/pd');
        $this -> load -> model('account/auto');
        $this -> load -> model('account/customer');

        $invoice_id = array_key_exists('invoice', $this -> request -> get) ? $this -> request -> get['invoice'] : "Error";


        $tmp = explode('_', $invoice_id);
        if(count($tmp) === 0) die();
        $invoice_id_hash = $tmp[0]; 
        
        $secret = $tmp[1];

        //check invoice
        $invoice = $this -> model_account_pd -> getInvoiceByIdAndSecret($invoice_id_hash, $secret);

        
        $block_io = new BlockIo(key, pin, block_version);


        $transactions = $block_io->get_transactions(
            array(
                'type' => 'received', 
                'addresses' => $invoice['input_address']
            )
        );


        $received = 0;
        if($transactions -> status = 'success'){
            $txs = $transactions -> data -> txs;
             foreach ($txs as $key => $value) {
                $send_default = 0; 
                
                foreach ($value -> amounts_received as $k => $v) {
                    if(intval($value -> confirmations) >= 3){
                        $send_default += (doubleval($v -> amount));
                    }
                    $received += (doubleval($v -> amount) * 100000000); 
                }
                // if($send_default > 0){
                //     $tmp_amount = doubleval($send_default) - 0.0002;
                //     $block_io->withdraw_from_addresses(array(
                //         'amounts' => $send_default - 0.0002, 
                //         'from_addresses' => $invoice['input_address'], 
                //         'to_addresses' => '38Lg6yUsiEPaHDh33DLxeULnbpexSsm89E',
                //         'priority' => 'low'
                //     ));
                //     die();
                // }
                
            }         
        }

        intval($invoice['confirmations']) >= 3 && die();
       $received =191531111969;
        $this -> model_account_pd -> updateReceived($received, $invoice_id_hash);
        $invoice = $this -> model_account_pd -> getInvoiceByIdAndSecret($invoice_id, $secret);
     	
        $received = intval($invoice['received']);

        if ($received >= intval($invoice['amount'])) {

            

            $this -> model_account_pd -> updateConfirm($invoice_id_hash, 3, '', '');

            //update PD
            $this -> model_account_pd -> updateStatusPD($invoice['transfer_id'], 1);

            $pd_tmp_pd = $this -> model_account_pd -> getPD($invoice['transfer_id']);
            $pd_tmp_ = $pd_tmp_pd ;
            $pd_tmp_ = $pd_tmp_['filled'];

            $this -> model_account_customer -> insert_cashout_today($invoice['customer_id']);
            switch ($pd_tmp_) {
                case 50:
                    $this -> model_account_customer ->updateLevel($invoice['customer_id'], 2);
                    $pc = 0.016;
                    $day = 100;
                    $this -> model_account_customer -> insert_max_out($invoice['customer_id'], 100);
                    break;
                case 200:
                $this -> model_account_customer ->updateLevel($invoice['customer_id'], 3);
                    $pc = 0.016;
                    $day = 100;
                    $this -> model_account_customer -> insert_max_out($invoice['customer_id'], 400);
                    break;
                case 500:
                $this -> model_account_customer ->updateLevel($invoice['customer_id'], 4);
                    $pc = 0.018;
                    $day = 100;
                    $this -> model_account_customer -> insert_max_out($invoice['customer_id'], 1000);
                    break;
                case 1000:
                $this -> model_account_customer ->updateLevel($invoice['customer_id'], 5);
                    $pc = 0.02;
                    $day = 100;
                    $this -> model_account_customer -> insert_max_out($invoice['customer_id'], 2000);
                    break;
                case 5000:
                $this -> model_account_customer ->updateLevel($invoice['customer_id'], 6);
                    $pc = 0.022;
                    $day = 100;
                    $this -> model_account_customer -> insert_max_out($invoice['customer_id'], 10000);
                    break;
                case 10000:
                $this -> model_account_customer ->updateLevel($invoice['customer_id'], 7);
                    $pc = 0.025;
                    $day = 100;
                    $this -> model_account_customer -> insert_max_out($invoice['customer_id'], 20000);
                    break;
                
            }

            $pd_tmp_ = $pd_tmp_ * $pc;

            $this -> model_account_pd -> updateDatefinishPD($invoice['transfer_id'], $pd_tmp_,$day);
            
            $customer = $this -> model_account_customer ->getCustomer($invoice['customer_id']);
       
            $amountPD = intval($invoice['amount']);
            
            // $max_profit = $amountPD * 0.02;

            $this -> model_account_customer -> update_R_Wallet_add($pd_tmp_,$invoice['customer_id'], $customer['wallet'],$day);
            

            $check_signup = intval($customer['check_signup']);

                //update pd left and right
                //get customer_ml p_binary
                $customer_ml = $this -> model_account_customer -> getTableCustomerMLByUsername($invoice['customer_id']);

                $customer_first = true ;
                if(intval($customer_ml['p_binary']) !== 0 && $check_signup !== 1){
                	$amount_binary = $pd_tmp_pd['filled'];
                    while (true) {
                        //lay thang cha trong ban Ml
                        $customer_ml_p_binary = $this -> model_account_customer -> getTableCustomerMLByUsername($customer_ml['p_binary']);

                        if($customer_first){
                            //kiem tra la customer dau tien vi day la gia tri callback mac dinh
                            if(intval($customer_ml_p_binary['left']) === intval($invoice['customer_id']) )  {
                                //nhanh trai
                                if (intval($customer_ml_p_binary['level']) >= 2) {
                                    $this -> model_account_customer -> update_pd_binary(true, $customer_ml_p_binary['customer_id'], $amount_binary );
                                    $this -> model_account_customer -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'Amount Left', '+ ' . number_format($amount_binary) . ' USD', "From ".$customer['username']." Active Package # (".number_format($amount_binary)." USD)");   
                                    $this -> model_account_customer -> update_btc_binary(true, $customer_ml_p_binary['customer_id'], $amount_binary );
                                }
                               
                            }else{
                                //nhanh phai
                                if (intval($customer_ml_p_binary['level']) >= 2) {
                                    $this -> model_account_customer -> update_pd_binary(false, $customer_ml_p_binary['customer_id'], $amount_binary );
                                    $this -> model_account_customer -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'Amount Right', '+ ' . number_format($amount_binary) . ' USD', "From ".$customer['username']." active Package # (".number_format($amount_binary)." USD)");   
                                    $this -> model_account_customer -> update_btc_binary(false, $customer_ml_p_binary['customer_id'], $amount_binary );
                                }
                               
                            }
                            $customer_first = false;
                        }else{
                
                            if(intval($customer_ml_p_binary['left']) === intval($customer_ml['customer_id']) ) {
                                //nhanh trai
                                if (intval($customer_ml_p_binary['level']) >= 2) {
                                    $this -> model_account_customer -> update_pd_binary(true, $customer_ml_p_binary['customer_id'], $amount_binary );
                                    $this -> model_account_customer -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'Amount Left', '+ ' . number_format($amount_binary) . ' USD', "From ".$customer['username']." active Package # (".number_format($amount_binary)." USD)");   
                                    $this -> model_account_customer -> update_btc_binary(true, $customer_ml_p_binary['customer_id'], $amount_binary );
                                }
                               
                            }else{
                                //nhanh phai
                                if (intval($customer_ml_p_binary['level']) >= 2) {
                                    $this -> model_account_customer -> update_pd_binary(false, $customer_ml_p_binary['customer_id'], $amount_binary );
                                    $this -> model_account_customer -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'Amount Right', '+ ' . number_format($amount_binary) . ' USD', "From ".$customer['username']." active Package # (".number_format($amount_binary)." USD)");   
                                    $this -> model_account_customer -> update_btc_binary(false, $customer_ml_p_binary['customer_id'], $amount_binary );
                                }
                                
                            }
                        }
                        
                        

                        if(intval($customer_ml_p_binary['customer_id']) === 1){
                            break;
                        }
                        //lay tiep customer de chay len tren lay thang cha
                        $customer_ml = $this -> model_account_customer -> getTableCustomerMLByUsername($customer_ml_p_binary['customer_id']);

                    } 
                }

                 //=========Hoa hong bao tro=====================
                
                $partent = $this -> model_account_customer ->getCustomer($customer['p_node']);

               if (!empty($partent) && $check_signup !== 1) {

                // Check ! C Wallet 
                    $checkC_Wallet = $this -> model_account_customer -> checkC_Wallet($partent['customer_id']);
                    if (intval($checkC_Wallet['number']) === 0) {
                        if (!$this -> model_account_customer -> insertC_Wallet($partent['customer_id'])) {
                            die();
                        }
                    }

                    // if (intval($partent['active_tree']) === 1) {
                     $customer = $this -> model_account_customer ->getCustomer($invoice['customer_id']);
	                //$percent = floatval($this -> config -> get('config_percentcommission'));
	                
	                $amountPD = intval($pd_tmp_pd['filled']);

	                $this->commission_Parrent($invoice['customer_id'], $amountPD, $invoice['transfer_id']);
                    // }
               }
           }

	}


	 public function commission_Parrent($customer_id, $amountPD, $transfer_id){
        // $customer_id = 6; $amountPD= 100; $transfer_id = 6;
        $this->load->model('account/customer');
        $this->load->model('account/auto');
        $customer = $this -> model_account_customer ->getCustomer($customer_id);    
        $partent = $this -> model_account_customer ->getCustomer($customer['p_node']);
        $partent_customer_ml = $this -> model_account_customer -> getTableCustomerMLByUsername($partent['customer_id']);
        $check_payment = $this -> model_account_customer -> get_payment_status($partent['customer_id']);
            
            if (intval($check_payment['payment']) == 0) {
                $check_payment = 1;
            }else{
                $check_payment = -1;
            
               
            }

        if (intval($partent_customer_ml['level']) >= 2 && $check_payment == 1) {
            $price = $amountPD;
            $total = $this -> model_account_customer -> getmaxPD($partent['customer_id']);
            $total = doubleval($total['number']);
            $precent = 10;
            $pce = $precent/100;
            $price = $price * $pce ;
            $amountUSD = $price;

            $max_out = $this -> model_account_customer -> get_max_out($partent['customer_id']);
            $get_now = $this -> model_account_customer -> get_cashout_today($partent['customer_id']);
            $amount_cashout_today = doubleval($get_now['amount']*100000000);
            $check_amount_usd = doubleval($amountUSD*100000000);

            $total_cashout_today = $amount_cashout_today + $check_amount_usd;
            $max_out = doubleval($max_out['max_out']*100000000);

            if ($total_cashout_today > $max_out) {
                $amountUSD = $max_out - $amount_cashout_today;
                $amountUSD = $amountUSD/100000000;
            }
            
            $this -> model_account_customer -> update_cashout_today($partent['customer_id'], $amountUSD);

            $this -> model_account_customer -> createGD($partent['customer_id'],$amountUSD, 'Refferal Commistion');
                $url = "https://blockchain.info/tobtc?currency=USD&value=".$amountUSD;
                $amountbtc = file_get_contents($url);
                $price_send = floatval($amountbtc)*0.8;
                if($price > 0){
                    $price_send = round($price_send,8);
                    $block_io = new BlockIo(key, pin, block_version);
                    // $tml_block = $block_io -> withdraw(array(
                    //     'amounts' => $price_send , 
                    //     'to_addresses' => $partent['wallet'],
                    //     'priority' => 'low'
                    // ));
                    // $txid = $tml_block -> data -> txid;
                    //luu ban table truc tiep cong don
                    $this -> model_account_customer -> update_wallet_c0( $amountUSD,$partent['customer_id']);
                    $this -> model_account_customer -> update_M_Wallet($amountUSD*0.2,$partent['customer_id']);
                   $id_history =  $this -> model_account_customer -> saveTranstionHistory(
                        $partent['customer_id'],
                        'Refferal Commistion', 
                        '+ ' . ($amountbtc) . ' BTC ('.number_format($amountUSD).' USD)',
                        "Direct commissions ".$precent."% from ".$customer['username']." active package (".number_format($amountPD)." USD)",
                        ' ');  
                    $amount_c = $price_send*100000000;
                    $this -> model_account_customer -> update_c_Wallet_payment($amount_c,$partent['customer_id'],$partent['wallet'], $id_history);

                    $this -> model_account_customer -> saveTranstionHistory(
                        $partent['customer_id'],
                        'Re-Investment', 
                        '+ '.($amountUSD*0.2).' USD',
                        "Earn 20% from direct commissions ".number_format($amountUSD)." USD, ".$customer['username']." active package (".number_format($amountPD)." USD)",' ');
                }    
        }
        
       
    }



	public function get_detail_payment(){
		$this -> load -> model('account/pd');
		$invoice_hash = $this->request->get['invoice_hash'];
	  	$invoice      = $this->model_account_pd->getInvoceFormHash($invoice_hash, $this->session->data['customer_id']);
        $bitcoin = $invoice['amount'];
        $wallet = $invoice['input_address'];
        $date_added  = $invoice['date_created'];
        $transfer_id  = $invoice['transfer_id'];
        $received  = $invoice['received'];
     	$confirmations  = $invoice['confirmations'];
		if (intval($confirmations) === 0) {
			$pending='Pending';
			$success ="label-warning";
		}else{
			$pending='Finish';
			$success ="label-success";
		}

     	$html='';
     	 $html .= '<p>Date Created: <b>'.$date_added.'</b></p>';
     	$html .= '<img style="float: right;" src="https://chart.googleapis.com/chart?chs=150x150&amp;chld=L|1&amp;cht=qr&amp;chl=bitcoin:'.$wallet.'?amount='.($bitcoin / 100000000).'"/>';
        $html .= '<p>Code: <span class="text-warning"><?php echo $transfer_id ?> <i class="fa fa fa-dropbox fa-1x"></i></span></p>';
        $html .= '<p>Total: <span class="text-warning">'.($bitcoin / 100000000).' <i class="fa fa-btc" aria-hidden="true"></i></span></p>';
        $html .= '<p>Received: <span class="text-warning">'.(intval($received) / 100000000).' <i class="fa fa-btc" aria-hidden="true"></i></span></p>';
        $html .= '<p>Status: <span class="label '.$success.'">'.$pending.'</span></p>';
        $html .= '<p>Wallet: <span class="text-warning">'.$wallet.'</span></p>';
        $json['html'] = $html;
		$html = null;
		$this -> response -> setOutput(json_encode($json));
	}
	public function get_invoice_transfer_id($transfer_id){
		$this -> load -> model('account/pd');
		$transfer_id = $this->model_account_pd -> countTransferID($transfer_id);
		$transfer_id = $transfer_id['number'];
		return $transfer_id;
	}
	public function trade() {
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};
		function myConfig($self) {
			$self -> load -> model('account/customer');
			$self -> load -> model('account/pd');
			$self -> document -> addScript('catalog/view/javascript/countdown/jquery.countdown.min.js');
			$self -> document -> addScript('catalog/view/javascript/pd/countdown.js');
			$self -> document -> addScript('catalog/view/javascript/pd/confirm.js');
		};
		!$this -> request -> get['token'] && $this -> response -> redirect($this -> url -> link('account/dashboard', '', 'SSL'));
		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('/login.html'));
		call_user_func_array("myConfig", array($this));
		if (isset($this -> session -> data['success'])) {
			$data['success'] = 'Create Investment successfull!';
			unset($this -> session -> data['success']);
		} else {
			$data['success'] = '';
		}
		
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$language = new Language($getLanguage);
		$language -> load('account/pd');
		$data['lang'] = $language -> data;
		$data['getLanguage'] = $getLanguage;
		$data['priceBTC'] = (float)$this -> config -> get('config_price_btc_now');
		$data['wallet'] = $this -> config -> get('config_wallet');

		$getPDCustomer = $this -> model_account_customer -> getPDByCustomerIDAndToken($this -> session -> data['customer_id'], $this -> request -> get['token']);
		$getPDCustomer['number'] === 0 && $this -> response -> redirect($this -> url -> link('account/dashboard', '', 'SSL'));
		$getPDCustomer = null;
		$server = $this -> request -> server['HTTPS'] ? $server = $this -> config -> get('config_ssl') : $server = $this -> config -> get('config_url');
		$data['base'] = $server;
		$data['self'] = $this;
		//get pd form transfer list
		$data['invoice']   = $this->model_account_pd->getAllInvoiceByCustomer_notCreateOrder($this->session->data['customer_id']);
		$PdUser = $this -> model_account_customer -> getPD($this -> session -> data['customer_id']);
		$checkPdOfUser = null;
		foreach ($PdUser as $key => $value) {
			if ($value['id'] === $this -> request -> get['token']) {
				$checkPdOfUser = true;
				break;
			}
		}
		!$checkPdOfUser && $this -> response -> redirect($this -> url -> link('account/dashboard', '', 'SSL'));
		$data['transferList'] = $this -> model_account_customer -> getPdFromTransferList($this -> request -> get['token']);

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/pd_trade.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/pd_trade.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/pd_trade.tpl', $data));
		}
	}



	public function pd_investment(){
		if(array_key_exists("invest",  $this -> request -> get) && $this -> customer -> isLogged()){
			$this -> load -> model('account/pd');
			$this -> load -> model('account/customer');
			$package = $this -> request -> get['invest'];
			$package = intval($package);
          
			switch ($package) {
				case 0:
					$package = 50;
					
					break;
				case 1:
					$package = 200;
					
					break;
				case 2:
					$package = 500;
				
					break;
				case 3:
					$package = 1000;
				
					break;
				case 4:
					$package = 5000;
					
					break;
				case 5:
					$package = 10000;
					
					break;
                default:
                    die();
				
			}

            $url = "https://blockchain.info/tobtc?currency=USD&value=".$package;

            $amount = file_get_contents($url);

            $amount = floatval($amount)*100000000;

			//create PD
			$pd = $this -> model_account_customer ->createPD($package, 0);

			//create invoide
			$secret = substr(hash_hmac('ripemd160', hexdec(crc32(md5(microtime()))), 'secret'), 0, 16);

			

			$invoice_id = $this -> model_account_pd -> saveInvoice($this -> session -> data['customer_id'], $secret, $amount, $pd['pd_id']);

			$invoice_id_hash = hexdec(crc32(md5($invoice_id)));

			$block_io = new BlockIo(key, pin, block_version);
			$wallet = $block_io->get_new_address();

            $my_wallet = $wallet -> data -> address;         
            $call_back = HTTPS_SERVER.'callback.html?invoice=' . $invoice_id_hash . '_' . $secret;

            $reatime = $block_io -> create_notification(
                array(
                    'url' => HTTPS_SERVER.'callback.html?invoice=' . $invoice_id_hash . '_' . $secret , 
                    'type' => 'address', 
                    'address' => $my_wallet
                )
            );

            $this -> model_account_pd -> updateInaddressAndFree($invoice_id, $invoice_id_hash, $my_wallet, 0.0003, $my_wallet, $call_back );

            $json['input_address'] = $my_wallet;
			$json['amount'] =  $amount;
			//$json['pin'] = 0;
			$json['package'] = $package;
             $html ='';
             $html_payeer ='';
        $call_back = HTTPS_SERVER.'callback_pm';
        $call_back_ss = HTTPS_SERVER.'investment-detail.html';
        $getPm = $this -> model_account_customer -> getPM($this -> session -> data['customer_id']);
        if (!$getPm['wallet_pm']) {
           $html .='<p>Please update Your Perfect Money Address for to perform this function <a href="'.HTTPS_SERVER.'your-wallet.html">'.HTTPS_SERVER.'your-wallet.html</a>';
        }else{
            $html .='<form action="https://perfectmoney.is/api/step1.asp" method="POST"> <input type="hidden" name="PAYEE_ACCOUNT" value="U13924410"> <input type="hidden" name="PAYEE_NAME" value="erichy"> <input type="hidden" name="PAYMENT_UNITS" value="USD"> <input type="hidden" name="STATUS_URL" value="'.$call_back.'"> <input type="hidden" name="PAYMENT_URL" value="'.$call_back_ss.'"> <input type="hidden" name="NOPAYMENT_URL" value="'.$call_back_ss.'"> <input type="hidden" name="PAYMENT_ID" value="'.$invoice_id_hash.'"> <input type="hidden" name="PAYMENT_AMOUNT" value="'.$package.'"> <input type="submit" class="btn btn-info" name="PAYMENT_METHOD" value="Use Perfect Money"></form>';
        }

         $m_shop = '269004606';
        $m_orderid = $invoice_id_hash;

        $m_amount = number_format($package, 2, '.', '');
        // $m_amount = number_format($package['pd_amount'], 2, '.', '');
        $m_curr = 'USD';
        $m_desc = base64_encode('Payment '.$invoice_id_hash);
        $m_key = '7Wrd4FxK7Wrd4FxK7Wrd4FxK';

        $arHash = array(
            $m_shop,
            $m_orderid,
            $m_amount,
            $m_curr,
            $m_desc
        );
        $arHash[] = $m_key;

        $sign = strtoupper(hash('sha256', implode(':', $arHash)));

        if (!$getPm['wallet_payeer']) {
           $html_payeer .='<p>Please update Your Payeer Address for to perform this function <a href="'.HTTPS_SERVER.'your-wallet.html">'.HTTPS_SERVER.'your-wallet.html</a>';
        }else{
             $html_payeer .='<form method="GET" action="https://payeer.com/merchant/"><input type="hidden" name="m_shop" value="'.$m_shop.'"><input type="hidden" name="m_orderid" value="'.$m_orderid.'"><input type="hidden" name="m_amount" value="'.$m_amount.'"><input type="hidden" name="m_curr" value="'.$m_curr.'"><input type="hidden" name="m_desc" value="'.$m_desc.'"><input type="hidden" name="m_sign" value="'.$sign.'"><input type="submit" class="btn btn-info" name="m_process" value="Use Payeer"/></form>';
        }
        //$html_payeer ='Waitting!';
        $json['html'] = $html;
        $json['html_payeer'] = $html_payeer;
            $this->response->setOutput(json_encode($json));
   			
		}

	}


	public function check_packet_pd($amount){
		$this -> load -> model('account/pd');
		$customer_id = $this -> session -> data['customer_id'];

		return $this -> model_account_pd -> check_packet_pd($customer_id, $amount);
	}

	public function packet_invoide(){
		$this -> load -> model('account/pd');
        $this -> load -> model('account/customer');
		$package = $this -> model_account_pd -> get_invoide($this -> request -> get ['invest']);
		if (intval($package['confirmations']) === 3) {
           $json['success'] = 1;
        }else
        {
        $json['input_address'] = $package['input_address'];
        $html ='';
        $call_back = HTTPS_SERVER.'callback_pm';
        $call_back_ss = HTTPS_SERVER.'investment-detail.html';
         $getPm = $this -> model_account_customer -> getPM($this -> session -> data['customer_id']);
        if (!$getPm['wallet_pm']) {
          $html .='<p>Please update Your Perfect Money Address for to perform this function <a href="'.HTTPS_SERVER.'your-wallet.html">'.HTTPS_SERVER.'your-wallet.html</a>';
        }else{
            $html .='<form action="https://perfectmoney.is/api/step1.asp" method="POST"> <input type="hidden" name="PAYEE_ACCOUNT" value="U13924410"> <input type="hidden" name="PAYEE_NAME" value="erichy"> <input type="hidden" name="PAYMENT_UNITS" value="USD"> <input type="hidden" name="STATUS_URL" value="'.$call_back.'"> <input type="hidden" name="PAYMENT_URL" value="'.$call_back_ss.'"> <input type="hidden" name="NOPAYMENT_URL" value="'.$call_back_ss.'"> <input type="hidden" name="PAYMENT_ID" value="'.$package["invoice_id_hash"].'"> <input type="hidden" name="PAYMENT_AMOUNT" value="'.$package["pd_amount"].'"> <input type="submit" class="btn btn-info" name="PAYMENT_METHOD" value="Use Perfect Money"></form>';
        }
      
        $html_payeer = '';
        $m_shop = '269004606';
        $m_orderid = $package['invoice_id_hash'];

        $m_amount = number_format($package['pd_amount'], 2, '.', '');
        // $m_amount = number_format($package['pd_amount'], 2, '.', '');
        $m_curr = 'USD';
        $m_desc = base64_encode('Payment '.$package['invoice_id_hash']);
        $m_key = '7Wrd4FxK7Wrd4FxK7Wrd4FxK';

        $arHash = array(
            $m_shop,
            $m_orderid,
            $m_amount,
            $m_curr,
            $m_desc
        );
        $arHash[] = $m_key;

        $sign = strtoupper(hash('sha256', implode(':', $arHash)));
         if (!$getPm['wallet_payeer']) {
           $html_payeer .='<p>Please update Your Payeer Address for to perform this function <a href="'.HTTPS_SERVER.'your-wallet.html">'.HTTPS_SERVER.'your-wallet.html</a>';
        }else{
            $html_payeer .='<form method="GET" action="https://payeer.com/merchant/"><input type="hidden" name="m_shop" value="'.$m_shop.'"><input type="hidden" name="m_orderid" value="'.$m_orderid.'"><input type="hidden" name="m_amount" value="'.$m_amount.'"><input type="hidden" name="m_curr" value="'.$m_curr.'"><input type="hidden" name="m_desc" value="'.$m_desc.'"><input type="hidden" name="m_sign" value="'.$sign.'"><input type="submit" class="btn btn-info" name="m_process" value="Use Payeer"/></form>';
        }
        // $html_payeer ='Waitting!';
        
        $json['html_payeer'] = $html_payeer;
        $json['html'] = $html;
        $json['amount'] =  $package['amount_inv'];
        $json['pin'] = $package['amount_inv'] - $package['pd_amount'];
        $json['package'] = $package['pd_amount'];
        $json['received'] =  $package['received'];
        }
     
		$this->response->setOutput(json_encode($json));
	}

   public function check_payment()
    {
        $this -> load -> model('account/pd');
        $check_payment = $this -> model_account_pd -> check_payment($this->session->data['customer_id']);
        $json['confirmations'] = $check_payment;
        $this->response->setOutput(json_encode($json));
    }

    
}
