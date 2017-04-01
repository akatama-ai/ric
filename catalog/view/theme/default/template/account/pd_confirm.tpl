<?php 
   $self -> document -> setTitle($lang['C_titleBank_Transfer']); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div class="wraper container-fluid">
   <div class="page-title">
      <h3 class="title"><?php echo $lang['t_titleConfirm_'] ?></h3>
   </div>
   <!-- Form-validation -->
   <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">

                                 <h3 class="panel-title pull-left"><?php echo $lang['C_titleConfirm'] ?></h3>                 
                                <div class="options pull-right">
                                    <div class="btn-toolbar">
                                        <span class="countdown" style="float:right; color:red" data-countdown="<?php echo $transferConfirm['date_finish'] ?>"></span>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                             
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                          
                                            
                                           
                                                <div class="row">
                                                    <div class="col-md-6 col-sm-6">
                                                      <?php if (intval($transferConfirm['pd_satatus']) === 1 ) {?>
                                                        <h4><?php echo $lang['t_view_btc'] ?></h4>
                                                        <p><a class="btn btn-success" href=" https://blockchain.info/tx/<?php echo $transferConfirm['transaction_hash']; ?>">Transaction hash</a></p>
                                                        <p><a class="btn btn-success" href=" https://blockchain.info/tx/<?php echo $transferConfirm['input_transaction_hash']; ?>">Transaction hash</a></p>
                                                      <br>
                                                      <?php } ?>
                                                    </div>
                                                    <div class="col-md-6 col-sm-6">
                                                        <div class="form-group">
                                                            <label for="GDMemberInfo_UserName"><?php echo $lang['C_titleUser'] ?></label> : <?php echo $transferConfirm['username'] ?>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="GDMemberInfo_UserName"><?php echo $lang['C_titleTelephone'] ?></label> : <?php echo $transferConfirm['telephone'] ?>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="GDMemberInfo_CountryId"><?php echo $lang['C_titleCountry'] ?></label> : <?php echo $transferConfirm['name'] ?>
                                                        </div>
                                                        <div class="form-group">
                                                            <label><?php echo $lang['C_titleTransfer_Amount'] ?> : <h5> <code><?php echo ($transferConfirm['amount']/100000000); ?> BTC </code></h5></label> 
                                
                                                        </div>
                                                        
                                                    </div>
                                                    
                                                </div>
                                          
                                  
                                    </div>
                                </div>
                            </div>
                           
                        </div>
                    </div>
                    
                </div> <!-- End Row -->
   <!-- End row -->
</div>
  <script type="text/javascript">
            $(document).ready(function() {
                $('#datatable').dataTable();
            } );
        </script>

<?php echo $self->load->controller('common/footer') ?>