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
                            
                                <div class="col-md-6 width50">
                                    <div class="col-md-12 text-center">
                                        <h2>List Buyer</h2>
                                    </div>
                                    
                                      <?php 
                                        foreach ($buy as $value) {
                                          
                                      ?>
                                         <div class="item rotate-box-1 square-icon wow zoomIn" data-wow-delay="0.2s">
                                            <a href="<?php echo $url_buy."&token=".$value['gd_number']; ?>">
                                                <div class="col-md-10 col-sm-10 col-xs-10">
                                                  <h4 class="padd20 padd10">Username: <span class="color1"><?php echo $value['username'] ?></span></h4>
                                                  <h4 class="padd10">Amount: <span class="color2"><?php echo $value['amount'] ?></span></h4>
                                                  <h4 class="padd10">Price: <span class="color3"><?php echo $value['price'] ?> BTC</span></h4>
                                                </div>
                                                <div class="col-md-2 col-sm-2 col-xs-2">
                                                  <?php if ($value['img_profile'] == "") { ?>
                                                    <img src="catalog/view/theme/default/style1/img/team/1.jpg">
                                                  <?php } else { ?>
                                                    <img src="<?php echo $value['img_profile'] ?>">
                                                  <?php }  ?>
                                                </div>
                                            </a>
                                          </div>
                                          
                                      <?php
                                        }
                                      ?>
                                    
                                    
                                    <div class="col-md-12 rotate-box-1 square-icon wow zoomIn text-center" data-wow-delay="0.2s" style="padding-left: 15px;">
                                        <?php echo $pagination_buy; ?>
                                    </div>
                                </div>
                                <div class="col-md-6 width50">
                                    <div class="col-md-12 text-center">
                                        <h2>List Sale</h2>
                                    </div>
                                   
                                      <?php 
                                        foreach ($sell as $value) {
                                          
                                      ?>
                                         <div class="item rotate-box-1 square-icon wow zoomIn" data-wow-delay="0.2s">
                                            <a href="<?php echo $url_sell."&token=".$value['pd_number']; ?>">
                                                <div class="col-md-10 col-sm-10 col-xs-10">
                                                  <h4 class="padd20 padd10">Username: <span class="color1"><?php echo $value['username'] ?></span></h4>
                                                  <h4 class="padd10">Amount: <span class="color2"><?php echo $value['amount'] ?></span></h4>
                                                  <h4 class="padd10">Price: <span class="color3"><?php echo $value['price'] ?> BTC</span></h4>
                                                </div>
                                                <div class="col-md-2 col-sm-2 col-xs-2">
                                                  <?php if ($value['img_profile'] == "") { ?>
                                                    <img src="catalog/view/theme/default/style1/img/team/1.jpg">
                                                  <?php } else { ?>
                                                    <img src="<?php echo $value['img_profile'] ?>">
                                                  <?php }  ?>
                                                </div>
                                            </a>
                                          </div>
                                      <?php
                                        }
                                      ?>
                                    
                                    
                                    <div class="col-md-12 rotate-box-1 square-icon wow zoomIn text-center" data-wow-delay="0.2s" style="">
                                        <?php echo $pagination_sell; ?>
                                    </div>
                                   
                          
                                    </div>
                                   
                                
                            </div>

                        </div> 
                    </div>
               
            </section>
            

<?php echo $self->load->controller('common/footer_transaction') ?>

 <script type="text/javascript">
            $(document).ready(function() {
                $('#datatable').dataTable();
            } );
        </script>
<?php echo $self->load->controller('common/footer') ?>
