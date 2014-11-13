package com.parknshop.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.parknshop.dao.CustomerDao;
import com.parknshop.model.Customer;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
	
		
		 Connection con=(Connection)this.getServletContext().getAttribute("datesource");
		 Customer customer=new Customer();
		 customer.setAddress(request.getParameter("address"));
		 customer.setBirthday(Date.valueOf(request.getParameter("birthday")));
		 customer.setEmail(request.getParameter("email"));
		 customer.setIsBlacklist(false);
		 customer.setPassword(request.getParameter("password"));
		 customer.setPhoneNumber((String)request.getParameter("telnumber"));
		 customer.setSex(request.getParameter("sex"));
		 customer.setUserNameC(request.getParameter("username"));
		 CustomerDao cd=new CustomerDao(con);
		 if(cd.addCustomer(customer))
		 {	 
		 request.setAttribute("message", "register successfully,please login!");
		 }
		 else
		 {
			
			 request.setAttribute("message", "username is already used, please try another one");
		 }
	
		    RequestDispatcher view = request.getRequestDispatcher("/administer&public/login.jsp");
			view.forward(request,response); 
		
	}

}
