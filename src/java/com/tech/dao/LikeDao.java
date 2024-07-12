

package com.tech.dao;
import java.sql.*;


public class LikeDao {
    
    Connection con;
    public LikeDao(Connection con)
    {
        this.con =con;
    }
    
    
    public boolean insertLike(int pid, int uid)
    {
        boolean f =false;
       try
       {
           
           String q ="insert into likeBox(pid,uid) values(?,?)";
           
           PreparedStatement pstm = this.con.prepareStatement(q);
           
           pstm.setInt(1,pid);
           pstm.setInt(2,uid);
           
           pstm.executeUpdate();
           
           
           f=true;
           
       }catch(Exception e)
       {
           e.printStackTrace();
       }
        
       return f;
    }
    
    public int countLikeOnPost(int pid)
    {
        int count=0;
        
        try
        {
            String q = "select count(*) from likeBox where pid=?";
            PreparedStatement p=this.con.prepareStatement(q);
            
            p.setInt(1, pid);
            
            ResultSet set = p.executeQuery();
            
            if(set.next())
            {
                count=set.getInt("count(*)");
            }
            
            
            
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        
        return count;
    }
    
    
    public boolean isLikedByUser(int pid,int uid)
    {
        boolean f=false;
        
        try
        {
            
          PreparedStatement p = this.con.prepareStatement("select * from likeBox where pid=? and uid=?") ;
            
            
            p.setInt(1,pid);
            p.setInt(2,uid);
            
          ResultSet set =   p.executeQuery();
            
            if(set.next())
            {
                 f=true; 
            }
          
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public boolean deleteLike(int pid, int uid)
    {
        boolean f=false;
        
        
        try{
            
            PreparedStatement p = this.con.prepareStatement("delete form likeBox where pid=? and uid=?");
            p.setInt(1,pid);
            p.setInt(2,uid);
            
            p.executeUpdate();
            
            f=true;
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }

        return f;
    }
    
}
