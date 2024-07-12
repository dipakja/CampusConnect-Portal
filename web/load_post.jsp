<%@ page import="com.tech.entities.Posts" %>
<%@ page import="com.tech.entities.User" %>
<%@ page import="com.tech.dao.Postdao" %>
<%@ page import="com.tech.helper.ConnectionProvider" %>
<%@ page import="java.util.List" %>

<div class="container-fluid">
<%
    User currentUser = (User) session.getAttribute("currentUser");
    try {
        Thread.sleep(1000); // Simulate delay for demonstration
    } catch (InterruptedException e) {
        e.printStackTrace();
    }
    Postdao postDao = new Postdao(ConnectionProvider.getConnection());
    int categoryId = Integer.parseInt(request.getParameter("cid"));
    List<Posts> posts = (categoryId == 0) ? postDao.getAllPost() : postDao.getPostByCatId(categoryId);

    if (posts.isEmpty()) {
        out.println("<h3 class='display-3 text-center'>No Notifications in this category yet!</h3>");
        return;
    }

    // Iterate through posts to display them in pairs
    for (int i = 0; i < posts.size(); i += 2) {
        Posts post1 = posts.get(i);
        Posts post2 = (i + 1 < posts.size()) ? posts.get(i + 1) : null;
%>

<div class="row">
  <%-- First Card --%>
  <div class="col-md-6 mb-4">
    <div class="card border-0">
      <img src="blog_Pics/<%= post1.getpPic() %>" class="card-img-top" style="height: 200px; object-fit: cover;" alt="Post Image">
      <div class="card-body">
        <h5 class="card-title"><strong><%= post1.getpTitle() %></strong></h5>
        <p class="card-text"><%= post1.getpContent().substring(0, 150) %>...</p>
        <a href="show_blog_post.jsp?post_id=<%= post1.getpId() %>" class="btn btn-outline-primary">Read More</a>
      </div>
    </div>
  </div>

  <%-- Second Card (if exists) --%>
  <% if (post2 != null) { %>
  <div class="col-md-6 mb-4">
    <div class="card border-0">
      <img src="blog_Pics/<%= post2.getpPic() %>" class="card-img-top" style="height: 200px; object-fit: cover;" alt="Post Image">
      <div class="card-body">
        <h5 class="card-title"><strong><%= post2.getpTitle() %></strong></h5>
        <p class="card-text"><%= post2.getpContent().substring(0, 150) %>...</p>
        <a href="show_blog_post.jsp?post_id=<%= post2.getpId() %>" class="btn btn-outline-primary">Read More</a>
      </div>
    </div>
  </div>
  <% } %>
</div>

<%
    }
%>
</div>
