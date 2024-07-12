
package com.tech.helper;

import java.sql.*;


public class ConnectionProvider {
 
    
    // taking object of Connection class
    private static Connection con;
    
    public static Connection getConnection()
    {
        try{
            
            if(con==null)
            {
                //give firstly driver name
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            //create connection , it will take three attributes
            String url="jdbc:mysql://localhost:3306/Social";
            String username="root";
            String password="root";
            
            con= DriverManager.getConnection(url,username,password);
            
            }
             
            
           
        }catch(Exception e)
        {
         e.printStackTrace();
        }
        
        
        
        
        
        return con;
    }
    
}
