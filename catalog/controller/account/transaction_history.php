<?php
class ControllerAccountTransactionHistory extends Controller {
	public function index() {

		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> load -> model('account/customer');

		};
		
		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('/login.html'));
		call_user_func_array("myConfig", array($this));

		if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }
		$data['base'] = $server;
        $data['self'] = $this;
        $this -> load -> language('account/personal');
		$this -> load -> model('account/customer');
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$data['language']= $getLanguage;
		$language = new Language($getLanguage);
		$language -> load('account/transaction');

		$data['lang'] = $language -> data;


        $page = isset($this -> request -> get['p']) ? $this -> request -> get['p'] : 1;

		$limit = 10;
		$start = ($page - 1) * 10;

		$ts_history = $this -> model_account_customer -> getTotalHistory($this -> session -> data['customer_id']);

		$ts_history = $ts_history['number'];

		$pagination = new Pagination();
		$pagination -> total = $ts_history;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = HTTPS_SERVER . 'transaction-history&p={page}';
		$data['histotys'] = $this -> model_account_customer -> getTransctionHistory($this -> session -> data['customer_id'], $limit, $start);

		$data['pagination'] = $pagination -> render();


        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/transaction_history.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/transaction_history.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/transaction_history.tpl', $data));
        }
	}
	public function binary() {

		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> load -> model('account/customer');

		};
		
		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('/login.html'));
		call_user_func_array("myConfig", array($this));

		if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }
		$data['base'] = $server;
        $data['self'] = $this;
        $this -> load -> language('account/personal');
		$this -> load -> model('account/customer');
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$data['language']= $getLanguage;
		$language = new Language($getLanguage);
		$language -> load('account/transaction');

		$data['lang'] = $language -> data;


        $page = isset($this -> request -> get['p']) ? $this -> request -> get['p'] : 1;

		$limit = 10;
		$start = ($page - 1) * 10;

		$ts_history = $this -> model_account_customer -> getTotalHistory_binary($this -> session -> data['customer_id']);

		$ts_history = $ts_history['number'];
		
		$pagination = new Pagination();
		$pagination -> total = $ts_history;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = HTTPS_SERVER . 'binary-profit.html&p={page}';
		$data['histotys'] = $this -> model_account_customer -> getTransctionHistory_binary($this -> session -> data['customer_id'], $limit, $start);

		$data['pagination'] = $pagination -> render();

		/////////////////////
		$paged = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;

		$limit = 10;
		$start = ($paged - 1) * 10;

		$ts_history = $this -> model_account_customer -> getTotalHistory_binary_new($this -> session -> data['customer_id']);

		$ts_history = $ts_history['number'];
		
		$pagination = new Pagination();
		$pagination -> total = $ts_history;
		$pagination -> page = $paged;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = HTTPS_SERVER . 'binary-profit.html&page={page}';
		$data['getTransctionHistory_binary_new'] = $this -> model_account_customer -> getTransctionHistory_binary_new($this -> session -> data['customer_id'], $limit, $start);

		$data['pagination_new'] = $pagination -> render();

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/transaction_history_binary.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/transaction_history_binary.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/transaction_history_binary.tpl', $data));
        }
	}
	public function reffernal() {

		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> load -> model('account/customer');

		};
		
		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('/login.html'));
		call_user_func_array("myConfig", array($this));

		if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }
		$data['base'] = $server;
        $data['self'] = $this;
        $this -> load -> language('account/personal');
		$this -> load -> model('account/customer');
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$data['language']= $getLanguage;
		$language = new Language($getLanguage);
		$language -> load('account/transaction');

		$data['lang'] = $language -> data;


        $page = isset($this -> request -> get['p']) ? $this -> request -> get['p'] : 1;

		$limit = 10;
		$start = ($page - 1) * 10;

		$ts_history = $this -> model_account_customer -> getTotalHistory_reffernal($this -> session -> data['customer_id']);

		$ts_history = $ts_history['number'];

		$pagination = new Pagination();
		$pagination -> total = $ts_history;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = HTTPS_SERVER . 'refferal-profit.html&p={page}';
		$data['histotys'] = $this -> model_account_customer -> getTransctionHistory_reffernal($this -> session -> data['customer_id'], $limit, $start);

		$data['pagination'] = $pagination -> render();


        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/transaction_history_reffernal.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/transaction_history_reffernal.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/transaction_history_reffernal.tpl', $data));
        }
	}
	public function re_investment() {

		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> load -> model('account/customer');

		};
		
		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('/login.html'));
		call_user_func_array("myConfig", array($this));

		if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }
		$data['base'] = $server;
        $data['self'] = $this;
        $this -> load -> language('account/personal');
		$this -> load -> model('account/customer');
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$data['language']= $getLanguage;
		$language = new Language($getLanguage);
		$language -> load('account/transaction');

		$data['lang'] = $language -> data;


        $page = isset($this -> request -> get['p']) ? $this -> request -> get['p'] : 1;

		$limit = 10;
		$start = ($page - 1) * 10;

		$ts_history = $this -> model_account_customer -> getTotalHistory_reinvestment($this -> session -> data['customer_id']);

		$ts_history = $ts_history['number'];

		$pagination = new Pagination();
		$pagination -> total = $ts_history;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = HTTPS_SERVER . 'refferal-profit.html&p={page}';
		$data['histotys'] = $this -> model_account_customer -> getTransctionHistory_reinvestment($this -> session -> data['customer_id'], $limit, $start);

		$data['pagination'] = $pagination -> render();


        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/transaction_history_reinvestment.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/transaction_history_reinvestment.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/transaction_history_reinvestment.tpl', $data));
        }
	}
	public function floor() {

		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> load -> model('account/customer');

		};
		
		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('/login.html'));
		call_user_func_array("myConfig", array($this));

		if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }
		$data['base'] = $server;
        $data['self'] = $this;
        $this -> load -> language('account/personal');
		$this -> load -> model('account/customer');
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$data['language']= $getLanguage;
		$language = new Language($getLanguage);
		$language -> load('account/transaction');

		$data['lang'] = $language -> data;


        $page = isset($this -> request -> get['p']) ? $this -> request -> get['p'] : 1;

		$limit = 10;
		$start = ($page - 1) * 10;

		$ts_history = $this -> model_account_customer -> getTotalHistory($this -> session -> data['customer_id']);

		$ts_history = $ts_history['number'];

		$pagination = new Pagination();
		$pagination -> total = $ts_history;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = HTTPS_SERVER . 'transaction-history&p={page}';
		$data['histotys'] = $this -> model_account_customer -> getTransctionHistory($this -> session -> data['customer_id'], $limit, $start);

		$data['pagination'] = $pagination -> render();


        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/transaction_history_floor.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/transaction_history_floor.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/transaction_history_floor.tpl', $data));
        }
	}
}