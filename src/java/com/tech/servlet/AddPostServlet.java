/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.servlet;

import com.tech.dao.Postdao;
import com.tech.entities.Posts;
import com.tech.entities.User;
import com.tech.helper.ConnectionProvider;
import com.tech.helper.Helper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;


@MultipartConfig

public class AddPostServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    try (PrintWriter out = response.getWriter()) {
             
      
            int cid = Integer.parseInt(request.getParameter("cid").trim());

         
            String pTitle = request.getParameter("pTitle");
         
            String pContent  = request.getParameter("pContent");
            
            String pCode = request.getParameter("pCode");
            
            
//            getting currentUser id

   HttpSession session = request.getSession();
     User user = (User) session.getAttribute("currentUser");
            
        
            
            Part part = request.getPart("pic");
            
            String picName = part.getSubmittedFileName();

Posts p = new Posts(pTitle,pContent,pCode,picName,null,cid,user.getId());
           
            Postdao dao = new Postdao(ConnectionProvider.getConnection());
        
          
    
              // we have to change the datatype to int
            
             
       
            /* TODO output your page here. You may use following sample code. */
             if(dao.savePost(p))
            {
                
                
                String path = request.getServletContext().getRealPath("/") + "blog_Pics" + File.separator + part.getSubmittedFileName();
                
                Helper.saveFile(part.getInputStream(), path);
                
                out.println("done");
                
                
            }else
            {
                out.println("error");
            }

          
    }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
