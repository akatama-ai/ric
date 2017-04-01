<?php $self->document->setTitle("Withdrawal"); echo $self->load->controller('common/header');?>
<div id="wrapper">
    <!-- Sidebar -->
    <?php echo $self->load->controller('common/column_left');  ?>
    <!-- /#sidebar-wrapper -->
    <!-- Page Content -->
    <div id="page-content-wrapper" class="pattern">
        <div class="container-fluid">
            <div class="row minh">
                <div class="pagetop" style=" padding: 20px 0 5px; ">
                    <div class="container">
                        <h1>Withdrawal</h1>

                    </div>
                </div>
                <!-- Page Top -->



                <section>
                    <div class="block">
                         
                           <div class="col-md-4 col-md-push-2 text-center stat-col">
                            <div class="card sameheight-item stats">
                                
                                <p class="text-center">
                                    <img src="catalog/view/theme/default/img/logo.png" style="height: 180px;margin-top: 10px;float: none;" alt="">
                                </p>
                                <div class="clearfix"></div>
                                 <div class="stat-icon"> <i class="fa fa-btc"></i> </div>
                                                <div class="stat">
                                                    <div class="value" style=" margin-bottom: 10px; font-size: 20px; "> <?php echo $get_m_walleet['amount'] ?> USD </div>
                                                    <div class="name"> Balance </div>
                                                </div> <progress class="progress stat-progress" value="15" max="100">
                                <div class="progress">
                                    <span class="progress-bar" style="width: 15%;"></span>
                                </div>
                            </progress> 
                            </div>
                                               
                        </div>

                           <div class="col-md-4 col-md-push-2 text-center">
                              <div class="item_wallet">
                                  <h5>Your Balance Wallet</h5>
                                  <div class="wallet wallet_blockcio">
                                      <img src="https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=<?php echo $customer['wallet'] ?>" alt="" style=" float: none; ">
                                  </div>
                                  <p><?php echo $customer['wallet'] ?></p>
                                  <p>Amount: <?php echo doubleval(round($amount_blockchain,8)); ?> BTC</p>
                                  <!-- <p>Amount Pending: <?php //echo doubleval(round($amount_blockchain_pending,8)); ?> BTC</p> -->
                              </div>
                           </div> 
                        <div class="col-md-12">
                            <form id="tranfer_cm_btc" class="simple-form" style="margin-top: 30px;" action="index.php?route=account/withdraw/submit_my_transaction" method="POST" >
                              <div class="col-md-2 col-md-push-1 wow fadeInUp" data-wow-delay="0.3s">
                                <input autocomplete="off" class="form-control" placeholder="Amount USD" type="text" name="amount_usd" id="amount_usd" data-maxamount_usd="<?php echo ($get_m_walleet['amount']) ?>">
                                 <p class="error error_amount_usd" style="display:none">Please enter a amount > 20USD</p>
                                <p class="error error_amount_max_usd" style="display:none">You can withdraw max <?php echo ($get_m_walleet['amount']) ?> USD</p>
                              </div>
                              <div class="col-md-2 col-md-push-1 wow fadeInUp" data-wow-delay="0.3s">
                                <input autocomplete="off" data-link="<?php echo $self->url->link('account/withdraw/get_btc_usd'); ?>" class="form-control" readonly="true" placeholder="Amount BTC" type="text" name="amount_btc" id="amount_btc">
                              </div>
                              <div class="col-md-3 col-md-push-1  wow fadeInUp" data-wow-delay="0.3s">
                                <input readonly="true" autocomplete="off" class="form-control" placeholder="Password Transaction" type="password" name="password_transaction_btc" id="password_transaction_btc">
                                 <p class="error error_password_transaction_btc" style="display:none">Please enter a Secret answer</p>
                                <p class="error error_password_transaction_deal_btc" style="display:none">Password do not macth</p>
                              </div>
                              <div class="col-md-2 col-md-push-1  wow fadeInUp" data-wow-delay="0.3s">
                               <input class="form-control btn btn-success"  id="" type="submit" value="OK">
                              </div>
                               
                             </form>
                        </div>

                        <div class="col-md-12 pro-col">
                                  <div class="panel panel-info">
                                    <div class="panel-heading">
                                      <h3 class="panel-title">Withdrawal</h3>
                                    </div>
                                    <div class="panel-body">
                                      <div id="no-more-tables"class="table-responsive">
                                        <table id="datatable" class="table  table-hover">
                                            <thead>
                           <tr>
                              <th class="text-center">No.</th>
                                      <th>Item</th>
                                      <th>Date</th>

                                      <th>Amount</th>
                                      <th>Detail</th>
                                      <th>Link</th>
                           </tr>
                        </thead>
                        <tbody>
                           <?php $number = 1; foreach ($histotys as $key => $value) {?>

                                    <tr>
                                         <td data-title="No." align="center"><?php echo $number ?></td>
                                        <td data-title="Item"><?php echo $value['wallet'] ?></td>
                                        <td data-title="Date"><?php echo date("d/m/Y H:i A", strtotime($value['date_added'])); ?></td>
                                        <td data-title="Amount"><?php echo $value['text_amount'] ?></td>
                                        <td data-title="Detail">
                                            <?php echo $value['system_decsription'] ?>
                                        </td>

                                        <td data-title="Link">
                                     <?php if($value['url'] == ''){
                                      echo '<button class="btn btn-xs btn-warning">Pending</button>';
                                      } else{
                                        echo '<button class="btn btn-xs   btn-info">'.$value['url'].'</button>';
                                      
                                        }?>
                                        </td>
                                    </tr>
                                <?php $number++; } ?>
                        </tbody>
                     </table>
                     <?php echo $pagination; ?>
                                    </div>
                                    </div>
                                  </div>
                                   
                                </div> 
                    </div>
                </section>
            </div>
        </div>
    </div>

    <!-- /#page-content-wrapper -->


    <?php echo $self->load->controller('common/footer') ?>