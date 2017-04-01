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
                               <section id="contact-section" class="page text-white parallax" data-stellar-background-ratio="0.5" style="background-image: url(catalog/view/theme/default/style1/img/map-bg.jpg);">
                                  <div class="cover"></div>
                                  
                                       <!-- Begin page header-->
                                      <div class="page-header-wrapper">
                                          <div class="container">
                                              <div class="page-header text-center wow fadeInDown" data-wow-delay="0.4s">
                                                  <h2>Your transaction</h2>
                                                  <div class="devider"></div>
                                                  <p class="subtitle">All enter information</p>
                                              </div>
                                          </div>
                                      </div>
                                      <!-- End page header-->
                                      
                                      <div class="contact wow bounceInRight" data-wow-delay="0.4s">
                                          <div class="container ">
                                              <div class="row">
                                               
                                                <div class="col-sm-12">
                                                    <div class="contact-form sale-purchase">
                                                        <form role="form" action="<?php echo $url_submit; ?>" method="POST" id="form_buy">
                                                         
                                                          <div class="form-group">
                                                              <input id="amount" data-max="<?php echo $getbuy['amount'] ?>" name="amount" type="text" class="form-control input-lg" placeholder="Quantity purchased">
                                                          </div>
                                                          <p class="col-md-12 error error_amount_max">Quantity does not exceed <?php echo $getbuy['amount'] ?></p>
                                                          <p class="col-md-12 error error_amount">Please enter the number of buyers</p>
                                                          <p class="col-md-12 error error_amount_btc">BTC number in your wallet only <?php echo $blance;?> BTC</p>
                                                          <div class="form-group">
                                                              <input id="price" value="<?php echo $getbuy['price'] ?>"  name=price type="text" class="form-control input-lg" placeholder="Price" required readonly="true">
                                                          </div>
                                                          
                                                          <div class="form-group">
                                                              <input type="text" id="num_btc" data-btc="<?php echo $blance;?>" name="numbtc" class="form-control input-lg" placeholder="Number BTC" required readonly="true">
                                                          </div>
                                                          <div class="form-group">
                                                              <input type="text" id="wallet" name="wallet" class="form-control input-lg" value="<?php echo $getCustomer_wallet['wallet'];?>" placeholder="Number BTC" required readonly="true">
                                                          </div>
                                                          <input type="hidden" name="token" value="<?php echo $getbuy['gd_number'] ?>">
                                                          <button type="submit" class="btn wow  btn-sale-purchase" data-wow-delay="0.8s">Send</button>
                                                        </form>
                                                    </div>  
                                                </div>
                                                                                                      
                                              </div> <!-- /.row -->
                                          </div> <!-- /.container -->
                                      </div>
                                  </section>
                            </div>
                            
                            
                        </div> 
                    </div>
                </div>
               
            </section>
            

<?php echo $self->load->controller('common/footer_transaction') ?>