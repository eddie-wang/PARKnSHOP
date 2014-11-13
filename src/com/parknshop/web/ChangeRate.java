package com.parknshop.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class ChangeRate
 */
@WebServlet("/ChangeRate")
public class ChangeRate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeRate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int rate=Integer.valueOf(request.getParameter("rate"));
		System.out.println(rate);
		 Connection con=(Connection)getServletContext().getAttribute("datesource");
		 try{
				
		     java.sql.PreparedStatement ps= con.prepareStatement("UPDATE rate SET rate=? where NOT rate=0");
		     ps.setInt(1, rate);
		     ps.executeUpdate();
			  }
			  catch(Exception e)
			  {  
				  e.printStackTrace();			 
			  }
		 response.sendRedirect("admin_homepage.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
