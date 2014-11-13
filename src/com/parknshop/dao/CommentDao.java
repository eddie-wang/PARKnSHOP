package com.parknshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.parknshop.model.Comment;

public class CommentDao {
	 private Connection con=null;
	 private PreparedStatement ps=null;
	 private ResultSet rs=null;
	 public CommentDao(Connection con){
		 this.con=con;
	 } 
	 
	 public boolean addComment(Comment comment)
	 {
		 try{
				
			 ps=con.prepareStatement("Insert into comment Values(?,?,?,?)");
			 ps.setString(1, comment.getProductname());
			 ps.setString(2,comment.getShopname());
			 ps.setString(3,comment.getComment());
			 ps.setInt(4,comment.getScore());
			 ps.executeUpdate();
			 }
			 catch (SQLException e)
			 {
				e.printStackTrace();
				return false;
			 }
	  return true;
		 
	 }
	 
	 public List<String> getCommodity(String productname,String shopname)
		{
			  LinkedList<String> slist=new LinkedList<String>();
			  try{
				
			  ps= con.prepareStatement("Select * from comment where productname=? and shopname=?");
			  ps.setString(1, productname);
			  ps.setString(2,shopname);
			  rs=ps.executeQuery(); 
			  while(rs.next())
		   	  {
		   		  
		   		  String comment=rs.getString("comment");
		   	      System.out.println(comment);
		   		  slist.addFirst(comment);
		   	  }
			  }
			  catch(Exception e)
			  {  
				  e.printStackTrace();			 
			  }
			  return slist; 
		}
}
