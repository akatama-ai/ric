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
                        <h1>Password</h1>

                    </div>
                </div>
                <!-- Page Top -->
                 <div class="col-md-12">
                   <nav class="nav-history">
            <ul>
              <li><a href="your-profile.html" title="">Your Profile</a></li>
              <li><a href="change-login-password.html" title="">Change Password Login</a></li>
              <li><a href="transaction-password" title="">Transaction Password</a></li>
              <li><a href="your-wallet.html" title="">Your Wallet</a></li>
           
            </ul>
          </nav>
                </div>
                <section>
                    <div class="block">
                        <div class="col-md-6">
                           <form class="simple-form" id="frmChangePassword" action="<?php echo $self -> url -> link('account/setting/editpasswd', '', 'SSL'); ?>" method="post">
                        <div class="row">
                                           
                                                      </div>
                        <div class="row">
                           <div class="col-md-12"><input class="form-control" id="OldPassword" type="password" data-link="<?php echo $self -> url -> link('account/setting/checkpasswd', '', 'SSL'); ?>" placeholder="<?php echo $lang['text_old_password'] ?>" />
                           <span id="OldPassword-error" class="field-validation-error">
                                 <span></span>
                                 </span>
                              </div>

                           <div class="col-md-12"><input class="form-control" id="Password" name="password" type="password" placeholder="<?php echo $lang['text_new_password'] ?>"/>
                                 <span id="Password-error" class="field-validation-error">
                                 <span></span>
                                 </span></div>
                        <div class="col-md-12">
                            <input class="form-control" id="ConfirmPassword"  type="password" placeholdr="<?php echo $lang['text_confirm_password'] ?>"/>
                                 <span id="ConfirmPassword-error" class="field-validation-error">
                                 <span></span>
                                 </span>
                        </div>
                           
                           <div class="col-md-12"><button type="submit" class="dark-btn"><?php echo $lang['text_button_password'] ?></button></div>
                        </div>
                     </form>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>


<?php echo $self->load->controller('common/footer') ?>
