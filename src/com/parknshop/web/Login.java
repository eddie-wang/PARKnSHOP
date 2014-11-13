package com.parknshop.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.parknshop.dao.AdministratorDao;
import com.parknshop.dao.CustomerDao;
import com.parknshop.dao.FavoriteDao;
import com.parknshop.model.Administrator;
import com.parknshop.model.Customer;

/**
 * Servlet implementation class Login
 */

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name,password;
		name=request.getParameter("user_name");
		password=request.getParameter("user_password");
		//数据库连接	   
	    Connection con=(Connection)getServletContext().getAttribute("datesource");
	    if(request.getParameter("identity").equals("customer"))
	   { 	//customer login
	       CustomerDao cd=new CustomerDao(con);
	       Customer customer=cd.getCustomer(name);
	
	       
	       if(customer!=null)
	    {   
	    	if(customer.getIsBlacklist())
	    	{
	    		 request.setAttribute("message", "Sorry , You are blacklisted? To get more details ,please contact the admin");
	    		
	    	}
	    	else
	    	{
	    	    if(customer.getPassword().equals(password))
	    	   {
	    		  customer.setFavoritelist(new FavoriteDao(con).getFavoriteList(name));
	    		  HttpSession session=request.getSession();
	    		  session.setAttribute("customer", customer);
	    		  response.sendRedirect("../public/index.jsp");
	    		  return ;
	    	   }
	    	   else
	    	       request.setAttribute("message", "wrong password");
	    	}
	    	 
	    } else
			request.setAttribute("message", "no such user");
	 
	   
	   
	    RequestDispatcher view = request.getRequestDispatcher("/administer&public/login.jsp");
		view.forward(request,response);
		return;
	    }
	    else
	    {
	    	
	    	//administtrator login
	    	AdministratorDao ad=new AdministratorDao(con);
	  	   Administrator administrator=ad.getAdministrator(request.getParameter("user_name"));
	  	      if(administrator!=null)
	  	    {   
	  	    	
	  	    	 
	  	    	if(administrator.getPassword().equals(password))
	  	    	{
	  	    	RequestDispatcher view = request.getRequestDispatcher("/administer&public/admin_homepage.jsp");
	  	   		view.forward(request,response);
	  	   		return;
	  	    		
	  	    	}
	  	    	else
	  	    	{
	  	    		 request.setAttribute("message", "wrong password");
	  	    	}
	  	    	 
	  	    }
	  	    else
	  	    {
	  	    	request.setAttribute("message", "no such admin");
	  	    	
	  	    }
	  	    
	    	RequestDispatcher view = request.getRequestDispatcher("/administer&public/login.jsp");
			view.forward(request,response);
			return;
	    }
	}

}
