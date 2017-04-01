$(function() {
    $('#username').on('input propertychange',function(){
        $('.wallet_tranfer').hide();
        $('.error_username').hide();
        $("#amount").attr("readonly", true);
           $("#password_transaction_vnd").attr("readonly", true);
        $.ajax({
        type: "POST",
        url: $(this).data('link'),
        data:'keyword='+$(this).val(),        
        success: function(data){
            $("#suggesstion-box_username").show();
            $("#suggesstion-box_username").html(data);
            $("#p_node").css("background","#FFF");            
        }
        });
    });
    $('#username_btc').on('input propertychange',function(){
        $('.wallet_tranfer').hide();
        $('.error_username').hide();
        $("#amount").attr("readonly", true);
           $("#password_transaction_vnd").attr("readonly", true);
        $.ajax({
        type: "POST",
        url: $(this).data('link'),
        data:'keyword='+$(this).val(),        
        success: function(data){
            $("#suggesstion-box_username_btc").show();
            $("#suggesstion-box_username_btc").html(data);
            $("#p_node").css("background","#FFF");            
        }
        });
    });
    $('#amount').on('input propertychange',function(){
        var amount = $('#amount').val().replace(/,/gi, "");
       if (amount > parseFloat($(this).data('maxamount')))
       {
        $('.error_amount_max').show();
       }
       else{
         $('.error_amount_max').hide();
        
       }
    });
    $('#amount_btc').on('input propertychange',function(){
        $('#amount_btc').val($('#amount_btc').val().replace(/,/gi, "."));
    });
   $('#amount_btc_block').on('input propertychange',function(){
        $('#amount_btc_block').val($('#amount_btc_block').val().replace(/,/gi, "."));
    });
    $('#tranfer_cm').on('submit', function() {
         alertify.confirm('<p class="text-center" style="font-size:18px !important;color: black;text-transform: ;height: 20px">confirm Transaction ?</p>', function (e) {
        if (e) {
            $('#tranfer_cm').ajaxSubmit({
            type : 'POST',
            beforeSubmit : function(arr, $form, options) {
               var amount = $('#amount').val().replace(/,/gi, "");
                $('.error_amount').hide();
                 $('.error_amount_max').hide();
                 $('.error_username').hide();
                 $('.error_password_transaction_vnd').hide();
                $('.page-loader').show();
                if ($('#username').val() == "" ){
                    $('.error_username').show();
                    window.funLazyLoad.reset();
                    $(this).focus();
                    return false;
                } 

                if ($('#amount').val() == "" || isNaN(parseFloat($('#amount').val())) || parseFloat(amount) <1){
                    $('.error_amount').show();
                    window.funLazyLoad.reset();
                    return false;
                } 
                if (amount > parseFloat($('#amount').data('maxamount'))){
                    $('.error_amount_max').show();
                    window.funLazyLoad.reset();
                    $(this).focus();
                    return false;
                }
                if ($('#password_transaction_vnd').val() == ""){
                    $('.error_password_transaction_vnd').show();
                    window.funLazyLoad.reset();
                    return false;
                } 
                
                window.funLazyLoad.reset();
                

            },
            success : function(result) {
                result = $.parseJSON(result); 
                if (result.error) {
                    alert("Enter the incorrect data");
                    window.funLazyLoad.reset();
                    return false;
                }
                 if (result.password) {
                    window.funLazyLoad.reset();
                    $('.error_password_transaction_deal_vnd').show();
                    return false;
                }
                if (result.money_transfer) {
                   window.funLazyLoad.reset();
                    var html = '<div class="col-md-12">';
                  html += '<p class="text-center" style="font-size:19px !important;color: black;text-transform: ;height: 20px">VND was used for transactions!</p>';
                  
                  alertify.alert(html, function(){
                     
                  });
                  return false;

                }
                if (result.succsess) {
                   var html = '<div class="col-md-12">';
                  html += '<p class="text-center" style="font-size:19px !important;color: black;text-transform: ;height: 20px">CM successful transfer!</p>';
                  
                  alertify.alert(html, function(){
                      location.reload(true); 
                  });


                }
                $('#username').val('');
                $('#amount').val('');
            }
        });
            } else {
                // user clicked "cancel"
            }
        });
        
        return false;
    });
    var delay = (function(){
      var timer = 0;
      return function(callback, ms){
        clearTimeout (timer);
        timer = setTimeout(callback, ms);
      };
    })();
      $('#amount_usd').on('input propertychange',function(){
        if ($('#amount_usd').val() != "")
        {


        //$('#amount_usd').val(parseInt($('#amount_usd').val()));
        $('#amount_usd').val($('#amount_usd').val().replace(/,/gi, "."));
        $('#password_transaction_btc').attr("readonly", true);
        $('#password_transaction_btc').val();
        delay(function(){
          $.ajax({
            url : $('#amount_btc').data('link'),
            type : "post",
            dateType:"text",
            data : {
                 usd : $('#amount_usd').val()
            },
            success : function (result){
                result = $.parseJSON(result); 
                $('#amount_btc').val(result.btc);
                $('#password_transaction_btc').attr("readonly", false);
            }
          });
        }, 500);
        }
      });

       $('#tranfer_cm_btc').on('submit', function() {
         alertify.confirm('<p class="text-center" style="font-size:25px;color: black;text-transform: ;height: 20px">Are you sure ?</p>', function (e) {
        if (e) {
            $('#tranfer_cm_btc').ajaxSubmit({
            type : 'POST',
            beforeSubmit : function(arr, $form, options) {
                window.funLazyLoad.start();
                $('.error').hide();
                $('.error_amount_usd').hide();
                $('.error_amount_max_usd').hide();
                $('.error_password_transaction_btc').hide();
                if ($('#amount_usd').val() == "" || isNaN(parseFloat($('#amount_usd').val())) || parseFloat($('#amount_usd').val()) < 1 ){
                    $('.error_amount_usd').show();
                    window.funLazyLoad.reset();
                    return false;
                } 
                if ($('#amount_usd').val() > parseFloat($('#amount_usd').data('maxamount_usd'))){
                    $('.error_amount_max_usd').show();
                    window.funLazyLoad.reset();
                    return false;
                } 
                if ($('#amount_usd').val() < 20 ) {
                
                   $('.error_amount_usd').show();
                    window.funLazyLoad.reset();
                    return false;
                }

                if ($('#password_transaction_btc').val() == ""){
                    $('.error_password_transaction_btc').show();
                    window.funLazyLoad.reset();
                    return false;
                } 

            },
            success : function(result) {
         
                window.funLazyLoad.reset();
                var result = $.parseJSON(result); 
                 console.log(result);     
                if (result.error) {
                    alert("Enter the incorrect data");
                    window.funLazyLoad.reset();
                    return false;
                }
                 if (result.password) {
                    window.funLazyLoad.reset();
                    $('.error_password_transaction_deal_btc').show();
                    return false;
                }
                if (result.money_transfer) {
                  window.funLazyLoad.reset();
                    var html = '<div class="col-md-12">';
                  html += '<p class="text-center" style="font-size:19px !important;color: black;text-transform: ;height: 20px">You are not enough USD!</p>';
                  
                  alertify.alert(html, function(){
                     location.reload(true); 
                  });
                  return false;

                }
                if (result.admin_none) {
                  window.funLazyLoad.reset();
                    var html = '<div class="col-md-12">';
                  html += '<p class="text-center" style="font-size:19px !important;color: black;text-transform: ;height: 20px">Please try again!</p>';
                  
                  alertify.alert(html, function(){
                     location.reload(true); 
                  });
                  return false;

                }
                if (result.succsess) {
                   var html = '<div class="col-md-12">';
                  html += '<p class="text-center" style="font-size:19px;color: black;text-transform: ;height: 20px">Successful transfer!</p>';
                  
                  alertify.alert(html, function(){
                      location.reload(true); 
                  });


                }
                $('#username').val('');
                $('#amount').val('');
            }
        });
            } else {
                // user clicked "cancel"
            }
        });
        
        return false;
    });

   
});

function selectU(val) {
    $('.wallet_tranfer').show();
    $('#username').val(val);
    $('#suggesstion-box_username').hide();
    $.ajax({
        type: "POST",
        url: 'index.php?route=transaction/tranfercm/load_wallet_coinmax',
        data:{'username' : val},        
        success: function(data){
           result = $.parseJSON(data); 
           result = JSON.parse(result);
           $('.wallet_your').html(result.username);  
            $('#telephone').html(result.telephone);  
            $('#customer_code').html((result.customer_code).substring(0, 6));  
           //$('#amount_your').html(numberWithCommas(result.amount));
           //alert(result.img_profile);
           $('.my_wallet_user').attr({
               'src': result.img_profile
              
           });
          
           $("#amount").attr("readonly", false);
           $("#password_transaction_vnd").attr("readonly", false);  
           $('.hidden_wallet').show(); 
           $('#amount').val('');
           $('#password_transaction_vnd').val('');
           $('#amount').focus();
        }
    });
}
function selectU_btc(val,customer_id) {
    $('.wallet_tranfer').show();
    $('#username_btc').val(val);
    $('#suggesstion-box_username_btc').hide();
    $.ajax({
        type: "POST",
        url: 'index.php?route=transaction/tranfercm/load_wallet_blockio',
        data:{'customer_id' : customer_id},        
        success: function(data){
           result = $.parseJSON(data); 
           var html = ' <div class="wallet wallet_blockcio"><img src="https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl='+result.wallet+'" alt=""></div><p>'+result.wallet+'</p><p>Amount: '+result.blance +' BTC</p></p><p>Amount pending: '+result.pending +' BTC</p>';
           $('.wallet_you').html(html);  
        
          
           $("#amount_btc_block").attr("readonly", false);
           $("#password_transaction_btc_block").attr("readonly", false);  
           $('.hidden_wallet').show(); 
           $('#amount_btc').val('');
           $('#password_transaction_btc').val('');
           $('#amount_btc').focus();
        }
    });

}
String.prototype.reverse = function () {
        return this.split("").reverse().join("");
    }
function reformatText(input) {    
    var x = input.value;
    x = x.replace(/,/g, ""); // Strip out all commas
    x = x.reverse();
    x = x.replace(/.../g, function (e) {
        return e + ",";
    }); // Insert new commas
    x = x.reverse();
    x = x.replace(/^,/, ""); // Remove leading comma
    input.value = x;
}
function numberWithCommas(x) {
    x = x.toString();
    var pattern = /(-?\d+)(\d{3})/;
    while (pattern.test(x))
        x = x.replace(pattern, "$1,$2");
    return x;
}
