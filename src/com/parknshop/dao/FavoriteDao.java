package com.parknshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.parknshop.model.Commodity;

public class FavoriteDao {
	 private Connection con=null;
	 private PreparedStatement ps=null;
	 private ResultSet rs=null;
	 public FavoriteDao(Connection con){
		 this.con=con;
	 } 
     public boolean addFavorite(String username,String productname,String storename)
     {
    	 try{
				
			 ps=con.prepareStatement("Insert into favorite Values(?,?,?)");
			 ps.setString(1,username);
			 ps.setString(2,productname);
			 ps.setString(3,storename);
			 ps.executeUpdate();
			 }
			 catch (SQLException e)
			 {
				e.printStackTrace();
				return false;
			 }
	  return true;
     }
     public boolean delFavorite(String username,String productname,String storename)
     {
    	 try{
		    System.out.println(username+productname+storename);
			 ps=con.prepareStatement("delete from favorite where username=? and productname=? and storename=?");
			 ps.setString(1,username);
			 ps.setString(2,productname);
			 ps.setString(3,storename);
			 ps.executeUpdate();
			
			 }
			 catch (SQLException e)
			 {
				e.printStackTrace();
				return false;
			 }
	  return true;
     }
     public List<Commodity> getFavoriteList(String username)
     {
    	 List<Commodity> favoritelist=new ArrayList<Commodity>();
    	 try{
    	   	  ps= con.prepareStatement("Select * from favorite where username=? ");
    	   	  ps.setString(1, username);
    	   	  rs=ps.executeQuery();
    	   	  while(rs.next())
    	   	  {
    	   		
    	   		Commodity commodity=new CommodityDao(con).getCommodity(rs.getString("productname"),rs.getString("storename") );
               System.out.println(commodity.getProductname()+"asdfasd");         
    	   		favoritelist.add(commodity);
    	   	  }
    	   	  }
    	   	  catch(Exception e)
    	   	  {
    	   		  e.printStackTrace();
    	   	  }
    	   	
    	 return favoritelist;
     }
}
