<?php
session_start();

if ( isset($_SESSION['apriori_toko_id']) ) {
    header("location:index.php");
}

$login = 0;
if (isset($_GET['login'])) {
    $login = $_GET['login'];
}

if ($login == 1) {
    $komen = "Silahkan Login Ulang, Cek username dan Password Anda!!";
}

include_once "fungsi.php";
?>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>Login - Apriori toko</title>
        <link href="images/icon/login.gif" rel="shortcut icon" />
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto+Slab:400,700,300,100">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,400italic,300italic,300,500,500italic,700,900">
        <!--
        Artcore Template
		http://www.templatemo.com/preview/templatemo_423_artcore
        -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="scripts/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/templatemo-misc.css">
        <link rel="stylesheet" href="css/templatemo-style.css">
        <link rel="stylesheet" href="scripts/ionicons/css/ionicons.min.css">
        <link rel="stylesheet" href="scripts/toast/jquery.toast.min.css">
        <script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>

    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an outdated browser. <a href="http://browsehappy.com/">Upgrade your browser today</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to better experience this site.</p>
        <![endif]-->

        <section id="pageloader">
            <div class="loader-item fa fa-spin colored-border"></div>
        </section> <!-- /#pageloader -->

        <?php
        include "header.php";
        ?>

        <div class="content-wrapper">
            <div class="inner-container container">
                <div class="row">
                    <div class="section-header col-md-12">
                        <h2>Login Page</h2>
                        <!-- <span>Subtitle Goes Here</span> -->
                    </div> <!-- /.section-header -->
                </div> <!-- /.row -->
                <div class="contact-form">
                    <div class="box-content col-md-12">
                        <div class="row">
                            <div class="col-md-7">
                                <p></p>
                                <!-- <h3 class="contact-title">Send Us Email</h3> -->
                                <?php
                                if (isset($komen)) {
                                    display_error("Login failed");
                                }
                                ?>
                                <div class="contact-form-inner">
                                    <form method="post" action="cek-login.php" >
                                        <p>
                                            <label for="username">Username:</label>
                                            <input name="username" type="text" id="username">
                                        </p>
                                        <p>
                                            <label for="password">Password:</label>
                                            <input name="password" type="password" id="password">   
                                        </p>
                                        
                                        <input type="submit" class="mainBtn" id="submit" value="Login" />
                                    </form> 

                                </div> <!-- /.contact-form-inner -->
                                <!-- <div id="message"></div> -->
                            </div> <!-- /.col-md-7 -->
                            
                        </div> <!-- /.row -->
                    </div> <!-- /.box-content -->
                </div> <!-- /.contact-form -->
            </div> <!-- /.inner-content -->
        </div> <!-- /.content-wrapper -->

        <script src="js/vendor/jquery-1.11.0.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.0.min.js"><\/script>')</script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>

        
        
        
        <!-- Preloader -->
        <script type="text/javascript">
            //<![CDATA[
            $(window).load(function() { // makes sure the whole site is loaded
                $('.loader-item').fadeOut(); // will first fade out the loading animation
                    $('#pageloader').delay(350).fadeOut('slow'); // will fade out the white DIV that covers the website.
                $('body').delay(350).css({'overflow-y':'visible'});
            })
            //]]>
        </script>

    </body>
</html>
