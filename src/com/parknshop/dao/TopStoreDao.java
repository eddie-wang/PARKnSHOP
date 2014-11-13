package com.parknshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.parknshop.model.Commodity;
import com.parknshop.model.Store;
import com.parknshop.model.TopStore;

public class TopStoreDao {
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	public TopStoreDao(Connection con)
	{
		this.con=con;
	}
    public List<TopStore> getTopList()
    {
    	 List<TopStore> clist=new ArrayList<TopStore>();
    	 try{
     	  ps= con.prepareStatement("Select * from top10store ");
     	  rs=ps.executeQuery();
     	  while(rs.next())
     	  {
     		 
     		 TopStore commodity=new TopStore(rs.getString("shopname"),rs.getString("shopowner"),rs.getInt("state"));
     	      clist.add(commodity);
     	  }
     	  }
     	  catch(Exception e)
     	  {
     		  e.printStackTrace();
     	  }
     	  return clist;
    	
    }
    public List<Store> getStoreList()
    {
    	List<Store> slist=new ArrayList<Store>();
    	StoreDao sd=new StoreDao(con);
   	 try{
    	  ps= con.prepareStatement("Select * from top10store where state=0");
    	  rs=ps.executeQuery();
    	  while(rs.next())
    	  {
    		 
    		 Store store=sd.getStorebyName(rs.getString("shopname"));
    		 if(store==null||store.getIsBlacklist())
    			 continue;
    		 CommodityDao cd=new CommodityDao(con);
    		 List<Commodity> clist=cd.searchByshop(rs.getString("shopname"));
    		 int i=(int)(Math.random()*(clist.size()-1));
    		 if(i<0)
    		   i=0;
    		 store.setPath(clist.get(i).getPath());
    	     slist.add(store);
    	  }
    	  }
    	  catch(Exception e)
    	  {
    		  e.printStackTrace();
    	  }
    	  return slist;
   	
    	
    }
 
    
    public int getState(String shopname)
    {
    	
       // 2 Ã»ÉêÇë  0top 1 ÉêÇëÃ»Åú
   	 try{
       	  ps= con.prepareStatement("Select * from top10store where shopname=?");
       	  ps.setString(1,shopname); 
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
    
    public boolean delTopProduct(String shopname)
	   {
		   
		   try{
				
				 ps=con.prepareStatement("delete from top10store where shopname=?");
				 ps.setString(1,shopname);
				 ps.executeUpdate();
				 }
				 catch (SQLException e)
				 {
					e.printStackTrace();
					return false;
				 }
		  return true;
	   }
    public boolean changestate(String shopname)
    {
    	try{
		   	 ps= con.prepareStatement("UPDATE top10store SET state=0 WHERE shopname=?"); 		   	 
		   	 ps.setString(1,shopname);
		   	 ps.executeUpdate();
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
		return true;
    	
    }
    public boolean addTopProduct(String shopname,String shopowner)
    {
    	try{
			 ps=con.prepareStatement("Insert into top10store Values(?,?,1)");
			 ps.setString(1,shopname);
			 ps.setString(2,shopowner);
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
