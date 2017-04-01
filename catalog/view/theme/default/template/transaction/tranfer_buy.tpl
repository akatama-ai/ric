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
                            <div class="col-md-8 col-md-push-2">
                                <table class="table table-bordered wow zoomIn" data-wow-delay="0.2s" style="margin: auto; margin-bottom: 20px; font-size: 12pt;">
                                    <thead>
                                      <tr>
                                        <th colspan="2" style="background: #364150; color: #fff; padding: 20px; font-size: 12pt;">Purchase #<?php echo $get_gd_create['gd_number'] ?></th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                      <tr>
                                        <td>Username</td>
                                        <td><?php echo $get_gd_create['username'] ?></td>
                                      </tr>
                                      <tr>
                                        <td>Date add</td>
                                        <td><?php echo date('d/m/Y H:i',strtotime($get_gd_create['date_added'])); ?></td>
                                      </tr>
                                      <tr>
                                        <td>Amount</td>
                                        <td><?php echo $get_gd_create['amount'] ?></td>
                                      </tr>
                                      <tr>
                                        <td>Number BTC</td>
                                        <td><?php echo $get_gd_create['filled']/100000000 ?> BTC</td>
                                      </tr>
                                      
                                    </tbody>
                                </table>
                                    
                            </div>
                            
                            
                        </div> 
                    </div>
                </div>
               
            </section>
            

<?php echo $self->load->controller('common/footer_transaction') ?>