package com.parknshop.web;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class DatabaseInitiater
 *
 */
@WebListener
public class DatabaseInitiater implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public DatabaseInitiater() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0) {
        // TODO Auto-generated method stub
    	Connection con=null;
	    try{
		Class.forName("com.mysql.jdbc.Driver");
	    }
	    catch(Exception e)
	    {
	    	System.out.println("jdbc-mysql 没有找到");
	    }
	    try {
	       con =DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/parknshop", "root", "root");
	       ServletContext sc=arg0.getServletContext();
	       sc.setAttribute("datesource", con);
	    
	    }
	    catch(Exception e)
	    {
	    	System.out.println("连接数据库失败！");
	    }
	    
	    
    	
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0) {
        // TODO Auto-generated method stub
    	
    	 Connection con=(Connection)arg0.getServletContext().getAttribute("datesource");
    	 try{
    	 con.close();
    	 }
    	 catch(Exception e)
    	 {
    		 
    	 }
    }
	
}
