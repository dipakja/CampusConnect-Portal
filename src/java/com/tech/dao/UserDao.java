/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.dao;
import com.tech.entities.User;
import java.sql.*;






public class UserDao {
    
    private  Connection con;
    
    
    
    public UserDao(Connection con){
        
   this.con=con;
        
    }
    
    public boolean saveUser(User user)
    { 
        boolean f=false;
        
        try{
            
            //user-->database
            
            
            String query = "insert into users(Name,Email,Password,Gender,About) values(?,?,?,?,?)";
            
         PreparedStatement  pstmt= this.con.prepareStatement(query);
            
            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getEmail());
            pstmt.setString(3,user.getPassword());
            pstmt.setString(4,user.getGender());
            pstmt.setString(5,user.getAbout());
            
            pstmt.executeUpdate();
            f=true;
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        return f;
    }
    
    
    public User getUserByEmailPassword(String Email, String Password)
    {
        
        User user = null;
        try{
            
            String query = "select * from users where Email =? and Password=?";
          
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, Email);
            pstmt.setString(2, Password);
            
            ResultSet set =   pstmt.executeQuery();
            
               if(set.next()) // for the one user at a time
               {
                   user = new User();  
                   
                   // data fromt the db
                   
                   String name=set.getString("Name");
                   // set to user object
                   
                   user.setName(name);
                   
                   
                   user.setId(set.getInt("id"));
                   user.setEmail(set.getString("Email"));
                   
                   user.setPassword(set.getString("Password"));
                   user.setGender(set.getString("Gender"));
                   
                   user.setAbout(set.getString("About"));
                   
                   
//             user.setDateTime(new java.security.Timestamp(set.getTimestamp("regdate").getTime()));




                   
//                   user.setDateTime(set.getTimestamp("regDate"));
//               user.setDateTime(set.getTimestamp("regDate"));


               user.setProfile(set.getString("profile"));



               }else
               {
                   
               }
            
        }catch(Exception e)
                {
                    e.printStackTrace();
                }
        
        
        
        
        return user;
        
    }
    
    
 public boolean updateUser (User user)
 {
     boolean f=false;
     
     try{
         
         String query ="update Users set Name=?, Email=? , Password=?, Gender=?, About=?, profile=?  where id=? ";
     
     PreparedStatement p = con.prepareStatement(query);
     
     p.setString(1, user.getName());
     p.setString(2, user.getEmail());
     p.setString(3, user.getPassword());
     p.setString(4, user.getGender());
     p.setString(5, user.getAbout());
     p.setString(6, user.getProfile());
     
     
     p.setInt(7, user.getId());
     
      int rowsAffected = p.executeUpdate();

        // Check if the update was successful
        if (rowsAffected > 0) {
            f = true;
        }
     
  
     
     }catch(Exception e)
     {
         
         e.printStackTrace();
     }
     
     return f;
 }
    
 
 
 
 
public User getUserByUsertId(int postId) {
    User user = null;
    
    try {
        String q = "SELECT * FROM users WHERE Id=?";
        PreparedStatement p = con.prepareStatement(q);
        p.setInt(1, postId);
        ResultSet set = p.executeQuery();
        
        if (set.next()) {
            user = new User();
            
            // Populate user object with data from the database
            user.setId(set.getInt("id"));
            user.setName(set.getString("Name"));
            user.setEmail(set.getString("Email"));
            user.setPassword(set.getString("Password"));
            user.setGender(set.getString("Gender"));
            user.setAbout(set.getString("About"));
            user.setProfile(set.getString("profile"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    return user;
}

 
 
 
}
