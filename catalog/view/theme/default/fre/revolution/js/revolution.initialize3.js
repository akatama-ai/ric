					var tpj=jQuery;					
					var revapi116;
					tpj(document).ready(function() {
						if(tpj("#rev_slider_4_1").revolution == undefined){
							revslider_showDoubleJqueryError("#rev_slider_4_1");
						}else{
							revapi116 = tpj("#rev_slider_4_1").show().revolution({
								sliderType:"standard",
								jsFileLocation:"../revolution/js/",
								sliderLayout:"auto",
								dottedOverlay:"none",
								delay:5000,
	                            navigation: {
	                                keyboardNavigation: "on",
	                                keyboard_direction: "horizontal",
	                                mouseScrollNavigation: "off",
	                                onHoverStop: "off",
	                                touch: {
	                                    touchenabled: "on",
	                                    swipe_threshold: 75,
	                                    swipe_min_touches: 1,
	                                    swipe_direction: "horizontal",
	                                    drag_block_vertical: false
	                                },
	                                arrows: {
	                                    style: "erinyen",
	                                    enable: false,
	                                    hide_onmobile: true,
	                                    hide_onleave: false,
	                                    tmp: '<div class="tp-title-wrap">	<span class="tp-arr-titleholder">{{title}}</span>    <span class="tp-arr-imgholder"></span> </div>',
	                                    left: {
	                                        h_align: "left",
	                                        v_align: "bottom",
	                                        h_offset: 10,
	                                        v_offset: 250
	                                    },
	                                    right: {
	                                        h_align: "right",
	                                        v_align: "bottom",
	                                        h_offset: 10,
	                                        v_offset: 250
	                                    }
	                                },
									bullets: {
										enable:true,
										hide_onmobile:true,
										style:"border:0",
										hide_under:600,
										style:"metis",
										hide_onleave:true,
										hide_delay:200,
										hide_delay_mobile:1200,
										direction:"horizontal",
										h_align:"center",
										v_align:"bottom",
										h_offset:0,
										v_offset:-30,
										space:10,
										tmp:'<span class="tp-bullet-img-wrap">  <span class="tp-bullet-image"></span></span><span class="tp-bullet-title">{{title}}</span>'
									}	                                
	                            },
								viewPort: {
									enable:true,
									outof:"pause",
									visible_area:"80%"
								},
								gridwidth:1240,
								gridheight:690,
								lazyType:"none",
								shadow:0,
								spinner: 'spinner0',
								stopLoop:"off",
								stopAfterLoops:-1,
								stopAtSlide:-1,
								shuffle:"off",
								autoHeight:"off",
								hideThumbsOnMobile:"off",
								hideSliderAtLimit:0,
								hideCaptionAtLimit:0,
								hideAllCaptionAtLilmit:0,
								debugMode:false,
								fallbacks: {
									simplifyAll:"off",
									nextSlideOnWindowFocus:"off",
									disableFocusListener:false,
								}
							});
						}
					});	/*ready*/

