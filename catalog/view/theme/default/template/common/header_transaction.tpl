<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
   <head>
      <meta charset="UTF-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title><?php echo $title; ?> </title>
      <meta http-equiv="cache-control" content="no-cache"/>
      <base href="<?php echo $base; ?>"/>
      <?php if ($description){ ?>
      <meta name="description" content="<?php echo $description; ?>"/>
      <?php } ?><?php if ($keywords){ ?>
      <meta name="keywords" content="<?php echo $keywords; ?>"/>
      <?php } ?>
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <link rel="icon" href="catalog/view/theme/default/img/logo.png">
      <script src="catalog/view/javascript/jquery/underscorejs/underscorejs.js" type="text/javascript"></script><script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script><script src="catalog/view/javascript/jquery/jquery.easyui.min.js" type="text/javascript"></script><script src="catalog/view/javascript/jquery/jquery-ui.js" type="text/javascript"></script><script src="catalog/view/javascript/jquery/jquery.quick.pagination.min.js" type="text/javascript"></script><script src="catalog/view/javascript/loading.js" type="text/javascript"></script><script src="catalog/view/javascript/bootstrap.min.js"></script><script src="catalog/view/javascript/jquery.nicescroll.js" type="text/javascript"></script><script src="catalog/view/javascript/jquery.app.js"></script>
      
      <?php foreach ($styles as $style) { ?>
      <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
      <?php } ?>
      <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
      <script type="text/javascript" src="catalog/view/javascript/jquery.simplyscroll.js"></script>
      <?php foreach ($scripts as $script) { ?>
      <script src="<?php echo $script; ?>" type="text/javascript"></script>
      <?php } ?>
      <?php echo $google_analytics; ?>
      <script type="text/javascript"> window.funLazyLoad={start:function(){$("#fakeloader").fakeLoader({timeToHide:99999999999,zIndex:"999",spinner:"spinne1",bgColor:"rgba(0,0,0,0.5)"})},reset:function(){$("#fakeloader").hide()},show:function(){$("#fakeloader").show()}};
         (function($) { $(function() { $("#scroller").simplyScroll({frameRate:'20'}); }); })(jQuery)
             
      </script>
      <script src="catalog/view/javascript/jquery.form.min.js" type="text/javascript"></script><script src="catalog/view/javascript/alertifyjs/alertify.js" type="text/javascript"></script>
      <link href="catalog/view/theme/default/css/al_css/alertify.css" rel="stylesheet">
      <script src="catalog/view/javascript/changeLang.js" type="text/javascript"></script><script type="text/javascript" src="catalog/view/javascript/bxslider/jquery.bxslider.js"></script>
      <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,500' rel='stylesheet' type='text/css'> <!-- Body font -->
      <link href='http://fonts.googleapis.com/css?family=Lato:300,400' rel='stylesheet' type='text/css'> <!-- Navbar font -->

      <link rel="stylesheet" href="catalog/view/theme/default/style1/inc/bootstrap/css/bootstrap.min.css">
      <link rel="stylesheet" href="catalog/view/theme/default/style1/inc/animations/css/animate.min.css">
      <link rel="stylesheet" href="catalog/view/theme/default/style1/inc/font-awesome/css/font-awesome.min.css"> <!-- Font Icons -->
      <link rel="stylesheet" href="catalog/view/theme/default/style1/inc/owl-carousel/css/owl.carousel.css">
      <link rel="stylesheet" href="catalog/view/theme/default/style1/inc/owl-carousel/css/owl.theme.css">

      
        <link rel="stylesheet" href="catalog/view/theme/default/style1/css/reset.css">
      <link rel="stylesheet" href="catalog/view/theme/default/style1/css/style.css">
      <link rel="stylesheet" href="catalog/view/theme/default/style1/css/mobile.css">

    
      <link rel="stylesheet" href="catalog/view/theme/default/style1/css/skin/cool-gray.css">
        <link rel="alternate stylesheet" media="screen" title="ice-blue" href="catalog/view/theme/default/style1/css/skin/ice-blue.css"> 
        <link rel="alternate stylesheet" media="screen" title="summer-orange" href="catalog/view/theme/default/style1/css/skin/summer-orange.css">
        <link rel="alternate stylesheet" media="screen" title="fresh-lime" href="catalog/view/theme/default/style1/css/skin/fresh-lime.css">
        <link rel="alternate stylesheet" media="screen" title="night-purple" href="catalog/view/theme/default/style1/css/skin/night-purple.css">
         

        <!-- Theme JS -->
        <script src="catalog/view/theme/default/style1/js/theme.js"></script>

   </head>
   <body data-spy="scroll" data-target="#main-navbar">
        <div class="page-loader"></div>  <!-- Display loading image while page loads -->
      <div class="body">
          <div class="top-bar no-border">
            <div class="container">
              <?php if (isset($self -> session -> data['customer_id'])) {
                ?>
                
                 <div class="f-right slider_buttons">
                  <a class=" btn btn-rounded main-bg" href="account.html"><i class="fa fa-user"></i> <?php echo  $self -> get_username($self -> session -> data['customer_id']);  ?></a><a class="btn btn-rounded btn-green" style="margin-left:10px;" href="logout.html"><i class="fa fa-sign-in"></i> Logout</a><a id="activ" class="popup-with-zoom-anim" href="#confirm"></a>
                  <a id="end_form" class="popup-with-zoom-anim" href="#done"></a>
               </div>
             <?php } else{ ?>
               <div class="f-right slider_buttons">
                  <a class=" btn btn-rounded main-bg" href="login.html"><i class="fa fa-user"></i> Login</a><a class="btn btn-rounded btn-green" style="margin-left:10px;" href="login.html"><i class="fa fa-sign-in"></i> Register</a><a id="activ" class="popup-with-zoom-anim" href="#confirm"></a>
                  <a id="end_form" class="popup-with-zoom-anim" href="#done"></a>
               </div>
               <?php } ?>
            </div>
         </div>
            <header id="header" class="header-main">
<!-- navbar-fixed-top -->
                <nav id="main-navbar" class="navbar navbar-default " role="navigation"> 
                  <div class="container">

                    <div class="navbar-header">
                      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                      </button>
                      <a class="navbar-brand page-scroll" href="index.php?route=transaction/dashboard">
                         <img src="catalog/view/theme/default/images/Mezidas.png" style="width: 100px" alt="">
                      </a>
                    </div>
                    
                  
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a class="page-scroll" href="index.php?route=transaction/dashboard">Home</a></li>
                            <li><a class="page-scroll" href="index.php?route=transaction/transaction">Your Transaction</a></li>
                            <li><a class="page-scroll" href="index.php?route=transaction/create">Create</a></li>
                            <li><a class="page-scroll" href="index.php?route=transaction/history">History</a></li>
                            <li><a class="page-scroll" href="index.php?route=transaction/setting">Setting</a></li>
                            
                          
                        </ul>

                    </div><!-- /.navbar-collapse -->

                  </div><!-- /.container -->
                </nav>
                <!-- End Navbar -->
            </header>
