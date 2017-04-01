<section>
            <div class="block">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 pro-col"> 
                            <ul class="logos">
                                <li><a href="#" title=""><img src="catalog/view/theme/default/fre/images/resource/logo1.png" alt="" /></a></li>
                                <li><a href="#" title=""><img src="catalog/view/theme/default/fre/images/resource/logo2.png" alt="" /></a></li>
                                <li><a href="#" title=""><img src="catalog/view/theme/default/fre/images/resource/logo3.png" alt="" /></a></li>
                                <li><a href="#" title=""><img src="catalog/view/theme/default/fre/images/resource/logo4.png" alt="" /></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>      


       
        <div class="bottom-strip">
            <div class="container">Copyright 2007 - 2017 Erichy Corp. LTD</div>
        </div>
    </div>
<div id="google_translate_element" style="position: absolute;right: 0;top: 160px; z-index:10002"></div>
<script type="text/javascript">
function googleTranslateElementInit() {
   new google.translate.TranslateElement({pageLanguage: 'en',includedLanguages: 'en,vi,de,ru,th,tr,km,it,ja,lo,ml,ko,hr,hy,zh-CN', }, 'google_translate_element');
}
</script>
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

      <style type="text/css">
      #google_translate_element select{
        border: 1px solid #ccc;
    padding: 10px;
    border-radius: 5px;
    background: #eeb013;
    color: #fff;
      }
      
      </style>
<script>
        $(".menu-toggle").click(function(e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
        $("#menu-toggle").click(function(e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
    </script>
    <script src="catalog/view/theme/default/fre/js/script.js" type="text/javascript"></script>
    <script type="text/javascript">
    
    $('.packet-invest').on('submit', function(){
        var self = $(this);
        alertify.confirm('<p class="text-center" style="font-size:25px;color: black;text-transform: ;height: 20px">Make sure your choice is correct !</p>',
          function(){
            window.funLazyLoad.start();
            setTimeout(function(){
                self.ajaxSubmit({
                    success : function(result) {
                        if (result == "no_6"){
                            var xhtml = '<p class="text-center" style="font-size:25px;color: black;text-transform: ;height: 20px">Smaller your weak team 50 BTC !</p>';
                            alertify.alert(xhtml, function(){
                                location.reload(true);
                              });
                            window.funLazyLoad.reset();
                            return false;
                        }
                        if (result == "no_7"){
                            var xhtml = '<p class="text-center" style="font-size:25px;color: black;text-transform: ;height: 20px">Smaller your weak team 100 BTC !</p>';
                            alertify.alert(xhtml, function(){
                                location.reload(true);
                              });
                            window.funLazyLoad.reset();
                            return false;
                        }
                        if (result == "no_complete"){
                            var xhtml = '<p class="text-center" style="font-size:25px;color: black;text-transform: ;height: 20px">Please pay your investment package!</p>';
                            alertify.alert(xhtml, function(){
                                location.reload(true);
                              });
                            window.funLazyLoad.reset();
                            return false;
                        }
                        result = $.parseJSON(result);
                        console.log(result);
                        var amount = result.amount / 100000000;
                        
                        var package = result.package;
                        var total = package;
                        
                        var xhtml = '<div class="col-md-12"style=" text-align: center; ">Please send <code>'+amount+' BTC</code> ('+package+' USD) to this address.</div><div class="col-md-12"style=" text-align: center; "><p></p><p>Your Packet: '+package+' USD</p><p>Total: '+ amount +' BTC</p><img style="margin-left:-10px" src="https://chart.googleapis.com/chart?chs=225x225&chld=L|0&cht=qr&chl=bitcoin:'+result.input_address+'?amount='+amount+'"/><p>'+result.input_address+'</p></div>'
                        alertify.alert(xhtml, function(){
                            location.reload(true);
                          });
                        
                    }
                });
                check_payment();
            }, 200);
          },
          function(){
        });
        return false;
    });

    $('.packet-invoide').on('submit', function(){
        var self = $(this);
        window.funLazyLoad.start();
        setTimeout(function(){
            self.ajaxSubmit({
                success : function(result) {
                    result = $.parseJSON(result);
                    console.log(result);
                    if(_.has(result, 'success') && result['success'] === 1){
                        var xhtml = '<div class="col-md-12 text-center"><h3>You have to activate this package! please select another package!</h3></div>'
                    }else{
                        var amount = result.amount / 100000000;
                    //  var pin = result.pin / 100000000;
                        var package = result.package;
                        var total = package;
                        var received = result.received / 100000000;
                        var html = result.html;
                        var xhtml = '<div class="col-md-12"style=" text-align: center; ">Please send <code>'+amount+' BTC</code> ('+package+' USD) to this address.</div><div class="col-md-12"style=" text-align: center; "><p></p><p>Your Packet: '+package+' USD</p><p>Total: '+ amount +' BTC</p><img style="margin-left:-10px" src="https://chart.googleapis.com/chart?chs=225x225&chld=L|0&cht=qr&chl=bitcoin:'+result.input_address+'?amount='+amount+'"/><p>'+result.input_address+'</p></div>'
                    }
                    
                    alertify.alert(xhtml, function(){
                        location.reload(true);
                      });
                }
            });
             // check_payment();
        }, 200);
        return false;
    });
     function check_payment(){
        $.ajax({
            url : "<?php echo $check_payment ?>",
            type : "post",
            dataType:"text",
            data : {
               
            },
            success : function (result){
                result = $.parseJSON(result);
                if (result.confirmations == "3"){
                    var xhtml = '<p class="text-center" style="font-size:25px;color: black;text-transform: ;height: 20px">Active successful package <br> Thank you for trusting our services !</p>';
                    alertify.alert(xhtml, function(){
                        location.reload(true);
                      });
                }
                if (result.confirmations == "0")
                {
                    setTimeout(function(){ check_payment(); }, 1500);
                }

            }
        });

     }
   </script>
</body>
</html>

