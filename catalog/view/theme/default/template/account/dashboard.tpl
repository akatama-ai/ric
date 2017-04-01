<?php $self->document->setTitle("Home"); echo $self->load->controller('common/header');?>
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
                        <h1>DASHBOARD</h1>

                    </div>
                </div>
                <!-- Page Top -->

                

                <section>
                   
                          
                                      
                        


                    <div class="block">
                         <?php if (intval($user) > 0) {  ?>
        
                                <div class="col-sm-12">
                                   <div class="panel panel-success">
                                <div class="panel-heading">
                                   <h3 class="panel-title">New user Register</h3>
                                </div>
                                <div class="panel-body">
                                    <?php if(count($user) > 0){ ?>
         <div class="card">
            <div  id="no-more-tables" class="card-body table-responsive">
                <div id="no-more-tables">
                                        <table id="datatable" class="table  table-hover">
                     <thead>
                        <tr>
                          <th class="text-center">No</th>
                          <th>Username</th>
                        
                          <th>Email</th>
                          <th>Phone number</th>
                          <th>Wallet</th>
                           <th>Date Join</th>
                          <th>Action</th>
                        </tr>
                     </thead>
                     <tbody>
                        <?php $number = 1; foreach ($user as $key => $value) {?>
                            <tr>
                                 <td data-title="NO" align="center"><?php echo $number ?></td>
                                <td data-title="Username"><?php echo $value['username'] ?></td>
                              
                                 <td data-title="Email"><?php echo $value['email'] ?></td>
                                 <td data-title="Phone Number"><?php echo $value['telephone'] ?></td>
                                <td data-title="Wallet"><?php echo $value['wallet'] ?></td>
                                <td data-title="Date Join"><?php echo date("d/m/Y H:i A", strtotime($value['date_added'])); ?></td>
                                
                                <td data-title="Action">
                                    <a href="user?id=<?php echo $value['customer_code'] ?>" class="btn btn-info ">Update User</a>
                                </td>
                            </tr>
                        <?php $number++; } ?>
                     </tbody>
                  </table>
               </div>
         </div>
         <?php } ?>
                                </div>
                             </div>
                                   
                               

                            </div>
                            <?php } ?>
                    </div>

                    <div class="block">
                        <div class="col col-xs-12 col-sm-12 col-md-6 col-xl-5 stats-col">
                                <div class="card sameheight-item stats" data-exclude="xs" style="min-height: 410px; padding:15px 0">
                                    <div class="card-block">
                                     
                                        <div class="row row-sm stats-container">
                                            <div class="col-xs-12 col-sm-6 stat-col">
                                                <div class="stat-icon"> <i class="fa fa-rocket"></i> </div>
                                                <div class="stat">
                                                    <div class="value"> <?php echo $countPD; ?> USD </div>
                                                    <div class="name">Total Investment </div>
                                                </div> <progress class="progress stat-progress" value="75" max="100">
                                <div class="progress">
                                    <span class="progress-bar" style="width: 75%;"></span>
                                </div>
                            </progress> </div>
                                            <div class="col-xs-12 col-sm-6 stat-col">
                                                <div class="stat-icon"> <i class="fa fa-shopping-cart"></i> </div>
                                                <div class="stat">
                                                    <div class="value"> <?php echo $getR_Wallet_payment; ?> USD </div>
                                                    <div class="name">  Static rate daily </div>
                                                </div> <progress class="progress stat-progress" value="25" max="100">
                                <div class="progress">
                                    <span class="progress-bar" style="width: 25%;"></span>
                                </div>
                            </progress> </div>
                            <div class="col-xs-12 col-sm-6  stat-col">
                                                <div class="stat-icon"> <i class="fa fa-users"></i> </div>
                                                <div class="stat">
                                                    <div class="value"> <?php echo $getCWallet ?> USD </div>
                                                    <div class="name"> Direct commission </div>
                                                </div> <progress class="progress stat-progress" value="34" max="100">
                                <div class="progress">
                                    <span class="progress-bar" style="width: 34%;"></span>
                                </div>
                            </progress> </div>
                                            <div class="col-xs-12 col-sm-6  stat-col">
                                                <div class="stat-icon"> <i class="fa fa-line-chart"></i> </div>
                                                <div class="stat">
                                                    <div class="value"> <?php echo $getCNWallet ?> USD </div>
                                                    <div class="name"> Binary bonus </div>
                                                </div> <progress class="progress stat-progress" value="60" max="100">
                                <div class="progress">
                                    <span class="progress-bar" style="width: 60%;"></span>
                                </div>
                            </progress> </div>
                                            
                                            
                                            
                            <div class="col-xs-12 col-sm-6 stat-col">
                                                <div class="stat-icon"> <i class="fa fa-btc"></i> </div>
                                                <div class="stat">
                                                    <div class="value"> <?php echo $total_pd_left ;?> USD </div>
                                                    <div class="name">  Binary - Left </div>
                                                </div> <progress class="progress stat-progress" value="15" max="100">
                                <div class="progress">
                                    <span class="progress-bar" style="width: 15%;"></span>
                                </div>
                            </progress> </div>
                            <div class="col-xs-12 col-sm-6 stat-col">
                                                <div class="stat-icon"> <i class="fa fa-btc"></i> </div>
                                                <div class="stat">
                                                    <div class="value"> <?php echo $total_pd_right ;?> USD</div>
                                                    <div class="name">  Binary - Right </div>
                                                </div> <progress class="progress stat-progress" value="15" max="100">
                                <div class="progress">
                                    <span class="progress-bar" style="width: 15%;"></span>
                                </div>
                            </progress> </div>
                            <div class="col-xs-12 col-sm-6  stat-col">
                                                <div class="stat-icon"> <i class="fa fa-list-alt"></i> </div>
                                                <div class="stat">
                                                    <div class="value"> <?php echo $getMWallet ?> USD </div>
                                                    <div class="name"> Re-Investment </div>
                                                </div> <progress class="progress stat-progress" value="49" max="100">
                                <div class="progress">
                                    <span class="progress-bar" style="width: 49%;"></span>
                                </div>
                            </progress> </div>
                             <div class="col-xs-12 col-sm-6 stat-col">
                            <div class="card sameheight-item stats">
                          
                                 <div class="stat-icon"> <i class="fa fa-btc"></i> </div>
                                                <div class="stat">
                                                    <div class="value"> <?php echo $get_m_walleet['amount'] ?> USD </div>
                                                    <div class="name"> Balance </div>
                                                </div> <progress class="progress stat-progress" value="15" max="100">
                                <div class="progress">
                                    <span class="progress-bar" style="width: 15%;"></span>
                                </div>
                            </progress> 
                            </div>
                                               
                        </div>
                        <div class="col-md-12">
                            <h3 style=" margin: 0; ">Referral Link</h3>
                                <input style="width:100%;border:none;color: #2196f3;font-size: 16px;display: block; margin-bottom: 8px;" readonly class="js-copytextarea"value="<?php echo HTTPS_SERVER.'register?ref='.$customer_code; ?>" title="<?php echo HTTPS_SERVER.'register?ref='.$customer_code; ?>">
                              
                                <button class="btn btn-default js-textareacopybtn">COPY Referral Link</button>
                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col col-xs-12 col-sm-12 col-md-6 col-xl-7 stats-col">
                                <div class="card sameheight-item stats" data-exclude="xs" style="height: 322px;">
                                    <div id="gobtc-widget-chart" style="background-color:#fcfcfc; height: 322px;" data-lang="en" ></div>
<script type="text/javascript" src="https://widgets.gobitcoin.io/chart.js"></script>
                                </div>
                            </div>
                    </div>
                </section>
            </div>
        </div>
    </div>

    <!-- /#page-content-wrapper -->
    <script type="text/javascript">

                                  var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

                                  copyTextareaBtn.addEventListener('click', function(event) {
                                    var copyTextarea = document.querySelector('.js-copytextarea');
                                    copyTextarea.select();

                                    try {
                                      var successful = document.execCommand('copy');
                                      var msg = successful ? 'successful' : 'unsuccessful';
                                      console.log('Copying text command was ' + msg);
                                    } catch (err) {
                                      console.log('Oops, unable to copy');
                                    }
                                  });
                                          </script>

    <?php echo $self->load->controller('common/footer') ?>