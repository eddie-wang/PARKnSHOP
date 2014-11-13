package com.parknshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.parknshop.model.Order;
import com.parknshop.model.Shopcart;

public class ShopcartDao {
	  Connection con=null;
	  PreparedStatement ps=null;
	  ResultSet rs=null;
	  public ShopcartDao(Connection con)
	  {
		  this.con=con;
	  }
	  
     public boolean addShopcart(Shopcart shopcart)
     {    
    	     System.out.println(shopcart.getProductname()+"asdfasdf");
    	 try{
			 ps=con.prepareStatement("Insert into shopcart Values(?,?,?,?)");
			 ps.setString(1,shopcart.getUsername());
			 ps.setString(2,shopcart.getProductname());
			 ps.setString(3,shopcart.getStorename());
			 ps.setInt(4,shopcart.getCommnum());
			 ps.executeUpdate();
			}
			catch(Exception e)
			{ 
				e.printStackTrace();
				return false;
			}
			return true;
		
     }
     
     public List<Shopcart> getShopcartList(String username)
     {
    	 List<Shopcart> sclist=new ArrayList<Shopcart>();
    	 try{
    	   	  ps= con.prepareStatement("Select * from shopcart where username=? ");
    	   	  ps.setString(1,username);
    	   	  rs=ps.executeQuery();
    	   	  while(rs.next())
    	   	  {
    	   		  System.out.println("asdf");
    	   		  Shopcart sc=new Shopcart(rs.getString("username") ,rs.getString("productname") ,rs.getString("storename"), rs.getInt("commnum"));
    	   	      sclist.add(sc);
    	   	  }
    	   	  }
    	   	  catch(Exception e)
    	   	  {
    	   		  e.printStackTrace();
    	   	  }
    	 return sclist;
     }
     public boolean delShopcart(String username,String productname,String storename)
     {
    	 try{
		    System.out.println(username+productname+storename);
			 ps=con.prepareStatement("delete from shopcart where username=? and productname=? and storename=?");
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
}
