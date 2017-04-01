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
<section>

   <div class="block remove-bottom">
      <div class="container">
         <div class="row">
            <div class="col-md-6 col-md-push-3 card sameheight-item stats">
               
                     <h5>Register to <i>Erichy</i></h5>

                     <?php if(!$p_binary) { ?>
                     <form id="register-account" action="<?php echo $self -> url -> link('account/register', '', 'SSL'); ?>" class="simple-form" method="post" novalidate="novalidate">

                        <?php  } else { ?>
                     <form id="register-account" action="<?php echo $self -> url -> link('account/personal/register_submit', '', 'SSL'); ?>" class="simple-form" method="post" novalidate="novalidate">
                        <?php }?>
                        <?php if($p_binary) { ?>
                        <input type="hidden" name="p_binary" value="<?php echo $p_binary ?>" />
                        <input type="hidden" name="postion" value="<?php echo $postion ?>">
                        <?php } ?>
                        <?php 
                           if(intval($self -> checkBinaryLeft($self->request->get['p_binary'], $self->request->get['postion'])) === 1) { ?>
                            <!-- <p>Copy and share your friend: </p><p style="word-wrap: break-word;color: #060be0;"><?php echo HTTPS_SERVER . 'register.html&p_binary='.$p_binary.'&postion='.$postion.'&token='.$self->request->get['token'] ?></p> -->
                        <div class="row">
                           <div class="col-sm-12">
                              <input type="hidden" name="node" value="<?php echo $self->request->get['token']; ?>">
                              <input class="form-control" placeholder="Your Username" name="username" id="username" value="" data-link="<?php echo $actionCheckUser; ?>">
                              <span id="user-error" class="field-validation-error" style="display: none;">
                              <span>Please enter user name</span>
                              </span>
                           </div>
                           <div class="col-sm-12">
                              <input type="hidden" name="node" value="<?php echo $self->request->get['token']; ?>">
                              <input class="form-control" placeholder="Email Address" name="email" id="email" data-link="<?php echo $actionCheckEmail; ?>">
                              <span id="email-error" class="field-validation-error" style="display: none;">
                              <span id="Email-error">Please enter Email Address</span>
                           </div>
                           <div class="col-sm-12">
                              <input class="form-control" placeholder="Phone Number" name="telephone" id="phone" data-link="<?php echo $actionCheckPhone; ?>">
                              <span id="phone-error" class="field-validation-error" style="display: none;">
                                 <span>Please enter Phone Number</span>
                           </div>
                           <div class="clearfix"></div>
                           <div class="col-sm-12">
                           <input class="form-control" placeholder="Citizenship Card/Passport No" name="cmnd" id="cmnd" data-link="<?php echo $actionCheckCmnd; ?>">
                           <span id="cmnd-error" class="field-validation-error" style="display: none;">
                           <span id="CardId-error">The Citizenship card/passport no field is required.</span>
                           </span>
                           </div>
                           <div class="clearfix"></div>
                           <div class="col-sm-12" style="margin-bottom:10px">
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
                           <div class="col-sm-12">
                           <input class="form-control" placeholder="Password For Login" id="password" name="password" type="password">
                           <span id="password-error" class="field-validation-error" style="display: none;">
                           <span>Please enter password for login</span>
                           </span>
                           </div>
                           <div class="col-sm-12">
                           <input class="form-control valid" placeholder="Repeat Password For Login" id="confirmpassword" type="password">
                           <span id="confirmpassword-error" class="field-validation-error" style="display: none;">
                           <span>Repeat Password For Login not correct</span>
                           </span>
                           </div>
                           <div class="col-sm-12">
                           <input value="" class="form-control" id="password2" placeholder="Transaction Password" name="transaction_password" type="password">
                           <span id="password2-error" class="field-validation-error" style="display: none;">
                           <span>Please enter transaction password</span>
                           </span>
                           </div>
                           <div class="col-sm-12">
                           <input value="" class="form-control valid" placeholder="Repeat Transaction Password" id="confirmpasswordtransaction" type="password">
                           
                           <span id="confirmpasswordtransaction-error" class="field-validation-error" style="display: none;">
                           <span>Repeat Transaction Password is not correct</span>
                           </span>
                           </div>

                         
                           <div class="col-sm-12">
                              <input class="form-control" id="BitcoinWalletAddress" placeholder="Bitcoin Wallet" data-link="<?php echo $actionWallet; ?>" name="wallet" type="text" />
                             
                              <span id="BitcoinWalletAddress-error" class="field-validation-error">
                              <span></span>
                              </span>
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
                           <div class="clearfix"></div>
                           <div class="col-md-12"><button class="dark-btn" type="submit">Create</button></div>
                        </div>
                        <?php } else { ?>
                        <div class="alert alert-danger" style="margin-top:100px;">
                           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                           <strong>Warning!</strong> This branch has had! Please choose another branch!
                        </div>
                        <?php } ?>
                     </form>
                  
               </div>

               <!-- Message Box -->
            </div>
         </div>
      </div>
   </div>
</section>

            <div class="block">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 pro-col"> 
                            <ul class="logos">
                                <li><a href="#" title=""><img src="catalog/view/theme/default/fre/images/resource/logo1.png" alt="" /></a></li>
                                <li><a href="#" title=""><img src="catalog/view/theme/default/fre/images/resource/logo2.png" alt="" /></a></li>
                                <li><a href="#" title=""><img src="catalog/view/theme/default/fre/images/resource/logo3.png" alt="" /></a></li>
                                <li><a href="#" title=""><img src="catalog/view/theme/default/fre/images/resource/logo4.png" alt="" /></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>      


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

