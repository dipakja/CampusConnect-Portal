<%-- 
    Document   : profile.jsp
    Created on : 15-Feb-2024, 9:48:51 pm
    Author     : HP
--%>
<%@page  errorPage="ErrorPage.jsp" %>
<%@page  import="com.tech.entities.User" %>
<%@page  import="com.tech.entities.Message" %>
<%@page  import="com.tech.entities.Category" %>
<%@page  import="com.tech.dao.Postdao" %>
<%@page  import="com.tech.helper.ConnectionProvider" %>
<%@ page import="java.util.ArrayList" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
                
   

User user =(User) session.getAttribute("currentUser");
if(user==null)
{

response.sendRedirect("login.jsp");
}


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link  rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./CSS/index.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <!--sweet alert cdn-->
        <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.10.5/sweetalert2.min.css">
        
        <!--tinymce-->
        <script src="https://cdn.tiny.cloud/1/ujgh3kd92eb1dcjlmfuzwkc2tkjcmoes2ssh7oft5xo57c45/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
        
        <style>
              body{
                
                background-color:#325D79;
                background-size: cover;
                background-attachment: fixed;
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
        }

        .sidebar a {
            padding: 15px;
            text-decoration: none;
            font-size: 18px;
            color: #9BD7D1;
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
        </style>
    </head>
    <body>
     
        <!--Navabar start-->
        
        <div class="custom-horizontal-section">
        <h1>MGM's COLLEGE OF ENGINEERING, NANDED</h1>
    </div>
        
        <nav
        <!-- Sidebar -->
    <div class="sidebar">
        <a href="index.jsp"><img src="Images/logo01.png" alt="Logo" height="80"></a>
        <a href="index.jsp"><span class="fa fa-home"></span> Home</a>
        
        <!--<a href="#"><span class="fa fa-rss"></span> Tech Blogs</a>-->
 
           <!-- Categories -->
<div class="list-group">
    <a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: #9BD7D1;">
        <span class="fa fa-rss"></span> Categories
    </a>
    <ul class="dropdown-menu">
        <li>
            <a class="dropdown-item  list-group-item list-group-item-action"
               href="#"
               onclick="getPosts(0, this)" <!-- Assuming 0 represents "All Posts" category -->
            
                All Posts
            </a>
        </li>
        <!-- Other categories fetched dynamically -->
        <%
            Postdao da = new Postdao(ConnectionProvider.getConnection());
            ArrayList<Category> list1 = da.getAllCategories();
            for (Category cc : list1) {
        %>
        <li>
            <a class="dropdown-item  list-group-item list-group-item-action"
               href="#"
               onclick="getPosts(<%= cc.getcId() %>, this)"
               style="color: #9BD7D1; background-color: #0C134F;">
                <%= cc.getName() %>
            </a>
        </li>
        <%
            }
        %>
    </ul>
</div>

                          <!--end categoreis-->
                              <!--<a href="#"><span class="far fa-address-book"></span> Contact</a>-->
          <a  href="#" data-bs-toggle="modal" data-bs-target="#post-modal" > <sapn class="fa fa-newspaper-o"></sapn> Write Post</a>
        
        <a href="#" data-bs-toggle="modal" data-bs-target="#profile-modal" > <sapn class="fa fa-user-circle-o"></sapn> <%= user.getName() %> </a>
         <a href="LogoutServlet"> <sapn class="fas fa-user-plus"></sapn>  LogOut</a>

                    </div> 

    </div>
</nav>
  
        <!--navabar end-->
        
        <!--message showing-->
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
                  
     
        <!--message showing end-->
        
        
        <!--main body of the page-->
        
        <main class="content">
            <div class="container">
                
                <div class="row mt-4">
                    <!--first colume with 4 grid-->
                    <!--<div class="col-md-4">-->
                        
                        <!--categories-->

                        
                    <!--second column with 8grid-->
                    <div class="col-md-12">
                        
                        <!--posts-->
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        <div class="container text-center" id="loader">
                            
                            <i class="fa fa-refresh fa-5x fa-spin"></i>
                            <h3 class="mt-3">Loading...</h3>
                        </div>
                        
                        <div class="container-fluid" id="post-container">
                            
                           
                            
                            
                            
                        </div>
                   
                    </div>
                    
                    
                    
                    
                </div>
                
                
            </div>
            
        </main>
        
        
        
        
        
        <!--main body end of the page-->
        
        
 <!--post modal start--> 
        
<!-- Modal -->
<div class="modal fade" id="post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Provide the post details</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          
          <!--form start-->
        <form id="add-post-form" action="AddPostServlet" method="post">
             
   <!--categories of blogs-->         
   <div class="form-group">
       <select class="form-control" name="cid">
           <option selected disabled >----Select the Category----</option>
           
           <%
               
Postdao postd = new Postdao(ConnectionProvider.getConnection());
  ArrayList<Category> list =  postd.getAllCategories();
for(Category c: list)
{
     
           %>
           
           
           
           <option value="<%= c.getcId() %> "> <%= c.getName() %> </option>
  
       
           
  <%
      }
  %>
       
   </select>
   </div>
            
   <br>
            
            
            
    <div class="form-group">
        <input type="text" id="postTitle" name="pTitle" placeholder="Enter the post title" class="form-control">
    </div>
            <br>
    <div class="form-group">
        <textarea id="postContent" name="pContent" class="form-control" placeholder="Enter your content" style="height: 250px;"></textarea>
    </div>
     <br>
<!--    <div class="form-group">
        <textarea id="postCode" name="pCode" class="form-control" placeholder="Enter your code if any.." style="height: 200px;"></textarea>
    </div>-->
     <br>
    <div class="form-group">
        
        <label>Select your pic: </label>
        <br>
        
        <input type="file" id="postPic" name="pic" class="form-control" accept="image/*" placeholder="Upload your picture">
    </div>
 <br>
    <!-- Add a submit button to submit the form -->
    <div class="container text-center">
        <button type="submit" class="btn btn-primary">Post</button>
    </div>
</form>


          
          
          <!--form end-->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
        
        
        
        <!--post modal ended-->
 
 
        <!--profile modal-->
        
        <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#3b82f6;">
        
          <h1 class="modal-title fs-5" id="exampleModalLabel"> <sapn class="fa fa-user-circle-o text-center"></sapn> <%= user.getName()%></h1>
           
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"  ></button>
      </div>
    <div class="modal-body" style="padding: 20px; background-color: #f8f9fa;">
        <div class="container text-center">
               <img class="img-fluid text-center" src="Pic/<%=user.getProfile()%>" style="max-width:150px;">
    <br><!-- name -->

    <h5 class=" modal-title mt-3" id="exampleModalLabel"><%=user.getName()%> </h5>
    
 <!--profile modal end-->
 
 
    <!--details-->
    
    <div id="profile-details">
    <table class="table">
 
  <tbody>
    <tr>
      <th scope="row">ID : </th>
      <td><%= user.getId() %></td>

    </tr>
    <tr>
      <th scope="row">Email : </th>
      <td><%= user.getEmail() %></td>

    </tr>
    <tr>
      <th scope="row">Gender : </th>
      <td><%= user.getGender() %></td>
     
    </tr>
    <tr>
      <th scope="row">Status : </th>
      <td><%= user.getAbout() %></td>
     
    </tr>
  </tbody>
</table>
    </div>
    
      
      <!--profile edit code-->
      
      <div id="profile-edit" style="display:none">
          
          
          <h3>Edit Carefully!</h3>
          <br>
          
          <!--we are using enctype="multipart/form-data" it shows the form is carrying some image, video data-->
          
          <form action="EditServlet" enctype="multipart/form-data"    method="post">
              
              <table class="table">
                  
                  <tr>
                      <td> ID:</td>
                      <td> <%= user.getId()%> </td>
                      
                  </tr>
                  <tr>
                      <td> Name:</td>
                      <td><input type="text" class="form-control" name="user_name" value="<%=user.getName() %>">   </td>
                      
                  </tr>
                  <tr>
                      <td> Email:</td>
                      <td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail() %>">   </td>
                      
                  </tr>
                  <tr>
                      <td> Password:</td>
                      <td><input type="password" class="form-control" name="user_password" value="<%=user.getPassword() %>">   </td>
                      
                  </tr>
              
                  <tr>
                      <td> About: </td>
                      <td> 
                          <textarea class="form-control" name="user_about" rows="3"> <%= user.getAbout() %>
                          </textarea>
                          
                      </td>
     
                  </tr>
                  <tr>
                      <td> Profile Pic : </td>
                      <td> 
                          <input type="file" name="user_pic"  class="form-control">
                          
                      </td>
     
                  </tr>
                  <tr>
                      <td> Gender: </td>
                      <td> <%= user.getGender().toUpperCase() %> </td>
     
                  </tr>
                  
              </table>
           
                
                      <div class="container">
                          
                          <button type="submit" class="btn btn-outline-success"">Done</button>
                          
                      </div>
          </form>
          
          
      </div>
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="edit-profile-btn"  >Edit</button>
      </div>
    </div>
  </div>
</div>
       
        
       <!--end of profile modal-->
       
       
       
       
       
       
       
   
       
        <!--javascript-->
        
        
         <script src="Js/likejs.js" type="text/javascript"></script>
        <script src="Js/index.js" type="text/javascript"></script>
        
        
        
                
        <script src="https://kit.fontawesome.com/7c992a4c91.js" crossorigin="anonymous"></script>
       <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
   <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <!--sweetalert javascript cdn-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.10.5/sweetalert2.all.min.js"></script>
    
       
    <!--masonary.js scroling post cdn-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/masonry/4.2.2/masonry.pkgd.min.js"></script>

    
  
        
        <script>
            
            
            $(document).ready(function()
            {
                
                let editStatus=false;
                
              $('#edit-profile-btn').click(function(){
                  
                 if(editStatus === false)
                 {
            $('#profile-details').hide();

                 $('#profile-edit').show();
                 
                 editStatus=true;
       
       $(this).text("back");
       
                 }else
                 {
                       $('#profile-details').show();

                 $('#profile-edit').hide();
         editStatus=false;  
         
         $(this).text("Edit");
        }
           
                 
                  
              });
            });
                
            
            
            
            
        </script>

        
        
        <!--now add post js-->
        
        <script>
            
            $(document).ready(function(e){
                
            $("#add-post-form").on("submit",function(event){
                
                // this code will gets called when form will submitted......
                
                event.preventDefault();
//                console.log("submitted");
                
                let form = new FormData(this);
                
                //now requesting to server
                
                $.ajax({
                    
                    url: "AddPostServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        // success
                       
                       
                       console.log(data);
                       
                       if (data.trim() === 'done') {
                    Swal.fire({
                        title: "Good job!",
                        text: "Successfully, Added post. ",
                        icon: "success"
                    }).then((value) => {
                        window.location = "profile.jsp";
                    });
                } else {
                    Swal.fire({
                        title: "Error!",
                        text: data,
                        icon: "error"
                    });
                }
                    },
                    processData: false,
                    contentType: false
                    
                });
                
                
              
                
            });
            
                
            });
            
            
            </script>
        
        
        
        
        
        <!--Below script is for the posts page and blog posts-->
        <!--loading post usign ajax-->
        <script>
            
            
            function getPosts(catId,temp)
            {
                $('#loader').show();
                $('#post-conatiner').hide();
                
                
                $(".c-link").removeClass('active');
                
                 $.ajax({
                    
                    url: "load_post.jsp",
                    data:{cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        
                        $('#loader').hide();
                       
                        
                        $('#loader').hide();
                    $('#post-conatiner').show();
                     $('#post-container').html(data);
                     $(temp).addClass('active');
                    }

                });
                
            }
            
            
            $(document).ready(function(e)
            {
                let allPostRef=$('.c-link')[0];
               getPosts(0,allPostRef); 
            });
            
            
            
            
        </script>

        
        
        <!-- Place the first <script> tag in your HTML's <head> -->
<script src="https://cdn.tiny.cloud/1/ujgh3kd92eb1dcjlmfuzwkc2tkjcmoes2ssh7oft5xo57c45/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>

<!-- Place the following <script> and <textarea> tags your HTML's <body> -->
<script>
  tinymce.init({
    selector: 'textarea',
    plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount checklist mediaembed casechange export formatpainter pageembed linkchecker a11ychecker tinymcespellchecker permanentpen powerpaste advtable advcode editimage advtemplate ai mentions tinycomments tableofcontents footnotes mergetags autocorrect typography inlinecss markdown',
    toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
    tinycomments_mode: 'embedded',
    tinycomments_author: 'Author name',
    mergetags_list: [
      { value: 'First.Name', title: 'First Name' },
      { value: 'Email', title: 'Email' },
    ],
    ai_request: (request, respondWith) => respondWith.string(() => Promise.reject("See docs to implement AI Assistant")),
  });
</script>

        
        
        
        
        
      
     <!--masonary.js--> 
     <script>
   // Wait for the document to be ready
   document.addEventListener('DOMContentLoaded', function() {
      // Select the Masonry container
      var masonryContainer = document.getElementById('post-container');

      // Initialize Masonry
      var masonry = new Masonry(masonryContainer, {
         itemSelector: '.col-md-6', // Adjust this selector based on your card structure
         columnWidth: '.col-md-6',
         gutter: 20, // Adjust the gutter space between cards
      });
   });
</script>

        
   
                
        
    </body>
</html>
