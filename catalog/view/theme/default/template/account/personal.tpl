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
                        <h1>Binary Tree</h1>

                    </div>
                </div>
                <!-- Page Top -->



                <section>
                    <div class="block">
                        <div class="container">
                          <div class="row">
                            <div class="panel panel-default">
                              <div class="panel-body">
                                <h3 style=" margin: 0; ">Referral Link</h3>
                                <input style="width:100%;border:none;color: #2196f3;font-size: 16px;display: block; margin-bottom: 8px;" readonly class="js-copytextarea"value="<?php echo HTTPS_SERVER.'register?ref='.$customer_code; ?>" title="<?php echo HTTPS_SERVER.'register?ref='.$customer_code; ?>">
                              
                                <button class="btn btn-default js-textareacopybtn">COPY Referral Link</button>
                              </div>
                            </div>     
                                          <script type="text/javascript">

                                  var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

                                  copyTextareaBtn.addEventListener('click', function(event) {
                                    var copyTextarea = document.querySelector('.js-copytextarea');
                                    copyTextarea.select();

                                    try {
                                      var successful = document.execCommand('copy');
                                      var msg = successful ? 'successful' : 'unsuccessful';
                                      console.log('Copying text command was ' + msg);
                                    } catch (err) {
                                      console.log('Oops, unable to copy');
                                    }
                                  });
                                          </script>
                        </div>

                          <div class="row">
                            <div class="card sameheight-item stats" data-exclude="xs" >
            <div class="col-xs-12 col-sm-6 stat-col">
                                                <div class="stat-icon"> <i class="fa fa-user"></i> </div>
                                                <div class="stat">
                                                    <div class="value"> <?php echo $total_binary_left ;?> </div>
                                                    <div class="name"> Member Left </div>
                                                    
                                                </div> <progress class="progress stat-progress" value="15" max="100">
                                <div class="progress">
                                    <span class="progress-bar" style="width: 15%;"></span>
                                </div>
                            </progress> 
                    </div>
                    <div class="col-xs-12 col-sm-6 stat-col">
                                                <div class="stat-icon"> <i class="fa fa-user"></i> </div>
                                                <div class="stat">
                                                    
                                                    <div class="value"> <?php echo $total_binary_right ;?> </div>
                                                    <div class="name"> Member Right </div>
                                                </div> <progress class="progress stat-progress" value="15" max="100">
                                <div class="progress">
                                    <span class="progress-bar" style="width: 15%;"></span>
                                </div>
                            </progress> 
                    </div>
            </div>
                          </div>
                          <div class="row">
                            
                              <form method="GET" id="frmAccount" class="simple-form" action="<?php echo $self->url->link('account/personal/searchBinary', '', 'SSL'); ?>">
                                <div class="col-md-4 col-sm-6 col-xs-8">
                                    <input type="text"  autocomplete="off" name="account" id="account" placeholder="Username" required style=" padding: 5px; border-radius: 3px; border: 1px solid #d0dee2; ">
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-4">
                                  <button type="submit" id="btnAccount" class="dark-btn" style=" margin-top: -4px; ">Search</button>
                                </div>
                                    
                                 </form>
                            </div>
                          
                           <div id="tab-binary" class="tab-pane panel-body active">
                            <div class="row">
                              
                                <div class="col-md-12">
                                 
                                  <fieldset>
                                      <div class="personal_contain" style="padding:0px;" >
                                        <div class="tootbar-top">
                                          <ul class="list-unstyled">
                                            <li style="margin-bottom:15px;">
                                              <a class="" href="javascript:void(0)" onclick='click_node(
                                              <?php echo intval($idCustomer); ?>)' title="Top"> <span class="btn btn-default" style="font-weight:700"><i class="fa fa-level-up"></i></span> </a>
                                            
                                              <a class="" href="javascript:void(0)" onclick='click_back()' title="Back"> <span class="btn btn-default" style="font-weight:700"><i class="fa fa-undo"></i></span> </a>
                                            </li>
                                            
                                          </ul>
                                        </div>
                                        <div class="clr"></div>
                                        <div class="personal-tree" style="text-align: center; min-height:300px">
                                          <img src="
                                          <?php echo $self -> config -> get('config_ing_loading'); ?>" />
                                        </div>
                                        
                                      </div>
                                    </fieldset>
                                  

 <div class="detail-icon clearfix" style="margin-top: 100px;">
                          <img src="catalog/view/theme/default/stylesheet/icons/011.png" width="65px"> &nbsp;
                         
                         <img src="catalog/view/theme/default/stylesheet/icons/0000.png" width="70px"> &nbsp;
                         
                         <img src="catalog/view/theme/default/stylesheet/icons/002.png" width="60px"> &nbsp;
                          <img src="catalog/view/theme/default/stylesheet/icons/003.png" width="60px"> &nbsp;
                         <img src="catalog/view/theme/default/stylesheet/icons/004.png" width="60px"> &nbsp;
                         <img src="catalog/view/theme/default/stylesheet/icons/005.png" width="60px"> &nbsp;
                         <img src="catalog/view/theme/default/stylesheet/icons/006.png" width="60px"> &nbsp;
                         <img src="catalog/view/theme/default/stylesheet/icons/007.png" width="60px"> &nbsp;
                        </div>
                                </div>
                            </div>
                          </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>


 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/tooltipster.bundle.min.css" />
<script type="text/javascript" src="catalog/view/javascript/tooltipster.bundle.min.js"></script>
<script type="text/javascript">
function clearconsole() { 
  console.log(window.console);
  if(window.console || window.console.firebug) {
   console.clear();
  }
}
     $(document).ready(function(){
   
    $('#frmAccount').on('submit', function(envt) {        
          $(this).ajaxSubmit({
              type : 'GET',
              cache: false,
              beforeSubmit :  function(arr, $form, options) { 
                  window.funLazyLoad.start();
                  window.funLazyLoad.show();
           },
              success : function(result){
                  result = $.parseJSON(result);
                  console.log(result);
                  setTimeout(function(){
                    window.click_node(result.id_tree);
                    window.funLazyLoad.reset();
                  },200);
                  clearconsole();

              }
          });
       
      return false;
    });

    
    }); 
    
  </script>
<script type="text/javascript">

(function($) {

jQuery.fn.show_tree = function(node) {  

    positon = node.iconCls.split(" ");

    var line_class = positon[1]+'line '+'linefloor'+node.fl;
    var level_active = positon[0]+'iconLevel';

    var node_class = positon[1]+'_node '+'nodefloor'+node.fl;
    var html = '<div class=\''+line_class+'\'></div>';
    x_p = "<span>Name: "+node.username+"<span> <hr>";
    x_p += "<span>Binary Left: $ "+node.leftPD+"</span> <hr>";
    x_p += "<span>Binary Right: $ "+node.rightPD+"</span>";


    html += !node.empty 
        ? '<div class=\''+node_class+' '+level_active+'\'><a data-html="true" data-toggle="tooltip" rel="tooltip" data-placement="top" data-title="<p>'+x_p+'</p>" class="binaryTree" style="display:block"   \'><span style="font-size: 14px; position: absolute; top: 23px; color: #826400; left: 10px;">'+node.username+'</span><i class="fa fa-user type-'+node.level+'" onclick=\'click_node('+node.id+')\' value=\''+node.id+'\' aria-hidden="true"></i></a>' 
        : '<div class=\''+node_class+'\'><a data-toggle="tooltip" data-placement="top" style="display:block" onclick=\'click_node_add('+node.p_binary+', "'+positon[1]+'")\' value=\''+node.p_binary+'\' title="Add new user"><span style="font-size: 14px; position: absolute; top: 23px; color: #826400; left: 10px;">Add new user</span><i class="fa fa-plus-square type-add"></i></a>';

    html += '<div id=\''+node.id+'\' ></div>';

    html += '</div>';

    $(this).append(html);

    node.children && $.each( node.children, function( key, value ) {
       $('#'+node.id).show_tree(value);

        $('[data-toggle="popover"]').popover();
    });



};


jQuery.fn.show_infomation = function(node) {  

  $.getJSON(
      "index.php?route=account/personal/getInfoUser&id="+node,
    function(data){
    $(this).find('dd').html('');      

      if(data.id !=0){

        $.each(data, function (k,v){
        $('#ajax_'+k).html(v);

      });     

      }

    }
  );

};

// xay dung cay voi id truyen vo

jQuery.fn.build_tree = function(id, method) {   

    $('.personal-tree').html('<img src="<?php echo $self -> config -> get('config_ing_loading'); ?>"  />');

    $.ajax({

      url: "index.php?route=account/personal/"+method,

      dataType: 'json',

      data: {id_user : id},

      success: function(json_data){

        var rootnode = json_data[0];
         $('.personal-tree').html('');

         $('.personal-tree').show_tree(rootnode);

         $('.personal_contain').show_infomation(rootnode.id);

         $('#current_top').html("Goto "+rootnode.name + "\'s");

      }

    }); 

};

})(jQuery);
  var click_node_add =  function (p_binary, positon){
    var link = '/register.html';
    link += '&p_binary=' + p_binary;
    link += '&postion='+ positon;
    link += '&token='+ '<?php echo $customer_code; ?>';
    location.href = link;
    
  };
   function click_node(id){
    jQuery(document).build_tree(id,'getJsonBinaryTree_Admin');
    $('.tooltip').hide();
    !_.contains(window.arr_lick, id) && window.arr_lick.push(id);
   }
   window.arr_lick = [];
   function click_back(){
      if(window.arr_lick.length === 0){
        click_node(<?php echo intval($idCustomer); ?>);

      }else{
        window.arr_lick = _.initial(window.arr_lick);
        typeof _.last(window.arr_lick) !== 'undefined' ? click_node(_.last(window.arr_lick)) : click_node(<?php echo intval($idCustomer); ?>);
      }
   }

function upto_level(id){

  var top = jQuery('.personal-tree'+id+' > div a').eq(0).attr('value');

  jQuery(document).build_tree(top,'getJsonBinaryTreeUplevel');

}

function goto_bottom_left(id){

  jQuery(document).build_tree(id,'goBottomLeft');

}

function goto_bottom_right(id){

  jQuery(document).build_tree(id,'goBottomRight');

}

function goto_bottom_left_oftop(id){

  var top = jQuery('.personal-tree'+id+' > div a').eq(0).attr('value');

  jQuery(document).build_tree(top,'goBottomLeft');

}

function goto_bottom_right_oftop(id){

  var top = jQuery('.personal-tree'+id+' > div a').eq(0).attr('value');

  jQuery(document).build_tree(top,'goBottomRight');

}

jQuery(document).ready(function($) {
  click_node(<?php echo intval($idCustomer);?>);
});

</script>

<?php echo $self->load->controller('common/footer') ?>
