<?php $self -> document -> setTitle("Invesment Detail"); echo $self -> load -> controller('common/header');  ?>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/flipster/jquery.flipster.css" />

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
                        <h1>Deposite</h1>

                    </div>
                </div>
                <!-- Page Top -->

                <section>
                    <div class="block">
                        <div class="col-md-12 pro-col">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Orders</h3>
                                </div>
                                <div class="panel-body">
                                    <?php if(count($pds) > 0){?>
                                    <div id="no-more-tables" class="table-responsive">
                                        <table id="datatable" class="table  table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Code</th>
                                                    <th>Time Created</th>
                                                    <th>Price</th>
                                                    <th>Profit</th>
                                                    <th>status</th>
                                                    <th>Time</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php foreach ($pds as $value=> $key){?>
                                                <tr>
                                                    <td data-title="Code">#
                                                        <?php echo $key['pd_number'] ?>
                                                    </td>
                                                    <td data-title="Date Created">
                                                        <?php echo date("Y-m-d H:i:A", strtotime($key['date_added'])); ?>
                                                    </td>

                                                    <td data-title="Packet">
                                                        <?php echo number_format($key['filled']) ?> USD
                                                    </td>
                                                    <td data-title="Profit">
                                                        <?php echo ($key['max_profit']) ?> USD</td>
                                                    <td data-title="Status" class="status">
                                                        <?php
                                                                        switch (intval($key['status'])) {
                                                                            case 0:
                                                                                echo '<span class="label label-default">Waitting</span>';
                                                                                break;
                                                                            case 1:
                                                                                echo '<span class="label label-info">Active</span>';
                                                                                break;
                                                                            case 2:
                                                                                echo '<span class="label label-success">Finish</span>';
                                                                                break;
                                                                        }
                                                                    ?>
                                                    </td>
                                                    <td data-title="Time"> <span style="color:; font-size:15px;" class="text- countdown" data-countdown="<?php echo  $key['date_finish'] ?>"> </span> </td>
                                                </tr>
                                                <?php }?>
                                            </tbody>
                                        </table>
                                    </div>

                                    <?php } ?>
                                </div>
                            </div>
                            <?php if(count($pd_re_investment) > 0){?>
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Re-Investment actived</h3>
                                </div>
                                <div class="panel-body">




                                    <div id="no-more-tables">
                                        <table id="datatable" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Code</th>
                                                    <th>Date Created</th>
                                                    <th>Packet</th>
                                                    <th>Profit</th>
                                                    <th>status</th>
                                                    <th>Time</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php foreach ($pd_re_investment as $value=> $key){?>
                                                <tr>
                                                    <td data-title="Code">#
                                                        <?php echo $key['pd_number'] ?>
                                                    </td>
                                                    <td data-title="Date Created">
                                                        <?php echo date("Y-m-d H:i:A", strtotime($key['date_added'])); ?>
                                                    </td>

                                                    <td data-title="Packet">
                                                        <?php echo number_format($key['filled']) ?> USD
                                                    </td>
                                                    <td data-title="Profit">
                                                        <?php echo ($key['max_profit']) ?> USD</td>
                                                    <td data-title="Status" class="status">
                                                        <?php
                                                                        switch (intval($key['status'])) {
                                                                            case 0:
                                                                                echo '<span class="label label-default">Waitting</span>';
                                                                                break;
                                                                            case 1:
                                                                                echo '<span class="label label-info">Active</span>';
                                                                                break;
                                                                            case 2:
                                                                                echo '<span class="label label-success">Finish</span>';
                                                                                break;
                                                                        }
                                                                    ?>
                                                    </td>
                                                    <td data-title="Time"> <span style="color:; font-size:15px;" class="text- countdown" data-countdown="<?php echo  $key['date_finish'] ?>"> </span> </td>
                                                </tr>
                                                <?php }?>
                                            </tbody>
                                        </table>
                                    </div>


                                </div>
                            </div>
                            <?php } ?>
                        </div>
    
                    </div>
                </section>
                <section>
                    <div class="block" style=" background: #0f282f; ">
                        <div class="col-md-12">
                            <div class="special">
      <div class="">
      
         <div class="wthree-special-grid">
            <div class="flipster">
              <ul>
               <li>
                  <div class="pricing">
                    <?php $packet = $self -> check_packet_pd (50) ;?>
                           <?php if(count($packet) > 0) { ?>
                              <div class="ribbon-wrapper">
                                 <?php if (intval($packet['status']) === 0) {?>
                                    <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                                 <?php } else { ?>
                                    <div class="ribbon-design red"style="background-color:#9cfd00">Actived</div>
                                 <?php }?>
                              </div>
                           <?php }?>
                     <div class="pricing-top green-top">
                        <h3>100 DAYS</h3>
                        <p>Static rate daily: 1.6%</p>
                     </div>
                     <div class="pricing-bottom">
                        <div class="pricing-bottom-top">
                           <h1><img src="catalog/view/theme/default/fre/images/plan/002.png" class="img-responsive"></h1>
                        </div>
                        <div class="pricing-bottom-bottom">
                           
                          
                           <p>Earn <span>0.8 USD daily</span></p>
                           <p>Earn <span>0.2 USD/6 hrs</span></p>
                           <p>Direct commission: <span>10%</span></p>
                        </div>
                        <div class="buy-button">
                           <?php if (count($packet) === 0) {?>
                                 <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="0">
                                    <button class="dark-btn">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="dark-btn">Reviews</button>
                                 </form>
                              <?php } ?>
                        </div>
                     </div>
                  </div>
               </li>
               <li>
                  <div class="pricing">
                    <?php $packet = $self -> check_packet_pd (200) ;?>
                           <?php if(count($packet) > 0) { ?>
                              <div class="ribbon-wrapper">
                                 <?php if (intval($packet['status']) === 0) {?>
                                    <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                                 <?php } else { ?>
                                    <div class="ribbon-design red"style="background-color:#9cfd00">Actived</div>
                                 <?php }?>
                              </div>
                           <?php }?>
                     <div class="pricing-top blue-top">
                        <h3>100 DAYS</h3>
                        <p>Static rate daily: 1.6%</p>
                     </div>
                     <div class="pricing-bottom">
                        <div class="pricing-bottom-top">
                           <h1><img src="catalog/view/theme/default/fre/images/plan/003.png" class="img-responsive"></h1>
                        </div>
                        <div class="pricing-bottom-bottom">
                           
                          
                           <p>Earn <span>3.2 USD daily</span></p>
                           <p>Earn <span>0.8 USD/6 hrs</span></p>
                           <p>Direct commission: <span>10%</span></p>
                        </div>
                        <div class="buy-button">
                           <?php if (count($packet) === 0) {?>
                                 <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="1">
                                    <button class="dark-btn">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="dark-btn">Reviews</button>
                                 </form>
                              <?php } ?>
                        </div>
                     </div>
                  </div>
               </li>
               <li>
                  <div class="pricing">
                    <?php $packet = $self -> check_packet_pd (500) ;?>
                           <?php if(count($packet) > 0) { ?>
                              <div class="ribbon-wrapper">
                                 <?php if (intval($packet['status']) === 0) {?>
                                    <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                                 <?php } else { ?>
                                    <div class="ribbon-design red"style="background-color:#9cfd00">Actived</div>
                                 <?php }?>
                              </div>
                           <?php }?>
                     <div class="pricing-top">
                        <h3>100 DAYS</h3>
                        <p>Static rate daily: 1.8%</p>
                     </div>
                     <div class="pricing-bottom">
                        <div class="pricing-bottom-top">
                          <h1><img src="catalog/view/theme/default/fre/images/plan/004.png" class="img-responsive"></h1>
                        </div>
                        <div class="pricing-bottom-bottom">
                           
                          
                           <p>Earn <span>9 USD daily</span></p>
                           <p>Earn <span>2.25 USD/6 hrs</span></p>
                           <p>Direct commission: <span>10%</span></p>
                        </div>
                        <div class="buy-button">
                           <?php if (count($packet) === 0) {?>
                                 <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="2">
                                    <button class="dark-btn">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="dark-btn">Reviews</button>
                                 </form>
                              <?php } ?>
                        </div>
                     </div>
                  </div>
               </li>
               <li>
                  <div class="pricing">
                    <?php $packet = $self -> check_packet_pd (1000) ;?>
                           <?php if(count($packet) > 0) { ?>
                              <div class="ribbon-wrapper">
                                 <?php if (intval($packet['status']) === 0) {?>
                                    <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                                 <?php } else { ?>
                                    <div class="ribbon-design red"style="background-color:#9cfd00">Actived</div>
                                 <?php }?>
                              </div>
                           <?php }?>
                     <div class="pricing-top blue-top">
                        <h3>100 DAYS</h3>
                        <p>Static rate daily: 2%</p>
                     </div>
                     <div class="pricing-bottom">
                        <div class="pricing-bottom-top">
                          <h1><img src="catalog/view/theme/default/fre/images/plan/005.png" class="img-responsive"></h1>
                        </div>
                        <div class="pricing-bottom-bottom">
                           
                          
                           <p>Earn <span>20 USD daily</span></p>
                           <p>Earn <span>5 USD/6 hrs</span></p>
                           <p>Direct commission: <span>10%</span></p>
                        </div>
                        <div class="buy-button">
                           <?php if (count($packet) === 0) {?>
                                 <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="3">
                                    <button class="dark-btn">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="dark-btn">Reviews</button>
                                 </form>
                              <?php } ?>
                        </div>
                     </div>
                  </div>
               </li>
               <li>
                  <div class="pricing">
                    <?php $packet = $self -> check_packet_pd (5000) ;?>
                           <?php if(count($packet) > 0) { ?>
                              <div class="ribbon-wrapper">
                                 <?php if (intval($packet['status']) === 0) {?>
                                    <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                                 <?php } else { ?>
                                    <div class="ribbon-design red"style="background-color:#9cfd00">Actived</div>
                                 <?php }?>
                              </div>
                           <?php }?>
                     <div class="pricing-top green-top">
                        <h3>100 DAYS</h3>
                        <p>Static rate daily: 2.2%</p>
                     </div>
                     <div class="pricing-bottom">
                        <div class="pricing-bottom-top">
                           <h1><img src="catalog/view/theme/default/fre/images/plan/006.png" class="img-responsive"></h1>
                        </div>
                        <div class="pricing-bottom-bottom">
                           
                          
                           <p>Earn <span>110 USD daily</span></p>
                           <p>Earn <span>27.5 USD/6 hrs</span></p>
                           <p>Direct commission: <span>10%</span></p>
                        </div>
                        <div class="buy-button">
                           <?php if (count($packet) === 0) {?>
                                 <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="4">
                                    <button class="dark-btn">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="dark-btn">Reviews</button>
                                 </form>
                              <?php } ?>
                        </div>
                     </div>
                  </div>
               </li>
               <li>
                  <div class="pricing">
                    <?php $packet = $self -> check_packet_pd (10000) ;?>
                           <?php if(count($packet) > 0) { ?>
                              <div class="ribbon-wrapper">
                                 <?php if (intval($packet['status']) === 0) {?>
                                    <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                                 <?php } else { ?>
                                    <div class="ribbon-design red"style="background-color:#9cfd00">Actived</div>
                                 <?php }?>
                              </div>
                           <?php }?>
                     <div class="pricing-top">
                        <h3>100 DAYS</h3>
                        <p>Static rate daily: 2.5%</p>
                     </div>
                     <div class="pricing-bottom">
                        <div class="pricing-bottom-top">
                          <h1><img src="catalog/view/theme/default/fre/images/plan/007.png" class="img-responsive"></h1>
                        </div>
                        <div class="pricing-bottom-bottom">
                           
                          
                           <p>Earn <span>250 USD daily</span></p>
                           <p>Earn <span>62.5 USD/6 hrs</span></p>
                           <p>Direct commission: <span>10%</span></p>
                        </div>
                        <div class="buy-button">
                           <?php if (count($packet) === 0) {?>
                                 <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="5">
                                    <button class="dark-btn">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="dark-btn">Reviews</button>
                                 </form>
                              <?php } ?>
                        </div>
                     </div>
                  </div>
               </li>
               
              </ul>
            </div>
         </div>
      </div>
   </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>

<?php echo $self->load->controller('common/footer') ?>
 <script src="catalog/view/javascript/flipster/jquery.flipster.js"></script>
     <script type="text/javascript">
       $(function(){ $(".flipster").flipster({ style: 'carousel', start: 0 }); });
       </script>