package com.parknshop.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.parknshop.model.Commodity;
import com.parknshop.model.Customer;

public class CustomerDao {
  Connection con=null;
  PreparedStatement ps=null;
  ResultSet rs=null;
  public CustomerDao(Connection con)
  {
	  this.con=con;
  }
  public boolean addCustomer(Customer customer)
  {
	  try{
			
			 ps=con.prepareStatement("Insert into customer Values(?,?,?,?,?,?,?,?)");
			 ps.setString(1,customer.getUserNameC());
			 ps.setString(2,customer.getPassword());
			 ps.setString(3,customer.getPhoneNumber());
			 ps.setString(4,customer.getEmail());
			 ps.setString(5,customer.getSex());
			 ps.setDate(6,customer.getBirthday());
			 ps.setString(7, customer.getAddress());
			 ps.setInt(8,0);
			 ps.executeUpdate();
			 }
			 catch (SQLException e)
			 {
				e.printStackTrace();
				return false;
			 }
	  return true;
  }
  public Customer getCustomer(String userNameC)
  {
	  Customer customer=null;
	  try{
	  ps= con.prepareStatement("Select * from customer where userNameC=?");
	  ps.setString(1, userNameC);
	  rs=ps.executeQuery();
	  if(rs.next())
	  {
		customer=new Customer(rs.getString("userNameC"),rs.getString("password"),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getInt("isBlacklist"),rs.getString("adrress"));
	  }
	  }
	  catch(Exception e)
	  {
		  
	  }
	  return customer;
  }
  public boolean setCustomer(Customer customer)
  {
	 
	  try{
		  ps= con.prepareStatement("UPDATE customer SET password=?,isBlacklist=? WHERE userNameC=? ");
	   	  ps.setString(1,customer.getPassword());
	   	  if(customer.getIsBlacklist()==true)
	   	  { ps.setInt(2,1);
	   	System.out.println("eeee");
	   	  }
	   	  else
	   		{ps.setInt(2,0);
	   	    System.out.println("asdfs");
	   		}
	   	 ps.setString(3, customer.getUserNameC());
	   	 ps.executeUpdate();
	  }
	  catch(Exception e)
	  {   
		  e.printStackTrace();
		  return false;
	  }
	  return true;
  }
  
  public List<Customer> searchByname(String username)
  {
  	 List<Customer> clist=new ArrayList<Customer>();
 	  try{
 	  ps= con.prepareStatement("Select * from customer where userNameC like ?  AND isBlacklist=0 ");
 	  ps.setString(1,"%"+username+"%" );
 	  rs=ps.executeQuery();
 	  while(rs.next())
 	  {
 	
 		  Customer customer=new Customer(rs.getString("userNameC"),rs.getString("password"),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getInt("isBlacklist"),rs.getString("adrress"));
 	      clist.add(customer);
 	  }
 	  }
 	  catch(Exception e)
 	  {
 		  e.printStackTrace();
 	  }
 	  return clist;
  }
  
  public boolean delCustomer(String username)
  {
	  
	  try{
		  ps= con.prepareStatement("delete from customer WHERE userNameC=?");
	   	  ps.setString(1,username);
		  ps.executeUpdate();
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
		  return false;
		  
	  }
	  return true;
	  
  }
  public List<Customer> getBlacklist()
  {
	  List<Customer> clist=new ArrayList<Customer>();
 	  try{
 	  ps= con.prepareStatement("Select * from customer where isBlacklist=1");
 	  rs=ps.executeQuery();
 	  while(rs.next())
 	  {
 	
 		  Customer customer=new Customer(rs.getString("userNameC"),rs.getString("password"),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getInt("isBlacklist"),rs.getString("adrress"));
 	      clist.add(customer);
 	  }
 	  }
 	  catch(Exception e)
 	  {
 		  e.printStackTrace();
 	  }
 	  return clist;
	  
  }
  public Customer getCustomerFromBlacklist(String userNameC)
  {
	  Customer customer=null;
	  try{
	  ps= con.prepareStatement("Select * from customer where userNameC=? and isBlacklist=1");
	  ps.setString(1, userNameC);
	  rs=ps.executeQuery();
	  if(rs.next())
	  {
		customer=new Customer(rs.getString("userNameC"),rs.getString("password"),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getInt("isBlacklist"),rs.getString("adrress"));
	  }
	  }
	  catch(Exception e)
	  {
		  
	  }
	  return customer;
  }
}
