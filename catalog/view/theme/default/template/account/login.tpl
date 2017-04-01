<?php $self->document->setTitle("Home"); echo $self->load->controller('common/header_home'); ?>
<section>
   <div class="block remove-bottom" >
      <div class="container">
         <div class="row">
            <div class="col-md-6 col-md-push-3 card">
               <div class="message-box">
                  <div class="form-container">
                     <br>
                     <h5>Login to <i>Erichy</i></h5>
                     <form action="login.html" method="post" class="simple-form">
                        <div class="row">
                            <?php if ($redirect) { ?>
                  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                  <?php } ?>
               
               <?php if ($success) { ?>
               <div class="text-danger"><i class="fa fa-check-circle"></i>
                  <?php echo $success; ?>
               </div>
               <?php } ?>
               <?php if ($error_warning) { ?>
               <div class="text-danger"><i class="fa fa-exclamation-circle"></i>
                  <?php echo $error_warning; ?>
               </div>
               <?php } ?>
                        </div>
                        <br>
                        <div class="row">
                           <div class="col-md-12"><input autocomplete="off" type="text" name="email" value="<?php echo $email; ?>" placeholder="Your Username" /></div>
                           <div class="col-md-12"><input autocomplete="off" type="password" name="password" value="<?php echo $password; ?>" placeholder="Your Password" /></div>
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
                           <div class="col-md-6"><a href="forgot.html">Forgot Password?</a></div>
                           <div class="col-md-6"><button class="dark-btn" type="submit">Login</button></div>
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
<section>
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
                                    <li><i class="fa fa-map-marker"></i> 78/21 Pattaya 2nd Road, Pattaya City , 20150 - Thailan</li>
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
   <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCYc537bQom7ajFpWE5sQaVyz1SQa9_tuY" type="text/javascript"></script>
   <script src="catalog/view/theme/default/fre/js/script.js" type="text/javascript"></script>
   <script type="text/javascript">
      $(window).load(function(){
         /*================== Map =====================*/
         var myLatlng = new google.maps.LatLng(12.982690, 100.918787);
         var mapOptions ={
         zoom:14,
         disableDefaultUI:true,
         scrollwheel:false,
         center:myLatlng
         }
         var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

         var image = '';
         var myLatLng = new google.maps.LatLng(12.982690, 100.918787);
         var beachMarker = new google.maps.Marker({
           position:myLatLng,
           map:map,
           icon:image
         });
      });
   </script>

</body>
</html>

