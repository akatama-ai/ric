$(function() {
	$('.packet-invest').on('click', function(){
   		var self = $(this);
   		alertify.confirm('<p class="text-center" style="font-size:25px;color: black;text-transform: uppercase;height: 20px">Do you agree with commission balanced branch ?</p>',
		  function(){
		    window.funLazyLoad.start();
	   		setTimeout(function(){
	   			//alert(self.data('link'));
				$.ajax({
                    url : self.data('link'),
                    type : "post",
                    dateType:"json",
                    data : {
                         
                    },
                    success : function (result){
                        if (result == "no_complete"){
                        	window.funLazyLoad.reset();
                        	location.reload(true);
                        }
                        else
                        {
                        	window.funLazyLoad.reset();
                        	location.reload(true);
                        }
                    }
                });
			}, 200);
		  },
		  function(){
		});
   		return false;
   	});
	
});
