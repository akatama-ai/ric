

<?php 
   $self -> document -> setTitle('Edit New User'); 
   echo $self -> load -> controller('common/header'); 
   
   ?>
   <div id="wrapper">
    <!-- Sidebar -->
    <?php echo $self->load->controller('common/column_left');  ?>
      <div id="page-content-wrapper" class="pattern">
        <div class="container-fluid">
           <div class="pagetop" style=" padding: 20px 0 5px; ">
                    <div class="container">
                        <h1> Update User</h1>

                    </div>
                </div>
<section>
   <div class="block remove-bottom" >
      <div class="container">
         <div class="row">
            <div class="col-sm-12">
               <div class="panel">
                  
                  <div class="panel-body" id="no-more-tables">
                    <form id="submitUser" class="simple-form" name="buy_share_form" action="<?php echo $self -> url -> link('account/registers/editSubmit', '', 'SSL'); ?>" method="post" novalidate="novalidate">
                      <div class="row">
                            <div class="col-sm-6 col-md-push-3">
                                <div class="form-group">
                                     <label>Binary</label>
                                      <input type="hidden" name="cus_id" value="<?php echo $cus_id; ?>">
                                      <?php $user = $self->get_account_p_binary();  ?>
                                      
                                     <select id="pbinary" name="pbinary" class="form-control">
                                        <option value="">-- Choose your Binary --</option>
            
                                        <?php foreach ($user as $key=> $value) {?>

                                        <option value="<?php echo $value ?>"><?php echo $value ?></option>
                                        <?php } ?>
                                     </select>
                                     <span id="pbinary-error" class="field-validation-error" style="display: none;">
                                     <span >The Binary field is required.</span>
                                     </span>
                                    
                                </div>
                           
                                <div class="form-group">
                                     <label>Postision</label>
                                    <select class="form-control" id="postion" name="postion" data-link="<?php echo $check_p_binary; ?>">
                                      <option value="">-- Choose your Postision --</option>
                                   </select>
                                   <span id="postion-error" class="field-validation-error" style="display: none;">
                                   <span >The postion field is required.</span>
                                   </span>
                                </div>
                                <div class="form-group">
                                  <button type="submit" class="dark-btn">Save</button>
                                </div>
                            </div>
                        </div>

                    
                     
                  </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<script type="text/javascript">
$(function(){
    $('#submitUser').on('submit', function(envt) {
        
        
        $(this).ajaxSubmit({
            type : 'GET',

            beforeSubmit :  function(arr, $form, options) { window.funLazyLoad.start();
                window.funLazyLoad.show();
                 if ($('#pbinary').val() == "") {
                  $('#pbinary-error').show().parent().addClass('has-error');
                  window.funLazyLoad.reset();
                  return false;
                } else {
                  $('#pbinary-error').hide().parent().addClass('has-success');
                }
                if ($('#postion').val() == "" || $('#postion').val() == null) {
                  $('#postion-error').show().parent().addClass('has-error');
                  window.funLazyLoad.reset();
                  return false;
                } else {
                  $('#postion-error').hide().parent().addClass('has-success');
                }
         },
            success : function(result){
                result = $.parseJSON(result);
                if (_.has(result, 'login') && result.login === -1) {
                    location.reload(true);
                } else {
                
                    if (_.has(result, 'ok') && result.ok === 1 && _.has(result, 'link')) {
                        window.location.href=result.link;
                        //location.reload(true);            
                    }
                }     
            }
        });
      return false;
    });
});
   $(function() {
        $('#pbinary').on('change', function() {
           $('#postion').empty();
   
            $.ajax({
                 url: $('#postion').data('link'),
                type : 'GET',
                 data : {
                             pbinary : $('#pbinary').val()
                        },
              
                success : function(result) {
                   result = $.parseJSON(result);
    $('#postion').empty();
                   $('#postion').append(result.html);
                }
            });
            return false;
        });
    });
</script>
    </div>
  </div>
<?php echo $self->load->controller('common/footer') ?>