<?php 
   $self -> document -> setTitle('Investment'); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div class="wraper container-fluid">
   <div class="page-title">
      <h3 class="title">Confirm PD</h3>
   </div>
   <!-- Form-validation -->

   <?php if ($invoice) { ?>
<div class="row" id="order-pin-history">
   <div class="col-lg-12">
      <div class="panel panel-default pd-panel" style="padding-bottom:20px;">
         <div class="panel-heading">
            <h3 class="panel-title">Confirm</h3>
           
            <div class="clearfix"></div>
         </div>
         <div class="panel-body">
          <div class="row">
          <?php for ($i=0; $i < count($invoice); $i++) { ?>         
         <div class="col-md-4 col-sm-6 col-xs-12 history-pin" style="margin-bottom:10px;">
            <div class="panel-provide">
               <div class="provide-heading">
                  <h4 style="padding-top:0px;"><b>Date Created: <?php echo date("Y-m-d H:i:A", strtotime($invoice[$i]['date_created'])); ?></b></h4>
               </div>
               <div class="provide-info" style="background:none; min-height:155px">
                  <?php if(intval($invoice[$i]['confirmations']) === 0) { ?>
                  <img style="float: right;" src="https://chart.googleapis.com/chart?chs=150x150&amp;chld=L|1&amp;cht=qr&amp;chl=bitcoin:<?php echo $invoice[$i]['input_address'] ?>?amount=<?php echo (intval($invoice[$i]['amount']) / 100000000) ?>"/>
                  <?php } ?>
                  <p>ID: <code><?php echo $invoice[$i]['transfer_id'] ?> <i class="fa fa fa-dropbox fa-1x"></i></code></p>
                  <p>Total: <code><?php echo (intval($invoice[$i]['amount']) / 100000000) ?> <i class="fa fa-btc" aria-hidden="true"></i></code></p>
                  <p>Received: <code><?php echo (intval($invoice[$i]['received']) / 100000000) ?> <i class="fa fa-btc" aria-hidden="true"></i></code></p>
                  <p>Status: <span class="label <?php echo intval($invoice[$i]['confirmations']) === 0 ? "label-warning" : 'label-success' ?>"><?php echo intval($invoice[$i]['confirmations']) === 0 ? "Pending" : 'Finish' ?></span></p>
                  <p>Wallet: <code><?php echo $invoice[$i]['input_address'] ?></code></p>
               </div>
            </div>
         </div>
         <?php } ?>
         </div>
         </div>
         
         <div class="clearfix"></div>
         <!-- /.panel-body -->
      </div>
      <!-- /.panel -->
   </div>
   <!-- /.col-lg-12 -->
</div>
<?php } ?>
</div>
<!-- End Row -->
<!-- End row -->
</div>
<?php echo $self->load->controller('common/footer') ?>