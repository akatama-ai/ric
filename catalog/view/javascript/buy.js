$(function() {
    $('#amount').on('input propertychange',function(){
        $('.error_amount').hide();
       if (parseFloat($(this).val()) > parseFloat($(this).data('max')))
       {
        $('.error_amount_max').show();
       }
       else{
         $('.error_amount_max').hide();
         $('#num_btc').val(parseFloat($('#amount').val())*parseFloat($('#price').val()));
       }
       if (parseFloat($('#num_btc').val()) > parseFloat($('#num_btc').data('btc')))
       {
        $('.error_amount_btc').show();
       }
       else
       {
        $('.error_amount_btc').hide();

       }
    });
    $('#form_buy').on('submit', function() {
        $(this).ajaxSubmit({
            type : 'POST',
            beforeSubmit : function(arr, $form, options) {
                $('.error_amount_max').hide();
                $('.error_amount').hide();
                $('.error_amount_btc').hide();
                $('.page-loader').show();
                if ($('#amount').val() == "" || isNaN($('#amount').val())){
                    $('.error_amount').show();
                    $('.page-loader').hide();
                    return false;
                } 
                if (parseFloat($('#amount').val()) > parseFloat($('#amount').data('max'))){
                    $('.error_amount_max').show();
                    $('.page-loader').hide();
                    return false;
                }
                if (parseFloat($('#num_btc').val()) > parseFloat($('#num_btc').data('btc')))
                {
                    $('.error_amount_btc').show();
                    $('.page-loader').hide();
                    return false; // test
                }
            },
            success : function(result) {
                result = $.parseJSON(result); 
                if (result.error) {
                    alert("Server die");
                    return false;
                }
                if (result.url) {
                    window.location.href = result.url
                }
            }
        });
        return false;
    });
});