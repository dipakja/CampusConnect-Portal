<%@page  errorPage="ErrorPage.jsp" %>
<%@page  import="com.tech.entities.User" %>
<%@page  import="com.tech.entities.Posts" %>
<%@page  import="com.tech.entities.Message" %>
<%@page  import="com.tech.entities.Category" %>
<%@page  import="com.tech.dao.Postdao" %>
<%@page  import="com.tech.dao.UserDao" %>
<%@page  import="com.tech.dao.LikeDao" %>
<%@page  import="com.tech.helper.ConnectionProvider" %>
<%@ page import="java.util.ArrayList" %>






<%
    
    int postId = Integer.parseInt(request.getParameter("post_id"));
    
    Postdao d = new Postdao(ConnectionProvider.getConnection());
    
   Posts p = d.getPostByPostId(postId);

    %>


<%
                
   

User user =(User) session.getAttribute("currentUser");
if(user==null)
{

response.sendRedirect("login.jsp");
}


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle() %> </title>
       <link  rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./CSS/index.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <!--sweet alert cdn-->
        <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.10.5/sweetalert2.min.css">
        
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
            
            .post-title
            {
                font-weight: 100px;
                font-size: 35px;
            }
            .post-content
            {
                
                font-weight: 100px;
                font-size: 22px;
/*                color:red;*/
            }
            
            .post-code
            {
                
            }
            .post-date{
                
                font-style: italic;
                font-weight: bold;
                
            }
            .post-user-info
            {
                font-size: 20px;
                font-weight: 250px;
            }
            .row-user{
                border:1px solid #ea6c71;
                padding-top: 15px;
                border-radius: 20px;
            }
        </style>
        

        <!--commetn script-->

</head>
    <body>
   <!--Navabar start-->
        
         <div class="custom-horizontal-section">
        <h1>MGM's COLLEGE OF ENGINEERING, NANDED</h1>
    </div>


    <!--Navabar start-->
        
   
        
        <nav
        <!-- Sidebar -->
    <div class="sidebar">
        <a href="index.jsp"> <img src="Images/logo01.png" alt="Logo" height="80"></a>
        <a href="index.jsp"><span class="fa fa-home"></span> Home</a>
        <!--<a href="load_post.jsp"><span class="fa fa-rss"></span> Tech Blogs</a>-->
 
           <!-- Categories -->
<!-- Categories -->
<div class="list-group">
    <a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: #9BD7D1;">
        <span class="fa fa-rss"></span> Categories
    </a>
    <ul class="dropdown-menu">
        <li>
            <a class="dropdown-item c-link list-group-item list-group-item-action"
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
            <a class="dropdown-item c-link list-group-item list-group-item-action"
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
  
        <!--navabar end-->
        
  
        <!--main content of blog page-->
               
         
        <div class="container">
        
            <div class="row my-5">
                
                <div class="col-md-8 offset-md-2" >
                    
                    
                    <div class="card ">
                        
                        <div class="card-header text-center">
                            
                           
                            <h4 class="post-title" > <%= p.getpTitle()%></h4>
                        </div>
                        
                        <div class="card-body">
                            
                            <img class="card-img-top my-2" src="blog_Pics/<%= p.getpPic()%> " alt="Card image cap">
                            
                            <div class="row my-3 row-user">
                                
                                
                                
                                <div class="col-md-8">
                                   
                                    <%
                                    UserDao ud = new UserDao(ConnectionProvider.getConnection()); 
                                    
                                    %>
                                    
                                    
                                    <p class="post-user-info">   <a href="#" ><span class="fa fa-user-circle-o fa-1x mt-2"> </span><%= ud.getUserByUsertId( p.getUserId()).getName()%></a>&nbsp;  has posted: </p>
                                </div>
                                
                                <div class="col-md-4">
                                    
                                    <p class="post-date"><%=p.getpDate().toLocaleString()%> </p>
                                </div>
                                
                            </div>
                            
                            
                            <p class="post-content"><%= p.getpContent() %></p>
                            
                            <br>
                            <br>
                            
                            <div class="post-code">
                            <pre>
                                <%= p.getpCode() %>
                            </pre>
                            
                            </div>
                            
                        </div>
                        
                           
                            
                             <div class="card-footer " style="background-color: #ea6c71;">
                      
                      <!--//url rewritein-->
                      
<% LikeDao ld= new LikeDao(ConnectionProvider.getConnection());   %>
                      
<a href="#" onclick="doLike(<%= p.getpId()%> , <%= user.getId()%>)"  class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up  "></i>&nbsp;<span class="like-counter" ><%=ld.countLikeOnPost(p.getpId()) %></span> </a>
                      &nbsp;
                  
                   <!--comments-->   
                   
             
                  </div>
                           
                      
                      <div class="card-footer">
                 <div class="commentbox"></div>
<script src="https://unpkg.com/commentbox.io/dist/commentBox.min.js"></script>
<script>commentBox('5718286331281408-proj')</script>
                          
      <!--<div class="fb-comments" data-href="http://localhost:8080/TechBlog_JavaProject/show_blog_post.jsp?post_id=<%=p.getpId()%>" data-width="" data-numposts="20"></div>-->
                      </div>  
                      
                      
                       
                            
                    </div>
                    
                </div>
                
            </div>
        
        
        </div>
     <!--main content of blog page-->   
        
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
    <div class="form-group">
        <textarea id="postCode" name="pCode" class="form-control" placeholder="Enter your code if any.." style="height: 200px;"></textarea>
    </div>
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
      <div class="modal-header" style="background-color:#ee6e73;">
        
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
                
        <script src="https://kit.fontawesome.com/7c992a4c91.js" crossorigin="anonymous"></script>
       <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
   <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <!--sweetalert javascript cdn-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.10.5/sweetalert2.all.min.js"></script>
    
        <script src="Js/index.js" type="text/javascript"></script>
        <script src="Js/likejs.js" type="text/javascript"></script>
        
        
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
        
        
        
        
    </body>
</html>
