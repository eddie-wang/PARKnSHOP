package com.parknshop.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.parknshop.model.Commodity;

public class CommodityDao {
	 private Connection con=null;
	 private PreparedStatement ps=null;
	 private ResultSet rs=null;
	 public CommodityDao(Connection con){
		 this.con=con;
	 } 
	 public boolean addCommodity(Commodity commodity)
	 {
		 try{
				
			 ps=con.prepareStatement("Insert into commodity Values(?,?,?,?,?,0,?,?)");
			 ps.setString(1,commodity.getProductname());
			 ps.setString(2,commodity.getShopname());
			 ps.setDouble(3,commodity.getPrice());
			 ps.setString(4,commodity.getType());
			 ps.setString(5,commodity.getDetails());
			 ps.setInt(6,commodity.getStock());
			 ps.setString(7,commodity.getPath());
			 ps.executeUpdate();
			 }
			 catch (SQLException e)
			 {
				e.printStackTrace();
				return false;
			 }
	  return true;
	 }
	public Commodity getCommodity(String productname,String shopname)
	{
		  Commodity commodity=null;
		  try{
			
		  ps= con.prepareStatement("Select * from commodity where productname=? and shopname=?");
		  ps.setString(1, productname);
		  ps.setString(2,shopname);
		  rs=ps.executeQuery(); 
		  if(rs.next())
		  {
			
			commodity=new Commodity(productname,shopname,rs.getDouble("price"),rs.getString("type"),rs.getString("details"),rs.getInt("salevolume"),rs.getInt("stock"),rs.getString("picture"));
		  }
		  }
		  catch(Exception e)
		  {  
			  e.printStackTrace();			 
		  }
		  return commodity; 
	}
    public ArrayList<Commodity> getClist(String shopname)
    {
    	 ArrayList<Commodity> clist=new ArrayList<Commodity>();
   	  try{
   	  ps= con.prepareStatement("Select * from commodity where shopname=? ");
   	  ps.setString(1, shopname);
   	  rs=ps.executeQuery();
   	  while(rs.next())
   	  {
   		
   		  Commodity commodity=new Commodity(rs.getString("productname"),rs.getString("shopname"),rs.getDouble("price"),rs.getString("type"),rs.getString("details"),rs.getInt("salevolume"),rs.getInt("stock"),rs.getString("picture"));
   	      clist.add(commodity);
   	  }
   	  }
   	  catch(Exception e)
   	  {
   		  e.printStackTrace();
   	  }
   	  return clist;
    }
    public boolean setCommodity(Commodity commodity)
    {
    	
    			try{
    			   	 ps= con.prepareStatement("UPDATE commodity SET price=?,details =? , salevolume=? ,stock=? WHERE productname = ? and shopname=?");
    			   	 ps.setDouble(1, commodity.getPrice());
    			   	 ps.setString(2, commodity.getDetails());
    			   	 ps.setInt(3, commodity.getSalevolume());
    			   	 ps.setInt(4, commodity.getStock());
    			   	 ps.setString(5, commodity.getProductname());
    			   	 ps.setString(6, commodity.getShopname());
    			   	 ps.executeUpdate();
    			
    			}
    			catch(Exception e)
    			{
    				return false;
    			}
    			return true;
    }
    
    public List<Commodity> searchByname(String name)
    {
    	 List<Commodity> clist=new ArrayList<Commodity>();
   	  try{
   	  ps= con.prepareStatement("Select * from commodity where productname like ? ");
   	  ps.setString(1,"%"+name+"%" );
   	  rs=ps.executeQuery();
   	  while(rs.next())
   	  {
   		 System.out.println("asd"); 
   		  Commodity commodity=new Commodity(rs.getString("productname"),rs.getString("shopname"),rs.getDouble("price"),rs.getString("type"),rs.getString("details"),rs.getInt("salevolume"),rs.getInt("stock"),rs.getString("picture"));
   	      clist.add(commodity);
   	  }
   	  }
   	  catch(Exception e)
   	  {
   		  e.printStackTrace();
   	  }
   	  return clist;
    }
    
    public List<Commodity> searchBytype(String type)
    {
    	 List<Commodity> clist=new ArrayList<Commodity>();
   	  try{
   	  ps= con.prepareStatement("Select * from commodity where type like ? ");
   	  ps.setString(1,"%"+type+"%" );
   	  rs=ps.executeQuery();
   	  while(rs.next())
   	  {
   		
   		  Commodity commodity=new Commodity(rs.getString("productname"),rs.getString("shopname"),rs.getDouble("price"),rs.getString("type"),rs.getString("details"),rs.getInt("salevolume"),rs.getInt("stock"),rs.getString("picture"));
   	      clist.add(commodity);
   	  }
   	  }
   	  catch(Exception e)
   	  {
   		  e.printStackTrace();
   	  }
   	  return clist;
    }
    public List<Commodity> searchByshop(String name)
    {
    	 List<Commodity> clist=new ArrayList<Commodity>();
   	  try{
   	  ps= con.prepareStatement("Select * from commodity where shopname like ? ");
   	  ps.setString(1,"%"+name+"%" );
   	  rs=ps.executeQuery();
   	  while(rs.next())
   	  {
   		 System.out.println("asd"); 
   		  Commodity commodity=new Commodity(rs.getString("productname"),rs.getString("shopname"),rs.getDouble("price"),rs.getString("type"),rs.getString("details"),rs.getInt("salevolume"),rs.getInt("stock"),rs.getString("picture"));
   	      clist.add(commodity);
   	  }
   	  }
   	  catch(Exception e)
   	  {
   		  e.printStackTrace();
   	  }
   	  return clist;
    }
    public boolean delCommodity(String productname,String shopname)
    {
    	 try{
				
			 ps=con.prepareStatement("delete from commodity where productname=? and shopname=?");			
			 ps.setString(1,productname);
			 ps.setString(2,shopname);
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
