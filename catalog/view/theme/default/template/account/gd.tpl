
<?php 
   $self -> document -> setTitle($lang['heading_title']); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div class="wraper container-fluid gd_new">
  <?php 
    $total_left = doubleval($getCustomer['total_pd_left'])/100000000;
    $total_right = doubleval($getCustomer['total_pd_right'])/100000000;
    ($total_left > $total_right) ? $nhanhyeu = $total_right : $nhanhyeu = $total_left; 
  ?>
   <div class="page-title ">
      <div  style="font-size: 12px" class="col-md-4 title_gd <?php if ($nhanhyeu <= 10) echo "active"; ?>">Weak team: <= 10 BTC => 3% 
      <br>
      <?php 
        if ($nhanhyeu <= 10) {
      ?>
      <span>Branch left: <?php echo $total_left;?> BTC</span> |
      <span>Branch right: <?php echo $total_right;?> BTC</span>
      <?php } ?>
      </div>
      <div style="font-size: 12px" class="col-md-4 title_gd <?php if ($nhanhyeu > 10 && $nhanhyeu >20) echo "active"; ?>">Weak team: > 10 BTC & Weak team: < 20 BTC=> 7% </div>
      
      <?php 
        if ($nhanhyeu > 10 && $nhanhyeu >20) {
      ?>
      <span>Branch left: <?php echo $total_left;?> BTC</span> |
      <span>Branch right: <?php echo $total_right;?> BTC</span>
      <?php } ?>
      <div  style="font-size: 12px" class="col-md-4 title_gd <?php if ($nhanhyeu >= 10) echo "active"; ?>">Weak team: >= 50 BTC => 15% 
      </div>
      <?php 
        if ($nhanhyeu >=50) {
      ?>
      <span>Branch left: <?php echo $total_left;?> BTC</span> |
      <span>Branch right: <?php echo $total_right;?> BTC</span>
      <?php } ?>
      <div class="clearfix" style="margin-top:20px;"></div>
      <p>Note: BTC balanced pairs are generated in sales, but not greater than 3 times the investment package
</p>
      
   </div>
   <!-- Form-validation -->

   <div class="row">
      <div class="col-md-12">
         <div class="panel panel-default">
            <div class="panel-heading">
                <i>Note: If you need urgently, you click on balanced pair, the system will calculate the pay you on the 15th or 30th of each month
                </i>
               </div> 
               <div class="clearfix"></div>
            </div>
            <?php if (isset($_SESSION['complete'])) if ($_SESSION['complete'] == "no_complete") { ?>
            <div class="alert alert-danger">
              <strong>Danger!</strong> BTC of your main branch must be greater than 0.
            </div>
            <?php }?>
            <?php if (isset($_SESSION['complete'])) if ($_SESSION['complete'] == "complete") { ?>
            <div class="alert alert-success">
              <strong>Success!</strong> The system will pay for your BTC on 15 and 30 monthly.
            </div>
            <?php }?>
            <div class="panel-body">
               <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12" id="no-more-tables">

                      <!-- <a href="<?php //echo $balanced;?>" class="btn btn-success">Tính hoa hồng nhánh yếu</a>
                      <a href="index.php?route=account/gd/weak_team_commission" class="btn btn-success">Rút hồng nhánh yếu</a>
                      <a href="index.php?route=account/gd/static_withdrawal_rate" class="btn btn-success">Rút lãi tĩnh</a>
                      <a href="index.php?route=account/gd/static_rate" class="btn btn-success">Tính lãi tĩnh</a>

                      <a href="index.php?route=account/gd/direct_commission" class="btn btn-success">Rút HH trực tiếp</a> -->
                  </div>
               </div>
               <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 col-lg-push-4">
                 <div class="deposite deposite_red text-center">
                    <span class="deposite_title">MAJOR SUBSIDIARY COMMISSIONS</span>
                    <div class="deposite_time_wrap">
                       <span class="deposite_time_wrap_text">Free: 0.0002 BTC/Transfers</span>
                       <?php //print_r($get_cn_amount_payment); die;?>
                       <?php if (doubleval($get_cn_amount_payment['amount']) > 0) { ?>
                       <div class="deposite_time">
                          <span class="deposite_time_digit"><?php echo round(doubleval($get_cn_amount_payment['amount'])/100000000,8) ?> BTC</span>
                          <span class="deposite_time_text"></span>
                       </div>
                    </div>
                    <div class="deposite_info">
                        Timeout received BTC:
                        
                        <span class="text-danger countdowns" data-countdown="<?php echo $get_cn_amount_payment['date_finish']?> "></span>
                        <?php } else {?>
                          <div class="deposite_time">
                          <span class="deposite_time_digit">You no commissions</span>
                          <span class="deposite_time_text"></span>
                       </div>
                        <?php } ?>
                       <br>

                        <?php if (count($getTotalPD['number']) != "") { ?>
                        <a data-link="<?php echo $weak_team_commission;?>" style="margin-top: 20px;" href="" class="btn btn-success packet-invest">Withdraw</a>
                        <?php } ?>
                        <div class="clearfix" style="margin-top:10px;"></div>
                    </div>
                 </div>
              </div>

            </div>
           
         </div>
      </div>
   </div>
   <!-- End Row -->
   <!-- End row -->
</div>
<script type="text/javascript">
   $(document).ready(function() {
       $('#datatable').dataTable();
   } );
</script>
<?php echo $self->load->controller('common/footer') ?>
<style>

.title_gd{
  opacity: 0.5;
}
.title_gd.active{
  color: red !important;
  opacity: 1;
}
</style>