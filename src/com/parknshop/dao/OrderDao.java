package com.parknshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import com.parknshop.model.Commodity;
import com.parknshop.model.Order;

public class OrderDao {
	  Connection con=null;
	  PreparedStatement ps=null;
	  ResultSet rs=null;
	  public OrderDao(Connection con)
	  {
		  this.con=con;
	  }
	  
     public boolean addOrder(Order order)
     {
    	 try{
			 ps=con.prepareStatement("Insert into `order` Values(null,?,?,?,?,?,curdate(),?)");
			 ps.setString(1,order.getUsername());
			 ps.setString(2,order.getProductname());
			 ps.setString(3,order.getStorename());
			 ps.setInt(4,order.getCommnum());
			 ps.setDouble(5,order.getPrice());
			 ps.setString(6,order.getState());
			 ps.executeUpdate();
			}
			catch(Exception e)
			{ 
				e.printStackTrace();
				return false;
			}
			return true;
		
     }
     
     public List<Order> getOrderbyshop(String shopname)
     {
    	 LinkedList<Order> olist=new LinkedList<Order>();
    	 try{
    	   	  ps= con.prepareStatement("Select * from `order` where storename=? ");
    	   	  ps.setString(1,shopname);
    	   	  rs=ps.executeQuery();
    	   	  while(rs.next())
    	   	  {
    	   		 java.sql.Date t=rs.getDate("date");
   	   	      Date w=new Date(t.getTime());
    	   		  Order order=new Order(rs.getInt("idorder"),rs.getString("username") ,rs.getString("productname") ,rs.getString("storename"), rs.getInt("commnum"),rs.getDouble("price"),rs.getString("state"),w);
    	   	      olist.addFirst(order);
    	   	  }
    	   	  }
    	   	  catch(Exception e)
    	   	  {
    	   		  e.printStackTrace();
    	   	  }
    	 return olist;
     }
     public Order getOrder(int idorder)
     {
    			Order order=null;
    			try{
    				 ps=con.prepareStatement("select * from `order` where idorder=?");
    				 
    				 ps.setInt(1,idorder);
    				 rs=ps.executeQuery();	
    				 if(rs.next())
    				 {  
    					 java.sql.Date t=rs.getDate("date");
   	    	   	      Date w=new Date(t.getTime());
    					order=new Order(idorder,rs.getString("username"),rs.getString("productname"),rs.getString("storename"),rs.getInt("commnum"),rs.getDouble("price"),rs.getString("state"),w);
    					 
    				 }
    				}
    				catch(Exception e)
    				{
    					System.out.println(idorder);
    					e.printStackTrace();
    				}
    			return order;	
    			
    	 
     }
     
     public List<Order> getOrderbyCustomer(String username)
     {
    	 LinkedList<Order> olist=new LinkedList<Order>();
    	 try{
    	   	  ps= con.prepareStatement("Select * from `order` where username=? ");
    	   	  ps.setString(1,username);
    	   	  rs=ps.executeQuery();
    	   	  while(rs.next())
    	   	  {
    	   	
    	   		  Order order=new Order(rs.getInt("idorder"),rs.getString("username") ,rs.getString("productname") ,rs.getString("storename"), rs.getInt("commnum"),rs.getDouble("price"),rs.getString("state"));
    	   	      olist.addFirst(order);
    	   	  }
    	   	  }
    	   	  catch(Exception e)
    	   	  {
    	   		  e.printStackTrace();
    	   	  }
    	 return olist;
     }
     public List<Order> getOrderbyDate(Date date)
     {
    	 List<Order> olist=new ArrayList<Order>();
    	 try{
    	   	  ps= con.prepareStatement("Select * from `order` where date=? ");
    	     SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
    	   	 date=new java.util.Date();  
    	   	 String str=sdf.format(date);  
    	   	  ps.setString(1,str);
    	   	  rs=ps.executeQuery();
    	   	  while(rs.next())
    	   	  {
    	   	
    	   		  Order order=new Order(rs.getInt("idorder"),rs.getString("username") ,rs.getString("productname") ,rs.getString("storename"), rs.getInt("commnum"),rs.getDouble("price"),rs.getString("state"));
    	   	      olist.add(order);
    	   	  }
    	   	  }
    	   	  catch(Exception e)
    	   	  {
    	   		  e.printStackTrace();
    	   	  }
    	 return olist;   
     }
     
     public boolean DelOrder(int idorder)
     {
    	 
    	 try{
				
			 ps=con.prepareStatement("delete from `order` where idorder=?");
			 ps.setInt(1,idorder);
	         ps.executeUpdate();
			 }
			 catch (SQLException e)
			 {
				e.printStackTrace();
				return false;
			 }
	  return true;
     }
     
     public List<Order> getAllOrder()
     {
    	 List<Order> olist=new ArrayList<Order>();
    	 try{
    	   	  ps= con.prepareStatement("Select * from `order`");
    	   	  rs=ps.executeQuery();
    	   	  while(rs.next())
    	   	  {
    	   	      java.sql.Date t=rs.getDate("date");
    	   	      Date w=new Date(t.getTime());
    	   		  Order order=new Order(rs.getInt("idorder"),rs.getString("username") ,rs.getString("productname") ,rs.getString("storename"), rs.getInt("commnum"),rs.getDouble("price"),rs.getString("state"),w);
    	   	      olist.add(order);
    	   	  }
    	   	  }
    	   	  catch(Exception e)
    	   	  {
    	   		  e.printStackTrace();
    	   	  }
    	 return olist;
     }
     
     public boolean setOrder(Order order)
     {
     	
     			try{
     			   	 ps= con.prepareStatement("UPDATE `order` SET state=? WHERE idorder=?");
     			   	 ps.setString(1, order.getState());
     			   	 ps.setInt(2,order.getIdorder());
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
