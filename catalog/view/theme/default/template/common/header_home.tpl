<!DOCTYPE html>
<html class="no-js">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Erichy Corp - Fund Bitcoin Here And Making Profits Easily!</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Find out the best paying Bitcoin on our daily updated BTC investments monitoring page. See who is legit and who is a scamming high yield investment." />
  <meta name="keywords" content="Bitcoin mining, scrypt mining, altcoin mining, cloud mining, X11, hosted mining, Investment bitcoin" />
  <meta name="google-translate-customization" content="e6d13f48b4352bb5-f08d3373b31c17a6-g7407ad622769509b-12"></meta>
  <link rel="icon" href="catalog/view/theme/default/img/logo.png">
  <!-- Styles -->
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/fre/css/bootstrap.min.css" />
  <link rel="stylesheet" href="catalog/view/theme/default/fre/css/icons.css">
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/fre/css/style.css" />
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/fre/css/responsive.css" />
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/fre/css/color.css" />

  <!-- REVOLUTION STYLE SHEETS -->
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/fre/revolution/css/settings.css">
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/fre/revolution/css/navigation.css">  
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/fakeloader.css" />
  
</head>

<body>
  <div class="modal fade" id="modal-login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
        <div class="loginmodal-container">

          <h1><img src="catalog/view/theme/default/fre/images/logo.png" alt="" style="WIDTH: 190px;"/></h1><br>
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
                           <div class="col-md-6 text-right"><button class="btn-login" type="submit">Login</button></div>
                        </div>
                     </form>
          
         <!--  <div class="login-help">
          <a href="#">Register</a> - <a href="#">Forgot Password</a>
          </div> -->
        </div>
      </div>
      </div> 

  <div id="fakeloader"></div>
  
  
  <div class="theme-layout">
     
     <header><!-- Header --> 
      <div class="topbar">
        <div class="container">
          <p class="top-address"><i class="fa fa-map-marker"></i> 78/21 Pattaya 2nd Road, Pattaya City , 20150 - Thailan</p>
          <div class="header-exts">
              <?php if (isset($_SESSION['customer_id'])) {
                echo ' <a class="round-btn" href="home.html" title="">Dashboard</a>';
              } else{?>
             <a class="round-btn" data-toggle="modal" href="#modal-login" title="">Login</a>
             <?php } ?>
           
           
          </div>
        </div>
      </div><!-- Topbar -->
      <div class="logobar">
        <div class="container">
          <div class="logo"><a href="index.html" title=""><img src="catalog/view/theme/default/fre/images/logo.png" alt="" style="WIDTH: 100px;"/></a></div><!-- Logo -->
          <div class="header-contact">
            <div class="row">
              <div class="col-md-4">
                <div class="info">
                  <img src="catalog/view/theme/default/fre/images/info1.png" alt="" />
                  <strong>Contact Time <span>Mon - Sat:19.00 -20.00</span></strong>
                </div><!-- Info -->
              </div>
              <div class="col-md-4">
                <div class="info">
                  <img src="catalog/view/theme/default/fre/images/info2.png" alt="" />
                  <strong>Contact Email <span>info@erichy.com</span></strong>
                </div><!-- Info -->
              </div>
              <div class="col-md-4">
                <div class="info">
                  <img src="catalog/view/theme/default/fre/images/info3.png" alt="" />
                  <strong>Phone Number <span>+66 38 603 194</span></strong>
                </div><!-- Info -->
              </div>
            </div>
          </div>
        </div>
      </div><!-- Logobar -->
      <div class="menubar">
        <div class="container">
          <nav>
            <ul>
              <li><a href="index.html" title="">Home</a></li>
              <li><a href="about.html" title="">About Us</a></li>
              <li><a href="investment-plan.html" title="">Pricing Plans</a></li>
              
              <li><a href="faq.html" title="">Faqs</a></li>
              <li><a href="ourproject.html" title="">Our Project</a></li>
              <li><a href="contact.html" title="">Contact</a></li>
             
          
            </ul>
          </nav>
       
        </div>
      </div><!-- Menu Bar -->
    </header><!-- Header -->

    <div class="responsive-header">
      <div class="responsive-topbar">
        <p class="top-address"><i class="fa fa-map-marker"></i> 78/21 Pattaya 2nd Road, Pattaya City , 20150 - Thailan</p>
        <div class="responsive-header-exts">
           <?php if (isset($_SESSION['customer_id'])) {
                echo ' <a class="round-btn" href="home.html" title="">Dashboard</a>';
              } else{?>
             <a class="round-btn" data-toggle="modal" href="#modal-login" title="">Login</a>
             <?php } ?>

        </div>
      </div><!-- Responsive Topbar -->
      <div class="responsive-logobar">
        <div class="responsive-logo"><a href="index.html" title=""><img src="catalog/view/theme/default/fre/images/logo.png" alt="" style="WIDTH: 100px;"/></a></div>
        <a class="menu-button" href="#" title=""><i class="fa fa-bars"></i></a>
      </div><!-- Responsive Logbar -->
      <div class="responsive-menu">
        <a class="close-menu" href="#" title=""><i class="fa fa-remove"></i></a>
        <ul>
          <li><a href="index.html" title="">Home</a></li>
             <li><a href="about.html" title="">About Us</a></li>
          <li><a href="investment-plan.html" title="">Pricing Plans</a></li>
       
          <li><a href="faq.html" title="">Faqs</a></li>
          <li><a href="ourproject.html" title="">Our Project</a></li>
          <li><a href="contact.html" title="">Contact</a></li>
         
        </ul>
        <div class="header-contact">
          <div class="info">
            <img src="catalog/view/theme/default/fre/images/info1.png" alt="" />
            <strong>Contact Time <span>Mon - Sat:19.00 -20.00</span></strong>
          </div><!-- Info -->
          <div class="info">
            <img src="catalog/view/theme/default/fre/images/info2.png" alt="" />
            <strong>Contact Email <span>info@erichy.com</span></strong>
          </div><!-- Info -->
          <div class="info">
            <img src="catalog/view/theme/default/fre/images/info3.png" alt="" />
            <strong>Phone Number <span>+66 38 603 194</span></strong>
          </div><!-- Info -->
        </div>

      </div>
    </div><!-- Responsive Header -->
<div class="clearfix"></div>
