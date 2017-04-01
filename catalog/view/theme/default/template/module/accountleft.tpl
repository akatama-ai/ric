<?php $route=$self -> request -> get['route']; ?>
<div id="sidebar-wrapper" style="top:155px">
    

            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <div style="width:175px;  margin-left:auto; margin-right:auto">
                        <!-- <img src="catalog/view/theme/default/fre/images/logo.png" alt="" class="img-responsive"> -->
                    </div>
                </li>
                <li>
                    <div class="profile">
                      <div class="profile_pic">
                        <img src="catalog/view/theme/default/fre/images/logo.png" alt="..." class="img-circle profile_img">
                      </div>
                      <div class="profile_info">
                        <span>Welcome,</span>
                        <h2><?php echo $username; ?></h2>

                      </div>
                      <!-- <p>Invited by: <?php echo $sponsor['name']; ?></p> -->
                      <div class="clearfix"></div>
                    </div>
                </li>
                <li>
                    <a href="home.html"><i class="fa fa-tachometer" aria-hidden="true"></i> Dashboard</a>
                </li>
                <li>
                    <a href="investment-detail.html"><i class="fa fa-microchip" aria-hidden="true"></i> Deposite</a>
                </li>
                <li>
                    <a href="withdraw"><i class="fa fa-btc" aria-hidden="true"></i> Withdraw</a>
                </li>
                <li>
                    <a href="everyday-profit.html"><i class="fa fa-money" aria-hidden="true"></i> Payment History</a>
                </li>
                 <li>
                    <a href="refferal"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Affiliates</a>
                </li>
                <li>
                    <a href="column-tree.html"><i class="fa fa-users" aria-hidden="true"></i> Binary Tree</a>
                </li>
               
                <li>
                    <a href="your-profile.html"><i class="fa fa-cogs" aria-hidden="true"></i> Settings</a>
                </li>
              
                <li>
                    <a href="logout"><i class="fa fa-power-off" aria-hidden="true"></i> Logout</a>
                </li>
            </ul>
        </div>