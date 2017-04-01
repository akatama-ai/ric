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
                        <h1>Wallet</h1>

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
                          <div class="message-box" id="EditProfile" data-link="<?php echo $self -> url -> link('account/setting/account', '', 'SSL'); ?>" data-id="<?php echo $self->session -> data['customer_id'] ?>" >
                  <div class="form-container">
                     <h5>Your Bitcoin Wallet</h5>
                     <form class="simple-form">
                        <div class="row">
                           <div class="col-md-12"><input readonly  id="BitcoinWalletAddress" type="text"/></div>
                           <div class="col-md-12">
                              <div id="bitcoin-image" data-img="https://chart.googleapis.com/chart?chs=200x200&amp;cht=qr&amp;chl=">
                                 <div class="form-group">
                                    <img style="border:1px solid #cecece"/>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </form>
                  </div>
                 
                  <div class="contact-details">
                     <div class="contact-info">
                        <!-- <img src="catalog/view/theme/default/fre/images/icon26.png" alt="" />                            
                        <span><i>Find Us</i><strong>22D, London</strong></span> -->
                     </div>
                     <div class="contact-info">
                        <!-- <img src="catalog/view/theme/default/fre/images/icon27.png" alt="" />                            
                        <span><i>Call Us Today</i><strong>+000-2415-145</strong></span> -->
                     </div>
                     <div class="contact-info">
                        <!-- <img src="catalog/view/theme/default/fre/images/icon28.png" alt="" />                            
                        <span><i>Email Us</i><strong>info@meccafunds.org</strong></span> -->
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
