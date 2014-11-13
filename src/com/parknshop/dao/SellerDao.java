package com.parknshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.parknshop.model.Customer;
import com.parknshop.model.Seller;
import com.parknshop.model.Store;

public class SellerDao {
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	public SellerDao(Connection con)
	{
		this.con=con;
	}
	public boolean addSeller(Seller seller)
	{
		try{
			 ps=con.prepareStatement("Insert into seller Values(?,?,?,?,?)");
			 ps.setString(1,seller.getUserNameC());
			 ps.setString(2,seller.getRealName());
			 ps.setString(3,seller.getRealId());
			 ps.setString(4,seller.getEmail());
			 ps.setString(5,seller.getTelephone());
			 ps.executeUpdate();
			}
			catch(Exception e)
			{
				return false;
			}
			return true;
	}
	public Seller getSeller(String username)
	{
		CustomerDao cd=new CustomerDao(con);
		Customer customer=cd.getCustomer(username);
		Seller seller=null;
		try{
			 ps=con.prepareStatement("select * from seller where userNameS=?");
			 ps.setString(1,username);
			 rs=ps.executeQuery();	
			 if(rs.next())
			 {
				seller=new Seller(customer,rs.getString("realname"),rs.getString("realid"),rs.getString("email"),rs.getString("telephone"));
				 
			 }
			}
			catch(Exception e)
			{
			  e.printStackTrace();
			}
		return seller;	
		
	}
	public Seller getSellerByshop(String shopname)
	{
		StoreDao sd=new StoreDao(con);
		Store store =sd.getStorebyName(shopname);
		String username=store.getUsername();
		System.out.println(username+"ada");
		return  getSeller(username);
		
	}
   public boolean delSeller(String username)
   {
	   
	   try{
			
			 ps=con.prepareStatement("delete from seller where userNameS=?");
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
   
   public boolean setSeller(Seller seller)
   {
   	
   			try{
   			   	 ps= con.prepareStatement("UPDATE seller SET email=? ,telephone=? WHERE userNameS=?");
   			   	 ps.setString(1, seller.getEmail());
   			   	 ps.setString(2, seller.getTelephone());
   			     ps.setString(3,seller.getUserNameC());
   			   	 ps.executeUpdate();
   			
   			}
   			catch(Exception e)
   			{
   				return false;
   			}
   			return true;
   }
}
