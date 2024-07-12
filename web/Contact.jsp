<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Contact Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./CSS/index.css">
    <style>
         body {
            font-family: 'Arial', sans-serif;
            background-color: #325D79;
        }

        .navbar {
            background-color: #ee6e73;
        }

        .sidebar {
            height: 100%;
            width: 250px;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #0C134F;
            padding-top: 20px;
            color: #325D79;
        }

        .sidebar a {
            padding: 15px;
            text-decoration: none;
            font-size: 18px;
            color: #818181;
            display: block;
            transition: 0.3s;
        }

        .sidebar a:hover {
            color: #F9A26C;
        }

        .content {
            margin-left: 250px;
            padding: 20px;
        }

        .banner-background {
           clip-path: polygon(25% 0%, 75% 0%, 100% 0, 100% 100%, 0 99%, 0 0);
        }
    
        /* Add this style for the responsive horizontal section */
        .custom-horizontal-section {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            background-color: #0C134F;
            padding: 20px;
            margin-top: 0px; /* Adjust this margin based on your needs */
        }

        .custom-horizontal-section h1 {
            color: #ee6e73;
            text-transform: uppercase;
            font-size: 24px;
        }
        .section-background-you {
            background-color: #f6f6f6; /* Set your desired background color for you */
            padding: 30px;
            border-radius: 15px;
            margin-bottom: 20px;
             overflow-x: hidden;
        }

        .section-background-friend {
            background-color: #e8faff; /* Set your desired background color for your friend */
            padding: 30px;
            border-radius: 15px;
            margin-bottom: 20px;
            overflow-x: hidden;
        }
    </style>
</head>
<body>
 <div class="custom-horizontal-section">
        <h1>MGM's COLLEGE OF ENGINEERING, NANDED</h1>
    </div>

    <!-- Navbar -->
    <%@include file="Navbar.jsp" %>

    <!-- Introduction Section - You and Your Friend -->
    <div class="container mt-5 content">
        <!-- You -->
        <div class="row mb-5 section-background-you">
            <div class="col-md-6">
                <h2>About Me</h2>
                <p style="opacity: 0;" class="fade-in">I am a third-year student passionate about technology and coding. Welcome to my contact page! Let's connect and explore the world of tech together.</p>
                <ul style="opacity: 0;" class="fade-in">
                    <li>Skills:
                        <ul>
                            <li>Java</li>
                            <li>JDBC</li>
                            <li>MySQL</li>
                            <li>HTML</li>
                            <li>CSS</li>
                            <li>JavaScript</li>
                        </ul>
                    </li>
                    <li>I am a Microsoft Learn Student Ambassador.</li>
                    <li>I am also an open-source contributor.</li>
                </ul>
            </div>
            <div class="col-md-6 text-center">
                <img src="./Images/DipakJadhav.jpg" alt="Your Profile Image" class="img-fluid rounded-circle mb-3" width="300px">
                <!-- Social Profiles Section - You -->
                <div class="fade-in" style="opacity: 0;">
                    <a href="https://www.linkedin.com/in/dipak-jadhav-8300081b4/" target="_blank" class="text-dark me-3">
                        <i class="fab fa-linkedin fa-2x"></i>
                    </a>
                    <a href="https://twitter.com/DipakJa44213008" target="_blank" class="text-dark me-3">
                        <i class="fab fa-twitter fa-2x"></i>
                    </a>
                    <a href="https://github.com/dipakja" target="_blank" class="text-dark">
                        <i class="fab fa-github fa-2x"></i>
                    </a> &nbsp;
                      <a href="https://dipakja.github.io/" target="_blank" class="text-dark">
                        <i class="fa fa-user-circle fa-2x"></i>
                    </a>
                </div>
            </div>
        </div>
        
      

<!--     Animation Section (Example: Bouncing Ball) 
    <div class="container mt-5">
        <h2>Interactive Animation</h2>
        <div class="text-center">
            <div class="ball"></div>
        </div>
    </div>-->

    <script src="https://kit.fontawesome.com/7c992a4c91.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>-->
    <script src="Js/index.js" type="text/javascript"></script>

    <script>
        // Example animation (bouncing ball)
        $(document).ready(function(){
            fadeInSections();
            animateBall();
        });

        function animateBall() {
            $(".ball").animate({top: '+=20px'}, 1000, function(){
                $(".ball").animate({top: '-=20px'}, 1000, function(){
                    animateBall();
                });
            });
        }

        function fadeInSections() {
            $('.fade-in').each(function (index) {
                $(this).delay(500 * index).animate({ opacity: 1 }, 500);
            });
        }
    </script>

</body>
</html>
