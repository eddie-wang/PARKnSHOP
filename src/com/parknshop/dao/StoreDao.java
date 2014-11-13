package com.parknshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.parknshop.model.Commodity;
import com.parknshop.model.Customer;
import com.parknshop.model.Seller;
import com.parknshop.model.Store;

public class StoreDao {
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	public StoreDao(Connection con)
	{
		this.con=con;
	}
	public boolean addStore(Store store)
	{
		try{
			 ps=con.prepareStatement("Insert into store Values(?,?,?,0)");
			 ps.setString(1,store.getShopname());
			 ps.setString(2,store.getUsername());
			 ps.setString(3,store.getType());
			 ps.executeUpdate();
			}
			catch(Exception e)
			{
				return false;
			}
			return true;
		
	}
	public Store getStore(String usernameS)
	{
		
		Store store=null;
		try{
			 ps=con.prepareStatement("select * from store where userNameS=? and isBlacklist=0");
			 ps.setString(1,usernameS);
			 rs=ps.executeQuery();	
			 if(rs.next())
			 {
				store=new Store(rs.getString("shopName"),rs.getString("userNameS"),rs.getString("type"));
				 
			 }
			}
			catch(Exception e)
			{
			  e.printStackTrace();
			}
		return store;	
		
	}
	
	public Store getStorebyName(String shopowner)
	{
		
		Store store=null;
		try{
			 ps=con.prepareStatement("select * from store where shopName=? and isBlacklist=0");
			 ps.setString(1,shopowner);
			 rs=ps.executeQuery();	
			 if(rs.next())
			 {
				store=new Store(rs.getString("shopName"),rs.getString("usernameS"),rs.getString("type"));
				 
			 }
			}
			catch(Exception e)
			{
			  e.printStackTrace();
			}
		return store;	
		
	}
	   public List<Store> searchByName(String name)
	    {
	    	 List<Store> clist=new ArrayList<Store>();
	   	  try{
	   		 
	   	  ps= con.prepareStatement("Select * from store where shopName like ? and isBlacklist=0 ");
	   	  ps.setString(1,"%"+name+"%" );
	   	  rs=ps.executeQuery();
	   	System.out.println("%"+name+"%"); 
	   	  while(rs.next())
	   	  {
	   		System.out.println("%"+name+"%"); 
	   		  Store store=new Store(rs.getString("shopName"),rs.getString("userNameS"),rs.getString("type"));
	   	      clist.add(store);
	   	  }
	   	  }
	   	  catch(Exception e)
	   	  {
	   		  e.printStackTrace();
	   	  }
	   	  return clist;
	    }
	   public boolean setStore(Store store)
	    {
	    	
	    			try{
	    			   	 ps= con.prepareStatement("UPDATE store SET type=?,isBlacklist=? WHERE shopname=?");
	    			   	 ps.setString(1, store.getType());
	    			   	 if(store.getIsBlacklist())
	    			   		ps.setInt(2,1); 
	    			   	 else
	    			   		ps.setInt(2,0); 
	    			   	 ps.setString(3, store.getShopname());
	    			   	 ps.executeUpdate();
	    			
	    			}
	    			catch(Exception e)
	    			{
	    				e.printStackTrace();
	    				return false;
	    			}
	    			return true;
	    }
	   public Store getStoreFromBlacklist(String usernameS)
		{
			
			Store store=null;
			try{
				 ps=con.prepareStatement("select * from store where shopName=? and isBlacklist=1");
				 ps.setString(1,usernameS);
				 rs=ps.executeQuery();	
				 if(rs.next())
				 {
					store=new Store(rs.getString("shopName"),rs.getString("userNameS"),rs.getString("type"));
					 
				 }
				}
				catch(Exception e)
				{
				  e.printStackTrace();
				}
			return store;	
			
		}
	   
	   public List<Store> getBlacklist()
	   {
	 	  List<Store> clist=new ArrayList<Store>();
	  	  try{
	  	  ps= con.prepareStatement("Select * from store where isBlacklist=1");
	  	  rs=ps.executeQuery();
	  	  while(rs.next())
	  	  {
	  		 Store store=new Store(rs.getString("shopName"),rs.getString("userNameS"),rs.getString("type"));
	  	      clist.add(store);
	  	  }
	  	  }
	  	  catch(Exception e)
	  	  {
	  		  e.printStackTrace();
	  	  }
	  	  return clist;
	 	  
	   }
	   
	   public boolean delStore(String username)
	    {
	    	 try{
				System.out.println(username+"seller");	
				 ps=con.prepareStatement("delete from store  where userNameS=?");			
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
