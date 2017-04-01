<?php 
   $self -> document -> setTitle($lang['heading_title']); 
   echo $self -> load -> controller('common/header'); 
   
   ?>
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
                        <h1> Affiliates</h1>

                    </div>
                </div>
                <!-- Page Top -->
              
                <section>
                    <div class="block">
                      
                                <div class="col-md-12 pro-col">
                                  <div class="panel panel-info">
                                    <div class="panel-heading">
                                      <h3 class="panel-title"> Affiliates</h3>
                                    </div>
                                    <div class="panel-body">
                                      <div id="no-more-tables"class="table-responsive">
                                        <table id="datatable" class="table  table-hover">
                                            <thead>
                           <tr>
                              <th class="text-center">No.</th>
                              <th>Username</th>
                              <!-- <th>Level</th> -->
                              <!-- <th>QR Code</th> -->
                              <th>Phone</th>
                              <th>Email</th>
                              <th>Country</th>
                              <!-- <th>Date Create</th> -->
                           </tr>
                        </thead>
                        <tbody>
                           <?php $count = 1; foreach ($refferals as $key => $value) { ?>
                           <tr>
                              <td data-title="<?php echo $lang['NO'] ?>." align="center"><?php echo $count ?></td>
                              <td data-title="<?php echo $lang['USERNAME'] ?>"><?php echo $value['username'] ?></td>
                              <!-- <td data-title="LEVEL">
                                 <?php echo "L".(intval($value['level']) - 1) ?>
                              </td> -->
                             <!--  <td class="text-center" data-title="<?php echo $lang['WALLET'] ?>" >
                                 
                                 <img src="https://chart.googleapis.com/chart?chs=75x75&chld=L|0&cht=qr&chl=bitcoin:<?php echo $value['wallet']; ?>">
                                 
                              </td> -->
                              <td data-title="<?php echo $lang['TELEPHONE'] ?>" >
                                 <?php echo $value['telephone']; ?>
                              </td>
                              <td data-title="<?php echo $lang['EMAIL'] ?>"><?php echo $value['email'] ?></td>
                              <td data-title="<?php echo $lang['COUNTRY'] ?>"><?php echo $self->getCountry($value['country_id']); ?></td>
                             <!--  <td data-title="DATE CREATED"><?php echo date("d/m/Y H:i A", strtotime($value['date_added'])); ?></td> -->
                           </tr>
                           <?php $count++; } ?>
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
<?php echo $self->load->controller('common/footer') ?>
