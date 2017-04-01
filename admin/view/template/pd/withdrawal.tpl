<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
<div class="page-header">
  <div class="container-fluid">
    <h1>Direct Commission</h1>
  </div>
</div>
<div class="container-fluid">
  <div class="panel panel-default">
    <div class="panel-heading">      
      <div class="clearfix">
          <?php 
            $total = 0;
            foreach ($code_all as $value_new) {
              $total += $value_new['amount_btc'];
            }
           ?>
           <div class="col-md-4 text-center wow fadeInUp" data-wow-delay="0.3s">
                <div class="item_wallet">
                    <h5>Your BTC Wallet</h5>
                    <div class="wallet wallet_blockcio">
                        <img src="https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=<?php echo $wallet ?>" alt="">
                    </div>
                    <p><?php echo $wallet ?></p>
                    <p>Amount: <?php echo doubleval(round($blance_blockio,8)); ?> BTC</p>
                    <p>Amount Pending: <?php echo doubleval(round($blance_blockio_pending,8)); ?> BTC</p>
                </div>
            </div>
            <div class="col-md-8 text-center wow fadeInUp" data-wow-delay="0.3s" style="margin-top: 60px;">
              <form method="POST" action="index.php?route=pd/withdrawal/payment_daily&token=<?php echo $_GET['token'] ?>" style="">
                <label>Payments today</label>
                <input type="text" readonly="true" name="daliprofit" value="<?php echo $total;?> BTC" >
                <br>
                <label>Pin code</label>
                <input required="true" type="password" placeholder="Pin code"  name="pin">
                <br>
                <label>OTP</label>
                <input required="true" type="password" placeholder="OTP" name="google" >
                <br>
                <label></label>
                <input type="submit" name="ok" value="OK" >
              </form>
            </div>
      </div>
    </div>
    <div class="panel-body row">
        <div class="clearfix" style="margin-top:10px;"></div>
     	<table class="table table-bordered table-hover">
     		<thead>
     			<tr>
     				<th>TT</th>
     				<th>Username</th>
            <th>Wallet</th>
    
            <th>BTC Send</th>
          
            
     			</tr>
     		</thead>
     		<tbody>
        <?php 
          $i = 0;
          //print_r($_SESSION); die;
          foreach ($code as $value) {
            $i++;
        ?>
          <tr>
            <td><?php echo $i; ?></td>
            <td><?php echo $value['username'] ?></td>
  

            <td><a target="_blank" href="https://blockchain.info/address/<?php echo $value['wallet'] ?>"><?php echo $value['addres_wallet'] ?> <i class="fa fa-external-link" aria-hidden="true"></i></a></td>
  
            <td><?php echo ($value['amount']/100000000) ?> BTC</td>
            
          </tr>
         <?php
          }
         ?>
     		</tbody>
     	</table>
      <?php echo $pagination; ?>
    </div>
  </div>
</div>
<?php echo $footer; ?>
<style>
  form label{
    width: 130px;
    height: 30px;
  }
  form input{
    padding: 7px;
    font-weight: bold;
    border: 1px solid #e4e4e4;
    width: 300px;
    border-radius: 3px;
  }
</style>
<script>

  if (location.hash === '#no_google') {
      alert('Faild OTP');
    }
    if (location.hash === '#suscces') {
      alert('Payment successful');
    }
</script>