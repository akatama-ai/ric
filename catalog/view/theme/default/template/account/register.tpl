<?php echo $self->load->controller('common/header_home'); ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/loading.js" type="text/javascript"></script>
<script src="catalog/view/javascript/bootstrap.min.js"></script>
<!-- Styles -->
<script src="catalog/view/javascript/register/register.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/fakeloader.css" />
<script type="text/javascript">
      window.funLazyLoad = {
          start: function() {
              $("#fakeloader").fakeLoader({
                  timeToHide: 99999999999,
                  zIndex: "999",
                  spinner: "spinne1",
                  bgColor: "rgba(0,0,0,0.5)"
              })
          },
          reset: function() {
              $("#fakeloader").hide()
          },
          show: function() {
              $("#fakeloader").show()
          }
      };
   
   </script>


      
     <div class="pagetop">
         <div class="container">
            <h1>Register</h1>
            <ul class="breadcrumbs">
               <li><a href="#" title="">Home</a></li>
               <li>Register</li>
            </ul>
         </div>
      </div><!-- Page Top -->

<section>

   <div class="block remove-bottom">
        <div class="container">
            <div class="row contact-row">
                <div class="col-sm-8 margin-btm-30 col-sm-offset-2">
                    <form id="register-account" action="<?php echo $self -> url -> link('account/registers/confirmSubmit', '', 'SSL'); ?>" class="simple-form" method="post" novalidate="novalidate">
                       <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                     <label>Username</label>
                                    <input type="hidden" name="node" value="<?php echo $self->request->get['ref']; ?>">
                                    <input class="form-control" placeholder="Your Username" name="username" id="username" value="" data-link="<?php echo $actionCheckUser; ?>">
                                    <span id="user-error" class="field-validation-error" style="display: none;">
                                    <span>Please enter user name</span>
                                    </span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                     <label>Email address</label>
                                    <input class="form-control" placeholder="Email Address" name="email" id="email" data-link="<?php echo $actionCheckEmail; ?>">
                              <span id="email-error" class="field-validation-error" style="display: none;">
                              <span id="Email-error">Please enter Email Address</span></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                     <label>Phone number</label>
                                    <input class="form-control" placeholder="Phone Number" name="telephone" id="phone" data-link="<?php echo $actionCheckPhone; ?>">
                                    <span id="phone-error" class="field-validation-error" style="display: none;">
                                 <span>Please enter Phone Number</span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                     <label>Citizenship Card/Passport No</label>
                                    <input class="form-control" placeholder="Citizenship Card/Passport No" name="cmnd" id="cmnd" data-link="<?php echo $actionCheckCmnd; ?>">
                           <span id="cmnd-error" class="field-validation-error" style="display: none;">
                           <span id="CardId-error">The Citizenship card/passport no field is required.</span>
                           </span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            
                            <div class="col-sm-6">
                                <div class="form-group">
                                     <label>Confirm Password</label>
                                    <input class="form-control" placeholder="Password For Login" id="password" name="password" type="password">
                           <span id="password-error" class="field-validation-error" style="display: none;">
                           <span>Please enter password for login</span>
                           </span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                     <label>Confirm Password</label>
                                    <input class="form-control valid" placeholder="Repeat Password For Login" id="confirmpassword" type="password">
                           <span id="confirmpassword-error" class="field-validation-error" style="display: none;">
                           <span>Repeat Password For Login not correct</span>
                           </span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            
                            <div class="col-sm-6">
                                <div class="form-group">
                                     <label>Transaction Password</label>
                                   <input value="" class="form-control" id="password2" placeholder="Transaction Password" name="transaction_password" type="password">
                           <span id="password2-error" class="field-validation-error" style="display: none;">
                           <span>Please enter transaction password</span>
                           </span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                     <label>Confirm Transaction Password</label>
                                    <input value="" class="form-control valid" placeholder="Repeat Transaction Password" id="confirmpasswordtransaction" type="password">
                          
                           <span id="confirmpasswordtransaction-error" class="field-validation-error" style="display: none;">
                           <span>Repeat Transaction Password is not correct</span>
                           </span>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                     <label>Country</label>
                                    <select class="form-control" id="country" name="country_id">
                           <option value="">-- Choose your Country --</option>
                           <?php foreach ($country as $key=> $value) {?>
                           <option value="<?php echo $value['id'] ?>">
                           <?php echo $value[ 'name'] ?>
                           </option>
                           <?php } ?>
                           </select>
                           <span id="country-error" class="field-validation-error" style="display: none;">
                           <span>The country field is required.</span>
                           </span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                     <label>Bitcoin Wallet</label>
                                    <input class="form-control" id="BitcoinWalletAddress" placeholder="Bitcoin Wallet" data-link="<?php echo $actionWallet; ?>" name="wallet" type="text" />
                              <span id="BitcoinWalletAddress-error" class="field-validation-error">
                              <span></span>
                              </span>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                           <div class="col-md-12"> <input id="agreeTerm" type="checkbox" value="true" style="
                              width: 20px;
                              float: left;
                              ">
                              <span style="
                                 margin-top: 18px;
                                 margin-left: 10px;
                                 display: inline-block;
                                 ">Agree to our Terms and Condition</span>
                           </div>
                        <div class="text-right">
                            <button type="submit" class="dark-btn">Create Account</button>
                        </div>
                     </form>
                     </div>
                  </div>
            </div>
        </div>
   </section>
       
<section> <div class="block remove-bottom"></div></section>

        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="widget">
                            <div class="about-widget">
                                <a class="widget-logo" href="#" title=""><img src="catalog/view/theme/default/fre/images/logo.png" style=" width: 100px; " alt="" /></a>
                                <p>Erichy Corp. LTD is one of the world’s leading investment companies in the field.</p>
                                <ul>
                                    <li><i class="fa fa-map-marker"></i> Thanyaburi, Pathumthani 12130
Bangkok, Thailand</li>
                                    <li><i class="fa fa-phone"></i> Phone:+66 38 603 194</li>
                                    <li><i class="fa fa-envelope"></i> Email:info@erichy.com</li>
                                </ul>
                                <div class="dark-socials">
                                    <a href="#" title=""><i class="fa fa-facebook"></i></a>
                                    <a href="#" title=""><i class="fa fa-google-plus"></i></a>
                                    <a href="#" title=""><i class="fa fa-twitter"></i></a>
                                    <a href="#" title=""><i class="fa fa-pinterest"></i></a>
                                    <a href="#" title=""><i class="fa fa-behance"></i></a>
                                </div>
                            </div>
                        </div><!-- Widget -->
                    </div>
                    <div class="col-md-3">
                        <div class="widget">
                            <h4 class="widget-title">Latest News.</h4>
                            <div class="news-widget">
                                <div class="news">
                                    <img src="catalog/view/theme/default/fre/images/resource/news1.jpg" alt="" style=" width: 93px; "/>
                                    <div class="news-detail">
                                        <h5><a href="#" title="">Welcome to Erichy Corp. LTD! </a></h5>
                                        <span>Dec 29 - 2016</span>
                                    </div>
                                </div>
                                <div class="news">
                                    <img src="catalog/view/theme/default/fre/images/resource/news2.jpg" alt="" style=" width: 93px; "/>
                                    <div class="news-detail">
                                        <h5><a href="#" title="">Erichy Corp. LTD - Your Safe Investment Destination.</a></h5>
                                        <span>Dec 31 - 2016</span>
                                    </div>
                                </div>
                               
                            </div>
                        </div><!-- Widget -->
                    </div>
                    <div class="col-md-6">
                        <div class="widget">
                            <h4 class="widget-title">Contact Us</h4>
                            <div class="contact-form">
                                <form>
                                    <input type="text" placeholder="Name" />
                                    <input type="email" placeholder="Email Address" />
                                    <input type="text" placeholder="Subject" />
                                    <textarea placeholder="Message"></textarea>
                                    <button type="submit">Send</button>
                                </form>
                            </div>
                        </div><!-- Widget -->
                    
                      
                    </div>  

                </div>
            </div>
        </footer><!-- Footer -->

        <div class="bottom-strip">
            <div class="container">Copyright 2007 - 2017 Erichy Corp. LTD</div>
        </div>
    </div>
   <script src="catalog/view/theme/default/fre/js/jquery.min.js" type="text/javascript"></script>
   <script src="catalog/view/theme/default/fre/js/html5lightbox.js"></script>
   <script src="catalog/view/theme/default/fre/js/wow.min.js"></script>
  
   <script src="catalog/view/theme/default/fre/js/script.js" type="text/javascript"></script>
  
</body>
</html>

