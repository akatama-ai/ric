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
                        <h1>Payment History</h1>

                    </div>
                </div>
                <!-- Page Top -->
                <div class="col-md-12">
                   <nav class="nav-history">
            <ul>
              <li><a href="everyday-profit.html" title="">Daily Profit</a></li>
              <li><a href="binary-profit.html" title="">Pairing Bonus</a></li>
              <li><a href="refferal-profit.html" title="">Refferal Profit</a></li>
              <li><a href="reinvestment-history.html" title="">Re-Investment</a></li>
            </ul>
          </nav>
                </div>

                <section>
                    <div class="block">
                      
                                <div class="col-md-12 pro-col">
                                  <div class="panel panel-info">
                                    <div class="panel-heading">
                                      <h3 class="panel-title">Refferal Profit</h3>
                                    </div>
                                    <div class="panel-body">
                                      <div id="no-more-tables"class="table-responsive">
                                        <table id="datatable" class="table  table-hover">
                                            <thead>
                                                <tr>
                                                   <th class="text-center"><?php echo $lang['column_no'] ?></th>
                                                          <th><?php echo $lang['column_wallet'] ?></th>
                                                          <th><?php echo $lang['column_date_added'] ?></th>
                                                          <th><?php echo $lang['column_amount'] ?></th>
                                                          <th><?php echo $lang['column_description'] ?></th>
                                                          <th>Link</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                 <?php $number = 1; foreach ($histotys as $key => $value) {?>
                                                            <tr>
                                                                 <td data-title="<?php echo $lang['column_no'] ?>." align="center"><?php echo $number ?></td>
                                                                <td data-title="<?php echo $lang['column_wallet'] ?>"><?php echo $value['wallet'] ?></td>
                                                                <td data-title="<?php echo $lang['column_date_added'] ?>"><?php echo date("d/m/Y", strtotime($value['date_added'])); ?></td>
                                                                <td data-title="<?php echo $lang['column_amount'] ?>"><?php echo $value['text_amount'] ?></td>
                                                                <td data-title="<?php echo $lang['column_description'] ?>">
                                                                    <?php echo $value['system_decsription'] ?>
                                                                </td>
                                                                <td data-title="Link">
                                                                    <?php if($value['url'] == ' '){
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
<?php echo $self->load->controller('common/footer') ?>

