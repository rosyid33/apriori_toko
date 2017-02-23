/* 
	Artcore Template
	http://www.templatemo.com/preview/templatemo_423_artcore
*/

jQuery(document).ready(function($) {

	'use strict';


	/************** Toggle *********************/
    	$('.toggle-id').on('click', function() {
            var id = $(this).attr('href');
            $(id).slideToggle(250);
            return false;
        });



    /************** Responsive navigation *********************/
        $('a.toggle-menu').click(function(){
            $('#responsive-menu').stop(true,true).slideToggle();
            return false;
        });




    /************** Superfish (DropDown Menu) *********************/
        function initSuperFish(){
            
            $(".sf-menu").superfish({
                 delay:  50,
                 autoArrows: true,
                 animation:   {opacity:'show'}
                 //cssArrows: true
            });
            
        }
        
        initSuperFish();

        $('.sub-menu').addClass('animated fadeInRight');



    /************** Search Overlay *********************/
        $('#search-icon').on('click', function() {
            $('#search-overlay').removeClass('animated bounceOutUp');
            $('#search-overlay').fadeIn(0).addClass('animated bounceInDown');
            $('.search-form-holder input[type="search"]').focus();
            return false;
        });

        $('.close-search').on('click', function() {
            $('#search-overlay').removeClass('animated bounceInDown');
            $('#search-overlay').addClass('animated bounceOutUp');
            return false;
        });

        jQuery(document).keyup(function(e) {
    	    if (e.keyCode === 27) {
    	        $('#search-overlay').removeClass('animated bounceInDown');
    	        $('#search-overlay').addClass('animated bounceOutUp');
    	        return false;
    	    } // esc
    	});

    


	/************** Full Screen Slider *********************/
    	$(window).resize(function(){
    	    var height = $(window).height();
    	    var width  = $(window).width();
    	    $('.swiper-container, .swiper-slide').height(height);
    	    $('.swiper-container, .swiper-slide').width(width);

    	})
    	$(window).resize(); 


    	$('.arrow-left, .arrow-right').on('click', function() {
            $('.slider-caption h2').removeClass('animated fadeInDown');
            $('.slider-caption h2').fadeIn(0).addClass('animated fadeInDown');
            $('.slider-caption p').removeClass('animated fadeInUp');
            $('.slider-caption p').fadeIn(0).addClass('animated fadeInUp');
        });

    	var mySwiper = new Swiper('.swiper-container',{
    	    mode:'horizontal',
    	    loop: true,
    	    keyboardControl: true
    	  })
    	  $('.arrow-left').on('click', function(e){
    	    e.preventDefault()
    	    mySwiper.swipePrev()
    	  })
    	  $('.arrow-right').on('click', function(e){
    	    e.preventDefault()
    	    mySwiper.swipeNext()

    	})



	/************** SlideJS *********************/
    	$('.project-slider').slidesjs({
    		pagination: false,
    		navigation: {
    	      active: false,
    	      effect: "fade"
    	    }
        });



    /************** Animated Hover Effects *********************/
        $('.staff-member').hover(function(){
    	    $('.overlay .social-network').addClass('animated fadeIn');
    	}, function(){
    	    $('.overlay .social-network').removeClass('animated fadeIn');
    	});

    	$('.blog-thumb, .project-item').hover(function(){
    	    $('.overlay-b a').addClass('animated fadeIn');
    	}, function(){
    	    $('.overlay-b a').removeClass('animated fadeIn');
    	});



	/************** Mixitup (Filter Projects) *********************/
    	$('.projects-holder').mixitup({
            effects: ['fade','grayscale'],
            easing: 'snap',
            transitionSpeed: 400
        });




    /************** FancyBox Lightbox *********************/
        $(".fancybox").fancybox();




    /************** Contact Form *********************/
        $('#contactform').submit(function(){

            var action = $(this).attr('action');

            $("#message").slideUp(750,function() {
            $('#message').hide();

            $('#submit')
                
                .attr('disabled','disabled');

            $.post(action, {
                name: $('#name').val(),
                email: $('#email').val(),
                phone: $('#phone').val(),
                comments: $('#comments').val()
            },
                function(data){
                    document.getElementById('message').innerHTML = data;
                    $('#message').slideDown('slow');
                    $('#submit').removeAttr('disabled');
                    if(data.match('success') != null) $('#contactform').slideUp('slow');

                }
            );

            });

            return false;

        });







});








    /************** Blog Masonry Isotope *********************/
        $(window).load(function () {
            blogisotope = function () {
                var e, t = $(".blog-masonry").width(),
                    n = Math.floor(t);
               	if ($(".blog-masonry").hasClass("masonry-true") === true) {
                    n = Math.floor(t * .3033);
                    e = Math.floor(t * .04);
                    if ($(window).width() < 1023) {
                        if ($(window).width() < 768) {
                            n = Math.floor(t * 1)
                        } else {
                            n = Math.floor(t * .48)
                        }
                    } else {
                        n = Math.floor(t * .3033)
                    }
                }
                return e
            };
            var r = $(".blog-masonry");
            bloggingisotope = function () {
                r.isotope({
                    itemSelector: ".post-masonry",
                    animationEngine: "jquery",
                    masonry: {
                        gutterWidth: blogisotope()
                    }
                })
            };
            bloggingisotope();
            $(window).smartresize(bloggingisotope)
        })



