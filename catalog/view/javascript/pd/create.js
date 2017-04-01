$(function() {
	$('#submitPD').on('submit', function() {

		$('#amount-error').hide().parent().removeClass('has-error').removeClass('has-success');
		$('#Password2-error').hide().parent().removeClass('has-error').removeClass('has-success');
		$(this).ajaxSubmit({
			type : 'GET',
			beforeSubmit : function(arr, $form, options) {
				window.funLazyLoad.start();
				window.funLazyLoad.show();
				$('.alert-edit-account').hide();
				$('.alert-dismissable').hide();
				if (arr[0].value === "") {
					$('#amount-error').show().parent().addClass('has-error') && window.funLazyLoad.reset();
					$('#submitPD button').show() && window.funLazyLoad.reset();
					
					return false;
				} else {
					$('#amount-error').parent().addClass('has-success');
				}

				if(arr[0].value < 0.5){
					window.funLazyLoad.reset();
					$('#err-c-wallet').show();
					return false;
				}
				var number = arr[0].value;
				if(typeof number !=='number' && (number%0.5) !=0) {
					window.funLazyLoad.reset();
					$('#err-c-wallet').show().html('Must be a multiple of 0.5!');
					return false;
				}
				
				if (arr[1].value === "") {
					$('#Password2-error').show().parent().addClass('has-error') && window.funLazyLoad.reset();
					$('#Password2-error span').show().html(window.err_password) && window.funLazyLoad.reset();
					$('#submitPD button').show() && window.funLazyLoad.reset();
					window.funLazyLoad.reset();
					return false;
				} else {
					$('#Password2-error').parent().addClass('has-success');
				}
				arr[0].value !== "" && arr[1].value !== ""  && $('#submitPD button').hide();
				
			},
			success : function(result) {
				result = $.parseJSON(result); 

				if (_.has(result, 'login') && result.login === -1) {
					location.reload(true);
				} else {

					if (_.has(result, 'pin') && result.pin === -1) {	
					window.funLazyLoad.reset();					
						$('#checkPD-error').show();
						$('#checkPD-error').show().html(window.err_pin);
						$('#submitPD button').show();
						return true;
					} else {
						$('#checkPD').parent().addClass('has-success');
					}
					if (_.has(result, 'checkWaiting') && result.checkWaiting === -1) {		
					window.funLazyLoad.reset();				
						$('#checkWaiting-error').show();
						$('#checkWaiting-error').show().html(window.err_pd);
						//window.location.href = 'index.php?route=account/pd';
						return true;
					} else {
						$('#checkWaiting').parent().addClass('has-success');
					}
					
					if (_.has(result, 'password') && result.password === -1) {
						$('#Password2').parent().addClass('has-error');
						$('#Password2-error').show();
						$('#Password2-error span').show().html(window.err_password_2);
						$('#submitPD button').show();
						return true;
					} else {
						$('#Password2').parent().addClass('has-success');
					}

					if (_.has(result, 'pin')  && result.pin === -1 && _.has(result, 'password') && result.password === 1) {
						$('.alert-dismissable').show();
						$('#Password2').parent().removeClass('has-error').removeClass('has-success');
						$('#Password2-error span').hide().html(window.err_password_2);
						$('#amount-error').hide().parent().removeClass('has-error').removeClass('has-success');
						$('#amount').val('');
						$('#Password2').val('');
						$('#submitPD button').show();
		
					}
					if (_.has(result, 'ok') && result.ok === 1 && _.has(result, 'password') && result.password === 1 && _.has(result, 'pin')  && result.pin === 1 && _.has(result, 'data_link')) {
				
						$('#Password2').parent().removeClass('has-error').removeClass('has-success');
						$('#Password2-error span').hide().html(window.err_password_2);
						$('#amount-error').hide().parent().removeClass('has-error').removeClass('has-success');
						$('#amount').val('');
						$('#Password2').val('');
						$('.alert-edit-account').show();
						$('.alert-dismissable').hide();
						$('#submitPD button').show();
						window.location.href=result.data_link;
									
					}

					if(_.has(result, 'ok') && result.ok === -1 && _.has(result, 'password') && result.password === 1 && _.has(result, 'pin')  && result.pin === 1){
						$('#Password2').parent().removeClass('has-error').removeClass('has-success');
						$('#Password2-error span').hide().html(window.err_password_2);
						$('#amount-error').hide().parent().removeClass('has-error').removeClass('has-success');
						$('#amount').val('');
						$('#Password2').val('');
						$('.alert-edit-account').hide();
						$('.alert-dismissable').show();
					$('#submitPD button').show();
						
					}
					
				}
			}
		});
		return false;
	});
}); 