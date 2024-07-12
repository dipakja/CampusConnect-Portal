<%-- 
    Document   : loginPage
    Created on : 04-Feb-2024, 5:17:16 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tech.entities.Message" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
             <link  rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="CSS/index.css">

        <style>
       body {
        font-family: 'Roboto', sans-serif;
            background-color: #edf3fd;

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
       
        
<!--           <div class="custom-horizontal-section">
        <h1>MGM's COLLEGE OF ENGINEERING, NANDED</h1>
    </div>-->
        
        <!-- Sidebar -->
<header class="navbar navbar-expand-md navbar-light bg-light" style="border-bottom: 1px solid #dee2e6; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
    <div class="container-fluid">
        <!-- Logo -->
        <a class="navbar-brand" href="index.jsp">
           <img src="Images/logo01.png" alt="Logo" height="80">
        </a>

        <!-- Navigation Links -->
        <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item" style="margin-left: 28px;">
                    <a class="nav-link font-weight-bold" style="font-size: 24px; transition: background 0.3s ease;color: #484848 !important;" href="index.jsp">Home</a>
                </li>
                <li class="nav-item" style="margin-left: 28px;">
                    <a class="nav-link font-weight-bold" style="font-size: 24px; transition: background 0.3s ease;color: #484848 !important;" href="index.jsp">About</a>
                </li>
                <li class="nav-item text-dark" style="margin-left: 28px;">
                    <a class="nav-link font-weight-bold" style="font-size: 24px; transition: background 0.3s ease;color: #484848 !important;" href="index.jsp">FAQ</a>
                </li>
                <li class="nav-item" style="margin-left: 28px;">
                    <a class="nav-link font-weight-bold" style="font-size: 24px; transition: background 0.3s ease;color: #484848 !important;" href="index.jsp">Benefits</a>
                </li>
            </ul>
        </div>
    </div>
</header>

        
      <main class="d-flex align-items-center text-dark banner-background content" style="height: 80vh;background-color:#EDF3FD;">
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3" style="">
                <div class="card bg-dark" style="width: 100%;">
                    <div class="card-header" style="background-color: #3B82F6">
                        <span class="fa far fa-user-circle fa-4x d-flex justify-content-center"></span>
                        <h3 class="d-flex justify-content-center">Login </h3>
                    </div>
                    <% 
                    Message m = (Message) session.getAttribute("msg");
                    if(m!=null){
                    %>
                    <br>
                    <div class="alert <%=m.getCssClass() %>" role="alert">
                        <%= m.getContent()%>  
                    </div>
                    <%
                    session.removeAttribute("msg");
                    }
                    %>
                    <div class="card-body" style="background-color:#F1F5F9;" >
                        <form action="loginServlet" method="post">
                            <div class="row mb-3">
                                <label for="inputEmail3" class="col-sm-6 col-form-label">Email</label>
                                <div class="col-sm-12">
                                    <input type="email" class="form-control" id="inputEmail3" name="user_email" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputPassword3" class="col-sm-6 col-form-label">Password</label>
                                <div class="col-sm-12">
                                    <input type="password" class="form-control" id="inputPassword3" name="user_password" required>
                                </div>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-primary" style="background-color:#3B82F6;">Sign in</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

      
      
      
      
      
      
      
      
      
      
      
      
      
        
        
        
        
        
            <script src="https://kit.fontawesome.com/7c992a4c91.js" crossorigin="anonymous"></script>
       <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
   <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    
    </body>
</html>
