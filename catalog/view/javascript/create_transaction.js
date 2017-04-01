$(function() {
    $('#type_transaction').on('change',function(){
       if (this.value == "1"){
        $('#price').val($('#price_buy').val());
       }
       else
       {
         $('#price').val($('#price_sell').val());
       }
    });
    $('#amount').on('input propertychange',function(){
        if ($('#type_transaction').val() == "1") {
            $('#num_btc').val(parseFloat($('#price_buy').val())*parseFloat($('#amount').val()));
            if ($('#balnce').val() <= $(this).val()){
               $('.error_amount_max').show();
            }
            else{
                $('.error_amount_max').hide();
            }
        }
        else
        {
            $('#num_btc').val(parseFloat($('#price_sell').val())*parseFloat($('#amount').val()));
            if ($('#amount_customer').val() <= $(this).val()){
               $('.error_amount_Mezidas').show();
            }
            else{
                $('.error_amount_Mezidas').hide();
            }

        }
    });
    $('#form_create').on('submit', function() {
        $(this).ajaxSubmit({
            type : 'POST',
            beforeSubmit : function(arr, $form, options) {
                $('.error_typetransaction').hide();
                 $('.error_amount').hide();
                 $('.error_amount_max').hide();
                 $('.error_amount_Mezidas').hide();
                $('.page-loader').show();
                if ($('#type_transaction').val() == "") {
                    $('.page-loader').hide();
                    $('.error_typetransaction').show();
                    return false;
                }
                if ($('#amount').val() == "" || isNaN($('#amount').val()) || parseFloat($('#amount').val()) <= 0 ){
                    $('.page-loader').hide();
                    $('.error_amount').show();
                    return false;
                }

                 if ($('#type_transaction').val() == "1") {
                    if ($('#balnce').val() < $('#balnce').val()){
                        $('.error_amount_max').show();
                        $('.page-loader').hide();
                        //return false;  // khoa test
                    }

                }
                else{
                    if ($('#amount_customer').val() <= $('#amount_customer').val()){
                       $('.error_amount_Mezidas').show();
                        $('.page-loader').hide();
                        //return false;  // khoa test
                    }
                    
                }
                
            },
            success : function(result) {
                result = $.parseJSON(result); 
                if (result.error) {
                    alert("Server die");
                }
                if (result.success_buy) {
                    window.location.href = $('#price_buy').data('link')+"&token="+result.success_buy;
                }
                 if (result.success_sell) {
                    window.location.href = $('#price_sell').data('link')+"&token="+result.success_sell;
                }
            }
        });
        return false;
    });
});