<?php $self->document->setTitle("Home"); echo $self->load->controller('common/header_transaction'); ?>


            <!-- ========= END HEADER =========-->

            <!-- Begin text carousel intro section -->
            <div id="text-carousel-intro-section" class="parallax slide" data-stellar-background-ratio="0.5" style="background-image: url(catalog/view/theme/default/style1/img/slider-bg.jpg);">
                
                <div class="container">
                    <div class="caption text-center text-white" data-stellar-ratio="0.7">

                        <div id="owl-intro-text" class="owl-carousel">
                            <div class="item">
                                <h1>Welcome</h1>
                                <p>We are pleased to serve you!</p>
                                <div class="extra-space-l"></div>
                            </div>
                            <div class="item">
                                <h1>Join with us</h1>
                                <p>To the greatest Journey</p>
                                <div class="extra-space-l"></div>
                            </div>
                            <div class="item">
                                <h1>I'm Unika</h1>
                                <p>One Page Responsive Theme</p>
                                <div class="extra-space-l"></div>
                            </div>
                        </div>

                    </div> <!-- /.caption -->
                </div> <!-- /.container -->
            </div>
            <!-- End text carousel intro section -->

            <!-- Begin about section -->
      <section id="dashboard" class="page bg-style1">
                <!-- Begin page header-->
                <div class="page-header-wrapper">
                    <div class="container">
                        <div class="page-header text-center wow fadeInUp" data-wow-delay="0.3s">
                           <div class="alert alert-success alert_dashboard">
                              Welcome to the website of the BTC transaction <strong>Mezidas</strong>
                            </div>

                            <div class="devider"></div>
                        </div>
                    </div>
                </div>
                <!-- End page header-->

                <!-- Begin rotate box-1 -->
                <div class="rotate-box-1-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="width50">
                                    <div class="col-md-12 text-center wow zoomIn">
                                        <h2>Salesman</h2>
                                    </div>
                                    
                                    <div class="col-md-12 no-more-tables">
                                     
                                        <table class="table wow zoomIn" data-wow-delay="0.2s" style="margin: auto; margin-bottom: 20px; font-size: 11pt;">
                                            <thead>
                                              <tr>
                                                <th>No</th>
                                                <th>Transfer ID</th>
                                                <th>User Sell (You)</th>
                                                <th>User Buy</th>
                                                <th>Date Create</th>
                                                <th>Amount</th>
                                                <th>Price</th>
                                                <th>Price</th>
                                                <th>Sell Status</th>
                                                <th>Buy Status</th>
                                                <th>Action</th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                              <?php $stt=0; foreach ($history_sell as $key => $value) { ?>
                                              <tr>

                                                <td data-title="No"><?php $stt++; echo $stt; ?></td>
                                                <td data-title="Transfer ID">#<?php echo $value['transfer_code'] ?></td>
                                                <td data-title="User Sell (You)"><?php echo $self -> get_username ($value['pd_id_customer']); ?></td>
                                                 <td data-title="User Buy"><?php echo $self -> get_username ($value['gd_id_customer']); ?></td>
                                                 <td data-title="Date Create"><?php echo date("Y-m-d H:i:A", strtotime($value['date_added'])); ?></td>
                                                <td data-title="Amount"><?php echo $value['amount'] ?></td>
                                                <td data-title="Price"><?php echo $value['price']/100000000 ?></td>
                                                <td data-title="Price"><?php echo $value['numbtc']/100000000 ?></td>
                                                <td data-title="Sell Status" class=""> 
                              <?php
                                 switch ($value['pd_status']) {
                                     case 0:
                                         echo '<span class="label label-default">Waitting</span>';
                                         break;
                                     case 1:
                                         echo '<span class="label label-success">Finish</span>';
                                         break;
                                     case 2:
                                         echo '<span class="label label-danger">Report</span>';
                                         break;
                                     case 3:
                                         echo '<span class="label label-danger">Report</span>';
                                         break;
                                 }
                                 ?> 
                           </td>
                                                 <td data-title="Buy Status" class=""> 
                              <?php
                                 switch ($value['gd_status']) {
                                     case 0:
                                         echo '<span class="label label-default">Waitting</span>';
                                         break;
                                     case 1:
                                         echo '<span class="label label-success">Finish</span>';
                                         break;
                                     case 2:
                                         echo '<span class="label label-danger">Report</span>';
                                         break;
                                     case 3:
                                         echo '<span class="label label-danger">Report</span>';
                                         break;
                                 }
                                 ?> 
                           </td>
                           
                            
                            <td data-title="Action"><a href="index.php?route=transaction/transaction/sell&token=<?php echo $value['transfer_code'] ?>" class="label label-info">View Detail</a></td>
                                
                              </tr>
                              <?php } ?>
                                              
                                              
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                </div>
                                <div class="width50">
                                    <div class="col-md-12 text-center wow zoomIn">
                                        <h2>Buyer</h2>
                                    </div>
                                    <div class="col-md-12 no-more-tables">
                                        <table class="table wow zoomIn" data-wow-delay="0.2s" style="margin: auto; margin-bottom: 20px; font-size: 11pt;">
                                            <thead>
                                              <tr>
                                               <th>No</th>
                                                <th>Transfer ID</th>
                                                <th>User Sell</th>
                                                <th>User Buy (You)</th>
                                                <th>Date Create</th>
                                                <th>Amount</th>
                                                <th>Price</th>
                                                <th>Price</th>
                                                <th>Sell Status</th>
                                                <th>Buy Status</th>
                                                <th>Action</th>
                                              </th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                            
                                             <?php $stt =0; foreach ($history_buy as $key => $value) { ?>
                                              <tr>
                                                <td data-title="No"><?php $stt++; echo $stt; ?></td>
                                                <td data-title="Transfer ID">#<?php echo $value['transfer_code'] ?></td>
                                                <td data-title="User Sell (You)"><?php echo $self -> get_username ($value['pd_id_customer']); ?></td>
                                                 <td data-title="User Buy"><?php echo $self -> get_username ($value['gd_id_customer']); ?></td>
                                                 <td data-title="Date Create"><?php echo date("Y-m-d H:i:A", strtotime($value['date_added'])); ?></td>
                                                <td data-title="Amount"><?php echo $value['amount'] ?></td>
                                                <td data-title="Price"><?php echo $value['price']/100000000 ?></td>
                                                <td data-title="Price"><?php echo $value['numbtc']/100000000 ?></td>
                                                <td data-title="Sell Status" class=""> 
                              <?php
                                 switch ($value['pd_status']) {
                                     case 0:
                                         echo '<span class="label label-default">Waitting</span>';
                                         break;
                                     case 1:
                                         echo '<span class="label label-success">Finish</span>';
                                         break;
                                     case 2:
                                         echo '<span class="label label-danger">Report</span>';
                                         break;
                                     case 3:
                                         echo '<span class="label label-danger">Report</span>';
                                         break;
                                 }
                                 ?> 
                           </td>
                                                 <td data-title="Buy Status" class=""> 
                              <?php
                                 switch ($value['gd_status']) {
                                     case 0:
                                         echo '<span class="label label-default">Waitting</span>';
                                         break;
                                     case 1:
                                         echo '<span class="label label-success">Finish</span>';
                                         break;
                                     case 2:
                                         echo '<span class="label label-danger">Report</span>';
                                         break;
                                     case 3:
                                         echo '<span class="label label-danger">Report</span>';
                                         break;
                                 }
                                 ?> 
                           </td>
                                <td data-title="Action"><a href="index.php?route=transaction/transaction/buy&token=<?php echo $value['transfer_code'] ?>" class="label label-info">View Detail</a></td>
                                               
                                              </tr>
                                              <?php } ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                
                                   
                                </div>
                            </div>

                        </div> 
                    </div>
                </div>
               
            </section>
            
            
<?php echo $self->load->controller('common/footer_transaction') ?>