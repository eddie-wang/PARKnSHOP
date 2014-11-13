package com.parknshop.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.parknshop.dao.CustomerDao;
import com.parknshop.model.Customer;

/**
 * Servlet implementation class Changepassword
 */
@WebServlet("/changepassword.do")
public class Changepassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Changepassword() {
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
		     String password=request.getParameter("password");
		     String new_password=request.getParameter("new_passwords");
		     HttpSession session=request.getSession();
		     Customer customer=(Customer)session.getAttribute("customer");
		     if(!customer.getPassword().equals(password))
		     {
		    	 request.setAttribute("message", "password error");
		     }
		     else
		     {
		    	 customer.setPassword(new_password);
		    	 Connection con=(Connection)getServletContext().getAttribute("datesource");
		    	 CustomerDao cd=new CustomerDao(con);
		    	 cd.setCustomer(customer);
		    	 request.setAttribute("message", "change success");
		     }
		     RequestDispatcher view = request.getRequestDispatcher("/seller/account_setting.jsp");
		     view.forward(request,response);
		     
	}

}
