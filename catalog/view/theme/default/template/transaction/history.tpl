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
                          <div class="panel-heading">
                                <h3 class="panel-title">History Transaction</h3>
                            </div>
                            <div class="col-md-12">
                        <div class="">
                            
                            <?php if(count($histotys) > 0){ ?>
                            <div class="">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12" id="no-more-tables">
                                        <table id="datatable" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                   <th class="text-center">No.</th>
                                                    <th>Item</th>
                                                    <th>Date</th>
                                                    <th>Amount</th>
                                                    <th>Detail</th>
                                                          
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
                                                                
                                                            </tr>
                                                        <?php $number++; } ?>
                                            </tbody>
                                        </table>
                                  <?php echo $pagination; ?>
                                    </div>
                                </div>
                            </div>
                           <?php } ?>
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