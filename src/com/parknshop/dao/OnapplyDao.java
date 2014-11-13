package com.parknshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.parknshop.model.Onapply;

public class OnapplyDao {
	 private Connection con=null;
	 private PreparedStatement ps=null;
	 private ResultSet rs=null;
	 public OnapplyDao(Connection con)
	 {
		  this.con=con;
	 }
	 public List<Onapply> getAllOnapply()
	 {
		 ArrayList<Onapply> applylist=new ArrayList<Onapply>();
		 Onapply onapply=null;
		 try{
			  ps= con.prepareStatement("Select * from onapply ");
			  rs=ps.executeQuery();
			  if(rs.next())
			  {
				onapply=new Onapply(rs.getString("userNameC"),rs.getString("userNameS"),rs.getString("realId"),rs.getString("shopName"),rs.getString("shoptype"),rs.getString("email"),rs.getString("telephone"));
			    applylist.add(onapply);
			    System.out.println(onapply.getUserNameS()+onapply.getShopType());
			  }
			  }
			  catch(Exception e)
			  {
		          e.printStackTrace();  
				  System.out.println("get applying list fail!");		  
			  }
		 return applylist;
	 }
	
	  public boolean addOnapply(Onapply apply)
	  {
		  try{
				
				 ps=con.prepareStatement("Insert into onapply Values(?,?,?,?,?,?,?)");
				 ps.setString(1, apply.getUserNameC());
				 ps.setString(2,apply.getUserNameS());
				 ps.setString(3,apply.getRealId());
				 ps.setString(4,apply.getShopName());
				 ps.setString(5,apply.getShopType());
				 ps.setString(6,apply.getEmail());
				 ps.setString(7,apply.getTelephone());
				 ps.executeUpdate();
				 }
				 catch (SQLException e)
				 {
					e.printStackTrace();
					return false;
				 }
		  return true;
		  
	  }
	  public boolean delOnapply(String username)
	  {
		  try{
				
				 ps=con.prepareStatement("delete from onapply where userNameC=?");
				 ps.setString(1,username);
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
