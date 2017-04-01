<?php 
class ControllerPaymentPerfectMoney extends Controller {
	private $error = array(); 

	public function index() {
		$this->language->load('payment/perfectmoney');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('perfectmoney', $this->request->post);				
			
			$this->session->data['success'] = $this->language->get('text_success');

			//**$this->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL')); DEPRECATED
			$this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}

		//$this->data IS DEPRECATED
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		
		$data['entry_merchant'] = $this->language->get('entry_merchant');
		$data['entry_signature'] = $this->language->get('entry_signature');
		$data['entry_total'] = $this->language->get('entry_total');	
		$data['entry_order_status'] = $this->language->get('entry_order_status');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		//**Help tooltips
		$data['help_merchant'] = $this->language->get('help_merchant');
		$data['help_signature'] = $this->language->get('help_signature');
		$data['help_total'] = $this->language->get('help_total');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['merchant'])) { 
			$data['error_merchant'] = $this->error['merchant'];
		} else {
			$data['error_merchant'] = '';
		}
		
		if (isset($this->error['signature'])) { 
			$data['error_signature'] = $this->error['signature'];
		} else {
			$data['error_signature'] = '';
		}
		
		if (isset($this->error['type'])) { 
			$data['error_type'] = $this->error['type'];
		} else {
			$data['error_type'] = '';
		}

		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_payment'),
			'href'      => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('payment/perfectmoney', 'token=' . $this->session->data['token'], 'SSL'),      		
      		'separator' => ' :: '
   		);
				
		$data['action'] = $this->url->link('payment/perfectmoney', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['perfectmoney_merchant'])) {
			$data['perfectmoney_merchant'] = $this->request->post['perfectmoney_merchant'];
		} else {
			$data['perfectmoney_merchant'] = $this->config->get('perfectmoney_merchant');
		}

		if (isset($this->request->post['perfectmoney_signature'])) {
			$data['perfectmoney_signature'] = $this->request->post['perfectmoney_signature'];
		} else {
			$data['perfectmoney_signature'] = $this->config->get('perfectmoney_signature');
		}

		if (isset($this->request->post['perfectmoney_type'])) {
			$data['perfectmoney_type'] = $this->request->post['perfectmoney_type'];
		} else {
			$data['perfectmoney_type'] = $this->config->get('perfectmoney_type');
		}
		
		if (isset($this->request->post['perfectmoney_total'])) {
			$data['perfectmoney_total'] = $this->request->post['perfectmoney_total'];
		} else {
			$data['perfectmoney_total'] = $this->config->get('perfectmoney_total'); 
		} 
				
		if (isset($this->request->post['perfectmoney_order_status_id'])) {
			$data['perfectmoney_order_status_id'] = $this->request->post['perfectmoney_order_status_id'];
		} else {
			$data['perfectmoney_order_status_id'] = $this->config->get('perfectmoney_order_status_id'); 
		} 

		$this->load->model('localisation/order_status');
		
		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		
		if (isset($this->request->post['perfectmoney_geo_zone_id'])) {
			$data['perfectmoney_geo_zone_id'] = $this->request->post['perfectmoney_geo_zone_id'];
		} else {
			$data['perfectmoney_geo_zone_id'] = $this->config->get('perfectmoney_geo_zone_id'); 
		} 		
		
		$this->load->model('localisation/geo_zone');
										
		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
		
		if (isset($this->request->post['perfectmoney_status'])) {
			$data['perfectmoney_status'] = $this->request->post['perfectmoney_status'];
		} else {
			$data['perfectmoney_status'] = $this->config->get('perfectmoney_status');
		}
		
		if (isset($this->request->post['perfectmoney_sort_order'])) {
			$data['perfectmoney_sort_order'] = $this->request->post['perfectmoney_sort_order'];
		} else {
			$data['perfectmoney_sort_order'] = $this->config->get('perfectmoney_sort_order');
		}

		/* DEPRECATED

		$this->template = 'payment/perfectmoney.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
		*/

		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view('payment/perfectmoney.tpl', $data));

	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'payment/perfectmoney')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['perfectmoney_merchant']) {
			$this->error['merchant'] = $this->language->get('error_merchant');
		}

		if (!$this->request->post['perfectmoney_signature']) {
			$this->error['signature'] = $this->language->get('error_signature');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>