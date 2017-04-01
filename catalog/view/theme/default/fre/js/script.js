$(window).on("load", function() {
    "use strict";


    /*=================== Sticky Header ===================*/
    var nav_stick;
    if ($(".menubar").hasClass('stick')) {
        var nav_stick = $(".menubar").offset().top + 200;
    }
    $(window).scroll(function() {
        var scroll = $(window).scrollTop();
        if (scroll > nav_stick) {
            $(".menubar.stick").addClass("sticky animated fadeInDown");
            var nav_height = $(".menubar.stick").innerHeight();
            $(".menu-height").css({
                "height": nav_height
            });
        } else if (scroll < nav_stick - 190) {
            $(".menubar.stick").removeClass("sticky animated fadeInDown");
            $(".menu-height").css({
                "height": 0
            });
        }
    });



    /*=================== Header Search ===================*/
    $(".header-search > a").on("click", function() {
        $(this).parent().toggleClass('active');
        return false;
    });

    /*=================== Video Play and Pause Button ===================*/
    $(".play-video").on("click", function() {
        $(this).parent().addClass("active");
        return false;
    });
    $(".pause-video").on("click", function() {
        $(this).parent().removeClass("active");
        return false;
    });


    /*=================== Dropdown Class ===================*/
    $("nav li ul").parent().addClass("has-children");

    /*=================== Accordion ===================*/
    $(".toggle").each(function(){
        $(this).find('.content').hide();
        $(this).find('h2:first').addClass('active').next().slideDown(500).parent().addClass("activate");
        $('h2', this).click(function() {
            if ($(this).next().is(':hidden')) {
                $(this).parent().parent().find("h2").removeClass('active').next().slideUp(500).removeClass('animated fadeInUp').parent().removeClass("activate");
                $(this).toggleClass('active').next().slideDown(500).addClass('animated fadeInUp').parent().toggleClass("activate");
            }
        });
    });


    /*=================== Responsive Menu ===================*/
    $(".menu-button").on("click",function(){
        $(".responsive-menu").addClass("slidein");
        return false;
    });  
    $(".close-menu").on("click",function(){
        $(".responsive-menu").removeClass("slidein");
        return false;
    });  


    /*================== Responsive Menu Dropdown =====================*/
    $(".responsive-menu ul ul").parent().addClass("menu-item-has-children");
    $(".responsive-menu ul li.menu-item-has-children > a").on("click", function() {
        $(this).parent().toggleClass("active").siblings().removeClass("active");
        $(this).next("ul").slideToggle();
        $(this).parent().siblings().find("ul").slideUp();
        return false;
    });


    /*=================== Lightbox ===================*/
    // $(".html5lightbox").html5lightbox();

});