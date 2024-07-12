<%-- 
    Document   : index
    Created on : 03-Feb-2024, 1:48:57 pm
    Author     : Dipak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.tech.helper.ConnectionProvider" %>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <!--<link rel="stylesheet" href="./CSS/index.css">-->

    <style>
       body {
        font-family: 'Roboto', sans-serif;
            background-color: #edf3fd;

        }

        .navbar {
            /*background-color: #ee6e73;*/
        }

        .sidebar {
            height: 100%;
            width: 250px;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            /*background-color:#0f172a;*/
            padding-top: 20px;
            /*color: #325D79;*/
        }

    

        .sidebar a:hover {
            color: #3b82f6;
        }

/*        .content {
            margin-left: 250px;
            padding: 20px;
        }*/

        .banner-background {
           clip-path: polygon(25% 0%, 75% 0%, 100% 0, 100% 100%, 0 99%, 0 0);
        }
    
        /* Add this style for the responsive horizontal section */
        .custom-horizontal-section {
            display: flex;
            justify-content: center;
            align-items: flex-start;
         
            padding: 20px;
            margin-top: 0px; /* Adjust this margin based on your needs */
        }

        .custom-horizontal-section h1 {
            color: #F1F5F9;
            text-transform: uppercase;
            font-size: 28px;
        }
           .navbar-nav .nav-item:hover {
        background-color: #f0f0f0; /* Change this to the background color you desire */
        border-radius: 10px; /* Adjust the border-radius as needed */
    }

    </style>

</head>

<body>

<!-- <div class="custom-horizontal-section">
        <h1>MGM's COLLEGE OF ENGINEERING, NANDED</h1>
    </div>-->


    <%@include file="Navbar.jsp" %>    
    
<!-- Sidebar -->
<!--  <div class="sidebar">
         <a href="#"><span><img src="Images/DipakJadhav.jpg" alt="User Profile" width="60px;height:60px" style="border-radius: 40%;"></span></a>
        <a href="index.jsp" style="color:#3b82f6;"><span class="fa fa-home" ></span> Home</a>
        <a href="#"><span class="fa fa-rss"></span> Tech Blogs</a>
        <a href="#"><span class="fas fa-clipboard-list"></span> Category</a>
        <a href="Contact.jsp"><span class="far fa-address-book"></span> Contact</a>
        <a href="login.jsp"><span class="far fa-user-circle"></span> LogIn</a>
        <a href="register.jsp"><span class="fas fa-user-plus"></span> SignUp</a>
    </div>-->

    <!-- Content -->
    <div class="container-fluid mt-5">
       <div class="container-fluid p-0 m-0">
    <div class="jumbotron banner-background ">
        <div class="container " >
            <h1 class="display-2 fw-bold" style="color: #0F172A;">Welcome to the E-Notice Board</h1>
            
            
            
            <p class="lead" style="color: #5f6a79;font-size: 1.7rem;">Your hub for all college notices and updates.</p>
           
  
<!-- Call-to-Action Buttons -->
<div class="text-center mt-4">
    <a href="login.jsp" class="btn btn-lg" style="background-color: #3B82F6; color: white; border-radius: 20px; transition: background-color 0.3s, transform 0.2s; display: inline-block;" 
    onmouseover="this.style.backgroundColor='#1E40AF'; this.style.transform='translateY(-3px)'" 
    onmouseout="this.style.backgroundColor='#3B82F6'; this.style.transform=''">
        <span class="text-white"><i class="fas fa-sign-in-alt"></i></span> &nbsp;&nbsp; Log In
    </a>

    &nbsp; &nbsp; &nbsp;

    <a href="register.jsp" class="btn btn-lg" style="background-color: #3B82F6; color: white; border-radius: 20px; transition: background-color 0.3s, transform 0.2s; display: inline-block;" 
    onmouseover="this.style.backgroundColor='#1E40AF'; this.style.transform='translateY(-3px)'" 
    onmouseout="this.style.backgroundColor='#3B82F6'; this.style.transform=''">
        <span class="text-white"><i class="fas fa-user-circle fa-1x"></i></span>&nbsp;&nbsp; Register
    </a>
</div>


        </div>
        <br><!-- spacing -->



        <br><!-- spacing -->

        <!-- Introduction Section -->
<div class="container" style="background-color: #ffffff; color: #0F172A; padding: 20px; border-radius: 10px;" id="About">
    <div class="row">
        <div class="col-md-8" style="overflow-y: auto;">
            <h2 class="display-4">Stay Informed, Stay Connected!</h2>
            <br> 
            <br>
            <br>
            <div style="color:#475569;">
                <p class="lead" style="font-size:24px;">Discover a new way to stay informed and connected. At our E-Notice Board, we bring you all the important updates and announcements from your college in one convenient place.</p>
                <br>
                <p class="lead" style="font-size:24px;">Here, you're not just a recipient of information; you're an active participant. Professors and students alike can share vital notices, ensuring everyone stays in the loop.</p>
                <br>
                <p class="lead" style="font-size:24px;">Why just read notices when you can share them? Our platform empowers you to post, update, and manage notices effortlessly. Join us and make communication within your college seamless and efficient.<br> And the best part? It's all at your fingertips!</p>
            </div>
        </div>
        <div class="col-md-4 mt-5">
            <!-- Add an eye-catching image related to your blog -->
            <img src="Images/blogs01.png" alt="Blog Image" class="img-fluid">
        </div>
    </div>
</div>

<br>

<!-- New Section -->
<div class="container mt-5" style="background-color: #F1F5F9; padding: 80px 0;">

    <div class="row justify-content-center">

        <!-- First Div -->
        <div class="col-md-4 rounded p-4 shadow" style="background-color: #ffffff; height: 400px; margin-right: 20px; transform: scale(1.1); position: relative; top: -80px;">
            <h2 class="text-primary font-weight-bold mb-4" style="font-size: 30px;">Post and Share</h2>
            <p class="text-muted" style="font-size: 20px;">Craft your notices, share important updates, and contribute to the campus community. Unleash the power of timely communication and keep everyone informed!</p>
        </div>

        <!-- Second Div -->
        <div class="col-md-4 rounded p-4 shadow" style="background-color: #ffffff; height: 400px; margin-right: 60px; transform: scale(1.1); position: relative; top: -60px;">
            <h2 class="text-primary font-weight-bold mb-4" style="font-size: 30px;">Explore Notices</h2>
            <p class="text-muted" style="font-size: 20px;">Discover a wide range of notices covering all aspects of campus life. Dive into the announcements that interest you and stay updated with the latest events and information.</p>
        </div>

        <!-- Third Div -->
        <div class="col-md-4 rounded p-4 shadow" style="background-color: #ffffff; height: 400px; transform: scale(1.1); position: relative; top: -40px; overflow-y: auto;">
            <h2 class="text-primary font-weight-bold mb-4" style="font-size: 30px;">Secure Access & User Dashboard</h2>
            <p class="text-muted" style="font-size: 20px;">Secure your account with our authentication system and enjoy a personalized user dashboard. Manage your profile, track your notices, and engage with the community seamlessly.</p>
        </div>

    </div>

</div>




<video autoplay muted loop id="logo-video">
    <source src="https://designerapp.officeapps.live.com/designerapp/Media.ashx/?id=49f6c28c-14ed-49a0-ae29-e7534e866349.mp4&fileToken=f9723933-6f9d-4cef-971d-ee582c928268&dcHint=JapanEast" type="video/mp4">
    Your browser does not support the video tag.
</video>






<!-- Benefits Section -->
<section class="container-fluid" style="padding: 50px 0;" id="Benefits">
    <div style="border-radius: 20px; overflow: hidden;">
        <h2 class="text-center mb-4" style="color: #5D5DFF;">Benefits</h2>
        <div class="row justify-content-center">
            <!-- Benefit Card 1 -->
            <div class="col-md-4 mb-4">
                <div class="card shadow rounded" style="height: 450px; overflow: hidden;">
                    <div class="moving-card">
                        <div class="card-title" style="height: 70px; border-radius: 20px 20px 0 0;">
                            <h4 class=" text-center mt-3" style="color:black;">Efficient Information Sharing</h4>
                        </div>
                        <div class="card-body" style="overflow-y: auto;">
                            <ul class="card-text text-muted mt-2" style="font-size: 21px; max-height: 300px; overflow-y: auto;">
                                <li class="mt-5" type="square">Access important notices and updates in one centralized location</li>
                                <li class="mt-5" type="square">Stay informed about deadlines, events, and academic announcements</li>
                                <li class="mt-5" type="square">Contribute to a streamlined communication process across campus</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Benefit Card 2 -->
            <div class="col-md-4 mb-4">
                <div class="card shadow rounded" style="height: 450px; overflow: hidden;">
                    <div class="moving-card">
                        <div class="card-title" style="height: 70px; border-radius: 20px 20px 0 0;">
                            <h4 class=" text-center mt-3" style="color:black;">Stay Informed and Organized</h4>
                        </div>
                        <div class="card-body" style="overflow-y: auto;">
                            <ul class="card-text text-muted" style="font-size: 21px; max-height: 300px; overflow-y: auto;">
                                <li class="mt-5" type="square">Access all notices and updates conveniently</li>
                                <li class="mt-5" type="square">Never miss deadlines or important announcements</li>
                                <li class="mt-5" type="square">Easily manage and update your own notices</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Benefit Card 3 -->
            <div class="col-md-4 mb-4">
                <div class="card shadow rounded" style="height: 450px; overflow: hidden;">
                    <div class="moving-card">
                        <div class="card-title" style="height: 70px; border-radius: 20px 20px 0 0;">
                            <h4 class=" text-center mt-3" style="color:black;">Easy to Use and Secure</h4>
                        </div>
                        <div class="card-body" style="overflow-y: auto;">
                            <ul class="card-text text-muted" style="font-size: 21px; max-height: 300px; overflow-y: auto;">
                                <li class="mt-5" type="square">Simple design for effortless browsing</li>
                                <li class="mt-5" type="square">Secure login and personal dashboard</li>
                                <li class="mt-5" type="square">Easily post, update, and remove notices</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>



<!-- Accordion Section -->
<section class="container-fluid text-light" style="padding: 50px 0;background-color: #FFFFFF;border-radius: 20px; border: 2px solid #3b82f6;">
    <div>
        <div class="accordion" id="accordionExample">
            <div class="accordion-item mb-4">
                <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne" style="background-color: #ffffff; color: #3B82F6;font-size: 24px;">
                        How does it work?
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                    <div class="accordion-body" style="font-size:18px;">
           Easily post and browse notices, comment, and collaborate with others.
                    </div>
                </div>
            </div>
            <div class="accordion-item mb-4">
                <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" style="background-color: #ffffff; color: #3B82F6; font-size: 24px;">
                        What benefits do I get?
                    </button>
                </h2>
                <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                    <div class="accordion-body" style="font-size:18px;">
                 Enhanced communication, efficient information sharing, and improved community engagement.
                    </div>
                </div>
            </div>
            <div class="accordion-item mb-4">
                <h2 class="accordion-header" id="headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" style="background-color: #ffffff; color: #3B82F6; font-size: 24px;">
                        How can I get started?
                    </button>
                </h2>
                <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                    <div class="accordion-body" style="font-size:18px;">
                    Sign up, explore notices, and start posting your own updates and announcements.
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<br><!-- space  -->
<!--footer section-->
<footer class="text-center text-lg-start py-5 mt-5" style="background-color: #F1F5F9; border-radius: 20px; box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);" id="FAQ">
    <div class="container">
        <div class="row">
            <!-- About Me -->
            <div class="col-lg-4 col-md-6 mb-4 mb-md-0">
                <h5 class="text-uppercase">About us</h5>
                <p class="text-muted">We are  Third Year IT Department students.</p>
            </div>
            <!-- Contact -->
            <div class="col-lg-4 col-md-6 mb-4 mb-md-0">
                <h5 class="text-uppercase">Contact</h5>
                <p class="text-muted">Email: dipakja01@gmail.com<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; daserushi@gmail.com<br>
                                             Phone: +918767421633<br>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;   +919404465593</p>
            </div>
            <!-- GitHub -->
            <div class="col-lg-4 col-md-6 mb-4 mb-md-0">
                <h5 class="text-uppercase">GitHub</h5>
                <a href="https://github.com/dipakja" target="blank" class="text-muted"><i class="fab fa-github"></i> GitHub Profile</a>
            </div>
            <!-- Copyright -->
            <div class="col-12 mt-5">
                <p class="text-muted">© 2024 dipakJadhav & rushikeshdase. All rights reserved.</p>
            </div>
        </div>
    </div>
</footer>
<script>
//    setTimeout(function() {
//        window.location.href = "index.jsp"; // Redirect to your index page
//    }, 5000); // Redirect after 5 seconds (adjust the duration as needed)
//</script>


    <!-- Scripts -->
    <script src="https://kit.fontawesome.com/7c992a4c91.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <!-- Compiled and minified JavaScript -->
    <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>-->
    <script src="Js/index.js" type="text/javascript"></script>

</body>

</html>
