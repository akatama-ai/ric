<?php $self->document->setTitle("Home"); echo $self->load->controller('common/header_home'); ?>
<div class="pagetop">
         <div class="container">
            <h1>Error 404</h1>
            <ul class="breadcrumbs">
               <li><a href="index-2.html" title="">Home</a></li>
               <li>404 Page</li>
            </ul>
         </div>
      </div><!-- Page Top -->



    <section>
			<div class="block">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="error-page">
								<h1>Oops...</h1>
								<strong>We can't find the page you're looking for.</strong>
								
								<a class="color-btn" href="index.html" title="">Back To The Homepage</a>
							</div><!-- Error Page -->					
						</div>
					</div>
				</div>
			</div>
		</section>

<?php $self->document->setTitle("Home"); echo $self->load->controller('common/footer_home'); ?>