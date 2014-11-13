package com.parknshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.parknshop.model.Commodity;
import com.parknshop.model.TopProduct;

public class TopProductDao {
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	public TopProductDao(Connection con)
	{
		this.con=con;
	}
    public List<TopProduct> getTopList()
    {
    	 List<TopProduct> clist=new ArrayList<TopProduct>();
    	 try{
     	  ps= con.prepareStatement("Select * from top10product ");
     	  rs=ps.executeQuery();
     	  while(rs.next())
     	  {
     		 
     		   TopProduct commodity=new TopProduct(rs.getString("productname"),rs.getString("shopname"),rs.getInt("state"));
     	      clist.add(commodity);
     	  }
     	  }
     	  catch(Exception e)
     	  {
     		  e.printStackTrace();
     	  }
     	  return clist;
    	
    }
    public List<Commodity> getProductList()
    {
    	 List<Commodity> clist=new ArrayList<Commodity>();
    	 CommodityDao cd=new CommodityDao(con);
    	 try{
     	  ps= con.prepareStatement("Select * from top10product where state=0");
     	  rs=ps.executeQuery();
     	  while(rs.next())
     	  {
     		 
     		   Commodity commodity=cd.getCommodity(rs.getString("productname"), rs.getString("shopname"));
     	       clist.add(commodity);
     	  }
     	  }
     	  catch(Exception e)
     	  {
     		  e.printStackTrace();
     	  }
     	  return clist;
    	
    }
    public boolean IsInTopList(String name)
    {
    	 try{
        	  ps= con.prepareStatement("Select * from top10product where productname=?");
        	  ps.setString(1, name);
        	  rs=ps.executeQuery();
        	  if(rs.next())
        	  {
        		 return true;
        	  }
        	  else
        		  return false;
        	  }
        	  catch(Exception e)
        	  {
        		  e.printStackTrace();
        		  return false;
        	  }	
    	
    }
    
    public int getState(String productname , String shopname)
    {
    	
       // 2 √ª…Í«Î  0top 1 …Í«Î√ª≈˙
    	System.out.println(productname+shopname);
   	 try{
       	  ps= con.prepareStatement("Select * from top10product where productname=? and shopname=?");
       	  ps.setString(1, productname);
       	  ps.setString(2,shopname); 
       	  rs=ps.executeQuery();
       	  if(rs.next())
       	  {
       		 return rs.getInt("state");
       	  }
       	  else
       		  return 2;
       	  }
       	  catch(Exception e)
       	  {
       		  e.printStackTrace();
       		  return 2;
       	  }	
   	
    }
    
    public boolean delTopProduct(String productname,String shopname)
	   {
		   
		   try{
				
				 ps=con.prepareStatement("delete from top10product where productname=? and shopname=?");
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
    public boolean changestate(String productname, String shopname)
    {
    	try{
		   	 ps= con.prepareStatement("UPDATE top10product SET state=0 WHERE productname=? and shopname=?"); 
		   	 ps.setString(1,productname);		   	 
		   	 ps.setString(2, shopname);
		   	 ps.executeUpdate();
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
		return true;
    	
    }
    public boolean addTopProduct(String productname,String shopname)
    {
    	try{
			 ps=con.prepareStatement("Insert into top10product Values(?,?,1)");
			 ps.setString(1,productname);
			 ps.setString(2,shopname);
			 ps.executeUpdate();
			}
			catch(Exception e)
			{
				e.printStackTrace(); 
				return false;
			}
			return true;
    	
    }
}
