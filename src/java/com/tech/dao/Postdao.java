
package com.tech.dao;
import com.tech.entities.Category;
import com.tech.entities.Posts;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Postdao {
   
    
    Connection con;

    public Postdao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories()
    {
        
     ArrayList<Category> list = new ArrayList<>();
        
        try
        {
            
            String q = "select * from categories";
            
          Statement st = this.con.createStatement();
            
          ResultSet set = st.executeQuery(q);
          
          while(set.next())
          {
              
              int cid= set.getInt("CId");
              String name = set.getString("name");
              String description = set.getString("description");
              
              Category c = new Category(cid,name,description);
              
              list.add(c);
              
          }
          
          
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        

        return list;
    }
    
    
    public boolean savePost(Posts p)
    {
        boolean f= false;
        
        try
        {
            
            String q = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            
          PreparedStatement pstm = con.prepareStatement(q);
          
            pstm.setString(1,p.getpTitle());
            pstm.setString(2,p.getpContent());
            pstm.setString(3,p.getpCode());
            pstm.setString(4,p.getpPic());
           pstm.setInt(5,p.getCatId());
           pstm.setInt(6, p.getUserId());
           
           pstm.executeUpdate();
           
            f=true;
        }catch(Exception e)
        {
            e.printStackTrace();
                  
        }
        return f;
    }

  
    // fetch the all the post
    
     public List<Posts> getAllPost()
     {
         
         List<Posts> list = new ArrayList<>();
         
           // fetch the all the post
    
           try
           {
               
               PreparedStatement pstm = con.prepareStatement("select * from posts order by pid desc");
               
               
               ResultSet set = pstm.executeQuery();
               
               while(set.next())
               {
                   int  pId = set.getInt("pid");
                   String pTitle = set.getString("pTitle");
                   String pContent = set.getString("pContent");
                   String pCode = set.getString("pCode");
                   String pPic = set.getString("pPic");
                   
                   Timestamp date = set.getTimestamp("pDate");
                   
                   int catId = set.getInt("catId");
                   int userId = set.getInt("userId");
                   
                   Posts pPost = new Posts(pId,pTitle,pContent,pCode,pPic,date,catId,userId);
                   
                   
                   list.add(pPost);
                   
                   
               }
               
               
               
               
           }catch(Exception e)
           {
               e.printStackTrace();
           }
                   
         

         return list;
         
     }
    
    
     public List<Posts> getPostByCatId(int catId)
     {
         // fetching the all post by id
         
         List<Posts> list = new ArrayList<>();
         
            
            // fetch the all the post
    
           try
           {
               
               PreparedStatement pstm = con.prepareStatement("select * from posts where catId=?");
               
               pstm.setInt(1, catId);
               ResultSet set = pstm.executeQuery();
               
               while(set.next())
               {
                   int  pId = set.getInt("pid");
                   String pTitle = set.getString("pTitle");
                   String pContent = set.getString("pContent");
                   String pCode = set.getString("pCode");
                   String pPic = set.getString("pPic");
                   
                   Timestamp date = set.getTimestamp("pDate");
                   
                  
                   int userId = set.getInt("userId");
                   
                   Posts pPost = new Posts(pId,pTitle,pContent,pCode,pPic,date,catId,userId);
                   
                   
                   list.add(pPost);
                   
                   
               } 
           }catch(Exception e)
           {
               e.printStackTrace();
           }
         
         
         
         return list;
     }
    
    
     public Posts getPostByPostId(int postId)
     {
         
         Posts post = null;
        try
        {
             String q= "select * from posts where pid=?";
         
         PreparedStatement p = this.con.prepareStatement(q);
         
         p.setInt(1, postId);
         
         ResultSet set = p.executeQuery();
         
         if(set.next())
         {
             
     int  pId = set.getInt("pid");
                   String pTitle = set.getString("pTitle");
                   String pContent = set.getString("pContent");
                   String pCode = set.getString("pCode");
                   String pPic = set.getString("pPic");
                   
                   Timestamp date = set.getTimestamp("pDate");
                   
                   int catId = set.getInt("catId");
                   int userId = set.getInt("userId");
                   
                   post = new Posts(pId,pTitle,pContent,pCode,pPic,date,catId,userId);
    
       
         }
         
        }catch(Exception e)
        {
            e.printStackTrace();
        }
         
         return post;
     }
    
    
    
}
