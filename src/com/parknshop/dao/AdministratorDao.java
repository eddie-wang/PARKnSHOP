package com.parknshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.parknshop.model.Administrator;

public class AdministratorDao {
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	public AdministratorDao(Connection con)
	{
		this.con=con;
	}
	public boolean addAdministrator(Administrator admin)
	{   
		try{
		 ps=con.prepareStatement("Insert into administer Values(?,?)");
		 ps.setString(1,admin.getUserNameA());
		 ps.setString(2,admin.getPassword());
		 ps.executeUpdate();
		}
		catch(Exception e)
		{
			return false;
		}
		return true;
	}
	public Administrator getAdministrator(String usernamea)
	{
		 Administrator admin=null;
		try{
			 ps=con.prepareStatement("select * from administer where userNameA=?");
			 ps.setString(1,usernamea);
			 rs=ps.executeQuery();
			 System.out.println("asdf"+usernamea);
			 if(rs.next())
			 {
				admin=new Administrator(usernamea,rs.getString("password"));
				 
			 }
			}
			catch(Exception e)
			{
			  e.printStackTrace();
			}
		return admin;
		
	}
	public boolean delStore(String username)
	   {
		   
		   try{
				
				 ps=con.prepareStatement("delete from store where userNameS=?");
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
