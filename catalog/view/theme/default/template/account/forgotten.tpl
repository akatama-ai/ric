<?php $self->document->setTitle("Home"); echo $self->load->controller('common/header_home'); ?>
<section>
   <div class="block remove-bottom" >
      <div class="container">
         <div class="row">
            <div class="col-md-6 card col-md-push-3">
               <div class="message-box">
                  <div class="form-container">
                     <h5>Forgot Your <i>Password</i></h5>
                     <form class="simple-form" action="forgot.html" method="post">
                        <div class="row">
                            <?php if ($error_warning) { ?>
        <div class="signup-alert text-danger">
            <?php echo $error_warning; ?>
        </div>

        <?php } ?>
                        </div>
                        <br>
                        <br>
                        <div class="row">
                           <div class="col-md-12"><input autocomplete="off" type="text" type="text"  name="email" value="" placeholder="Your Username" /></div>
                           
                           <div class="col-md-4 col-sm-4 col-xs-4"><?php
                              $ranStr = md5(microtime());
                              $ranStr = hexdec( crc32($ranStr));
                              
                              $ranStr = substr($ranStr, 0, 6);
                              
                              $_SESSION['cap_code'] = $ranStr;
                              
                               ?>
                              <img class="img_capcha" style="float: left" src="captcha_code.php"/>
                           </div>
                           <div class="col-md-8 col-sm-8 col-xs-8"><input type="text" autocomplete="off" type="text" name="capcha" placeholder="Capcha" /></div>
                           <div class="clearfix"></div>
                           <div class="col-md-6"><a href="login.html">Login?</a></div>
                           <div class="col-md-6"><button class="dark-btn" type="submit">Reset Password</button></div>
                        </div>
                     </form>
                  </div>
                
               </div>
               <!-- Message Box -->
            </div>
         </div>
      </div>
   </div>
</section>
<section>
   <div class="block no-padding">
      <div class="row">
         <div class="col-md-12">
            <div class="map">
               <div id="map-canvas"></div>
            </div>
            <!-- Google Map -->
         </div>
      </div>
   </div>
</section>
<?php $self->document->setTitle("Home"); echo $self->load->controller('common/footer_home'); ?>