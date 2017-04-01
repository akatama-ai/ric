
$(document).ready(function() {

    // $('#blockchain').append('<iframe style="width:100%; height:500px; margin-top:-60px; z-index: 1;border: none !important;" src="https://blockchain.info/charts/market-price?showDataPoints=true&timespan=30days&show_header=false&daysAverageString=1&scale=0"></iframe>');
    
    var funDaskboard = {
        ajaxSumTreeMember : function(callback) {
            $.ajax({
                url : $('.downline-tree').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.downline-tree').data('id')
                },
                async : false,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },

        ajaxGetPin : function(callback) {
            $.ajax({
                url : $('.pin-balence').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.pin-balence').data('id')
                },
                async : false,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },

        ajaxAnalytics : function(element, callback) {
            $.ajax({
                url : element.data('link'),
                type : 'GET',
                data : {
                    'id' : element.data('id'),
                    'level' : element.data('level')
                },
                async : false,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetTotalPD : function(callback) {
            $.ajax({
                url : $('.pd-count').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.pd-count').data('id')
                },
                async : false,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetTotalGD : function(callback) {
            $.ajax({
                url : $('.gd-count').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.gd-count').data('id')
                },
                async : false,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },

        ajaxGetR_Wallet : function(callback) {
            $.ajax({
                url : $('.r-wallet').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.r-wallet').data('id')
                },
                async : false,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },

        ajaxGetC_Wallet : function(callback) {
            $.ajax({
                url : $('.c-wallet').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.c-wallet').data('id')
                },
                async : false,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetCN_Wallet : function(callback) {

            $.ajax({

                url : $('.cn-wallet').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.cn-wallet').data('id')
                },
                async : false,
                success : function(result) {
                    console.log(result);
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetM_Wallet : function(callback) {
            $.ajax({
                url : $('.m-wallet').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.m-wallet').data('id')
                },
                async : false,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetTotal_Binary_Left : function(callback) {
            $.ajax({
                url : $('.total_left').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.total_left').data('id')
                },
                async : false,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetTotal_PD_Left : function(callback) {
            $.ajax({
                url : $('.total_pd_left').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.total_pd_left').data('id')
                },
                async : false,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetTotal_Binary_Right : function(callback) {
            $.ajax({
                url : $('.total_right').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.total_right').data('id')
                },
                async : false,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetTotal_PD_Right : function(callback) {
            $.ajax({
                url : $('.total_pd_right').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.total_pd_right').data('id')
                },
                async : false,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
    }

   setTimeout(function() {
        funDaskboard.ajaxGetTotalPD(function(result) {
            _.has(result, 'success') && $('.pd-count').html(_.values(result)[0]+ ' BTC');
            _.each($('.pd-count').data(), function(v, e) {
                $('.pd-count').removeAttr('data-' + e);
            });

            $('.tile-image-ph + div.tile-footer').css({
                'background-image' : 'none'
            });
        });

        funDaskboard.ajaxGetR_Wallet(function(result) {
            _.has(result, 'success') && $('.r-wallet').html(_.values(result)[0] + ' BTC');
            _.each($('.r-wallet').data(), function(v, e) {
                $('.r-wallet').removeAttr('data-' + e);
            });

            $('div.tile-image-r-wallet + div.tile-footer').css({
                'background-image' : 'none'
            });
        });

        funDaskboard.ajaxGetC_Wallet(function(result) {
            _.has(result, 'success') && $('.c-wallet').html(_.values(result)[0] + ' BTC');
            _.each($('.c-wallet').data(), function(v, e) {
                $('.r-wallet').removeAttr('data-' + e);
            });

            $('.tile-image-c-wallet + div.tile-footer').css({
                'background-image' : 'none'
            });
        });
        funDaskboard.ajaxGetCN_Wallet(function(result) {
            _.has(result, 'success') && $('.cn-wallet').html(_.values(result)[0] + ' BTC');
            _.each($('.cn-wallet').data(), function(v, e) {
                $('.r-wallet').removeAttr('data-' + e);
            });

            $('.tile-image-c-wallet + div.tile-footer').css({
                'background-image' : 'none'
            });
        });

        funDaskboard.ajaxGetTotal_Binary_Left(function(result) {
            _.has(result, 'success') && $('.total_left').html(_.values(result)[0]);
            _.each($('.total_left').data(), function(v, e) {
                $('.total_left').removeAttr('data-' + e);
            });

            
        });
        funDaskboard.ajaxGetTotal_PD_Left(function(result) {
            _.has(result, 'success') && $('.total_pd_left').html(_.values(result)[0] + ' BTC');
            _.each($('.total_pd_left').data(), function(v, e) {
                $('.total_pd_left').removeAttr('data-' + e);
            });

            
        });
        funDaskboard.ajaxGetTotal_Binary_Right(function(result) {
            _.has(result, 'success') && $('.total_right').html(_.values(result)[0]);
            _.each($('.total_right').data(), function(v, e) {
                $('.total_right').removeAttr('data-' + e);
            });

           
        });
        funDaskboard.ajaxGetTotal_PD_Right(function(result) {
            _.has(result, 'success') && $('.total_pd_right').html(_.values(result)[0] + ' BTC');
            _.each($('.total_pd_right').data(), function(v, e) {
                $('.total_pd_right').removeAttr('data-' + e);
            });
            if (location.hash === '#success') {
                alertify.set('notifier','delay', 100000000);
                alertify.set('notifier','position', 'top-right');
                alertify.success('Create user successfull !!!');
            }
            $('.bxslider').bxSlider({
              minSlides: 4,
              maxSlides: 4,
              slideWidth: 100,
              slideMargin: 10,
              ticker: true,
              speed: 90000
            });
            
            // $('.media-player').attr('poster', 'http://il5.picdn.net/shutterstock/videos/16914442/thumb/1.jpg');
            // setTimeout(function() {
            //     $('.media-player').attr('src', 'http://ak2.picdn.net/shutterstock/videos/16914442/preview/stock-footage-abstract-animation-of-bitcoin-currency-sign-in-digital-cyberspace.mp4');
            // }, 3000);
        });
    }, 0)

    

});
