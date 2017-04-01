<?php $self->document->setTitle("Home"); echo $self->load->controller('common/header_home'); ?>
         <!-- Header start --><!-- Content start -->
         <div class="pageContent">
            <div class="page-title t-center pattern-4">
               <div class="container">
                  <h1 style="font-weight: 500; color:#777;">Register success</h1>
               </div>
            </div>
            <div class="container">
               <div class="row row-eq-height">
                  <div class="col-md-12 md-padding main-content">
                     <p class="t-justify" style="text-indent: 1.5em;color: #6dab3c;"><h2 style="color: #6dab3c;">Congratulations you have registered an account at Erichy Corp. Ltd!</h2></p>
                     
                     <blockquote class="bquote-1">
                        <p class="t-justify" style="text-indent: 1.5em; font-size:15px;">An activation email has been sent to your email<span style="text-indent: 1.5em;color: #9a1613;text-decoration: underline;font-size:15px;"> <?php if ($register_mail) {
                           echo $register_mail;
                        } ?></span>!</p>
                     </blockquote>
                     <hr class="divider dev-style2">
                    
               </div>
            </div>
         </div>
<?php $self->document->setTitle("Home"); echo $self->load->controller('common/footer_home'); ?>