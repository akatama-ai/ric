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
                        <h1>Setting</h1>

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
                     <h5>Your <i>Profile</i></h5>
                     <form class="simple-form" id="updateProfile" action="<?php echo $self -> url -> link('account/setting/update_profile', '', 'SSL'); ?>" method="post">
                        <div class="row">
                                           
                                                      </div>
                        <div class="row">
                           <div class="col-md-12"><label>Username</label></div>
                           <div class="col-md-12"><input class="form-control valid" id="UserName" name='username'  type="text" readonly='true' value="" data-link="<?php echo $self -> url -> link('account/register/checkuser', '', 'SSL'); ?>" /></div>
                            <div class="col-md-12"><label>Country</label></div>
                           <div class="col-md-12"><input class="form-control valid" id="Country" name='countryname'  type="text" readonly='true' value="" /></div>
                            <div class="col-md-12"><label>Email</label></div>
                           <div class="col-md-12"><input class="form-control" data-link="<?php echo $self -> url -> link('account/register/checkemail', '', 'SSL'); ?>" id="Email" name="email" readonly='true' type="text" value=""/></div>
                            <div class="col-md-12"><label>Phone number</label></div>
                           <div class="col-md-12">
                              <input data-link="<?php echo $self -> url -> link('account/register/checkphone', '', 'SSL'); ?>" class="form-control" id="Phone" readonly='true' name="telephone" type="text" value=""/>
                           </div>
                            <div class="col-md-12"><label>Affiliate Since:</label></div>
                           <div class="col-md-12">
                              <input type="text" id="Date" readonly='true' value="" placeholder="" spellcheck="false" class="form-control sbg info-city">
                           </div>
                                     <div class="col-md-12"><label>Last Login IP:</label></div>
                           <div class="col-md-12"><input type="text" id="LastIP" value="" readonly='true' placeholder="" spellcheck="false" class="form-control sbg info-region"></div>
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
                        <span><i>Email Us</i><strong>info@gmail.com</strong></span> -->
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
