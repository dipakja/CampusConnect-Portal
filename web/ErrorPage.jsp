

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  isErrorPage="true" %>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Something went Wrong!</title>
            <link  rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        
            
    <div class="container text-center ">
        
        <img src="Images/computer.png" class="img-fluid"  alt="Error">
     
        <h3 class="display-3">Somethign went Wrong...</h3>
        
        <%= exception %>
        
        <a href="index.jsp"> <button class="btn bg-primary btn-lg text-white mt-4">Home</button></a>
    </div>
            
            
            
            
            
            
    </head>
    <body>
        
        
        
        
        
        
        
        
        
        
        
        
    </body>
</html>
