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
                              <div class="col-md-6 width50">
                                    <div class="col-md-12 text-center wow zoomIn">
                                        <h2>Buyer</h2>
                                    </div>
                                    <div class="col-md-12">
                                        <table class="table table-bordered wow zoomIn" data-wow-delay="0.2s" style="margin: auto; margin-bottom: 20px; font-size: 11pt;">
                                            <thead>
                                              <tr>
                                                <th colspan="2" style="background: #364150; line-height: 50px; color: #fff;font-size: 14pt;"><?php $username = $self->getCustomer_buyid($get_tranferlist['pd_id_customer']); echo $username['username'] ?>
                                                  
                                                  <?php 
                                                  $username_pd = $self->getCustomer_buyid($get_tranferlist['pd_id_customer']);
                                                  
                                                  if ($username_pd['img_profile'] == "") { ?>
                                                    <img class="img_profile pull-right" src="catalog/view/theme/default/style1/img/team/1.jpg">
                                                  <?php } else { ?>
                                                    <img class="img_profile pull-right" src="<?php echo $username_pd['img_profile'] ?>">
                                                  <?php }  ?>
                                                </div>
                                                </th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                              <tr>
                                                <td>Amount</td>
                                                <td><?php echo $get_tranferlist['amount'] ?></td>
                                              </tr>
                                              <tr>
                                                <td>Price</td>
                                                <td><?php echo $get_tranferlist['price'] ?></td>
                                              </tr>
                                              <tr>
                                                <td>Number BTC</td>
                                                <td><?php echo $get_tranferlist['numbtc'] ?> BTC</td>
                                              </tr>
                                              <tr>
                                                <td>Date Add</td>
                                                <td><?php echo date('d/m/Y H:i', strtotime($get_tranferlist['date_added'])) ?></td>
                                              </tr>
                                              <tr>
                                                <td>Wallet</td>
                                                <td><?php echo $get_tranferlist['wallet'] ?></td>
                                              </tr>
                                              <tr>
                                                <td>Buyer</td>
                                                <td><?php $username_gd = $self->getCustomer_buyid($get_tranferlist['gd_id_customer']); echo $username_gd['username'] ?></td>
                                              </tr>
                                              
                                              <?php if ($get_tranferlist['gd_status'] == 0 && $self->session->data['customer_id'] == $get_tranferlist['pd_id_customer']) { ?>
                                              <tr>
                                                <td class="text-center" colspan="2">
                                                  <a class="btn-lg btn btn-warning" href="<?php echo $url_confirm_buy ?>">Agreed transaction</a></td>
                                                  

                                                <?php } 
                                                if ($get_tranferlist['gd_status'] == 1 && $self->session->data['customer_id'] == $get_tranferlist['pd_id_customer']) { ?>
                                                <td class="text-center" colspan="2">
                                                  <span type="button" class="btn btn-lg btn-success">Finish</span>
                                               
                                                </td>
                                              </tr>
                                               <?php } ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-md-6 width50">
                                    <div class="col-md-12 text-center wow zoomIn">
                                        <h2>Salesman</h2>
                                    </div>
                                    
                                    <div class="col-md-12">
                                      <table class="table table-bordered wow zoomIn" data-wow-delay="0.2s" style="margin: auto; margin-bottom: 20px; font-size: 11pt;">
                                            <thead>
                                              <tr>
                                                <th colspan="2" style="background: #364150; line-height: 50px; color: #fff; font-size: 14pt;"><?php $username_gd = $self->get_gd_username($get_tranferlist['gd_id']); echo $username_gd['username'];
                                                  if ($username_gd['img_profile'] == "") { ?>
                                                    <img class="img_profile pull-right" src="catalog/view/theme/default/style1/img/team/1.jpg">
                                                  <?php } else { ?>
                                                    <img class="img_profile pull-right" src="<?php echo $username_gd['img_profile'] ?>">
                                                  <?php }?>
                                              </th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                            
                                              <tr>
                                                <td>The maximum sales</td>
                                                <td><?php echo $username_gd['amount'] ?></td>
                                              </tr>
                                              <tr>
                                                <td>Price</td>
                                                <td><?php echo $username_gd['price'] ?></td>
                                              </tr>
                                              <tr>
                                                <td>Date Add</td>
                                                <td><?php echo date('d/m/Y H:i', strtotime($username_gd['date_added'])) ?></td>
                                              </tr>
                                              <tr>
                                                <td>Wallet</td>

                                                <td><?php print_r( $self->getCustomer_wallet( $username_gd['customer_id'])['wallet']) ?></td>
                                              </tr>
                                              <?php $getCustomer_gd = $self->getCustomer_buyid($username_gd['customer_id']) ?>
                                              <tr>
                                                <td>Telephone</td>
                                                <td><?php echo $getCustomer_gd['telephone'];?></td>
                                              </tr>
                                              <tr>
                                                <td>Email</td>
                                                <td><?php echo $getCustomer_gd['email'];?></td>
                                              </tr>
                                              <?php if ($get_tranferlist['gd_status'] == 1 && $self->session->data['customer_id'] == $get_tranferlist['pd_id_customer']) { ?>
                                               <tr>
                                                <td colspan="2" class="text-center">
                                              
                                              
                                                <button class="btn btn-warning btn-lg"><i class="fa fa-refresh fa-spin"></i> Waitting</button>
                                                
                                                </td>
                                                </tr>
                                              <?php
                                                } 
                                                 ?>
                                              
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