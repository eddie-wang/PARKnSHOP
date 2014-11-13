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
 * Servlet implementation class ChangePersonInfo
 */
@WebServlet("/ChangePersonInfo")
public class ChangePersonInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePersonInfo() {
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
		
		String email=request.getParameter("email");
		String telephone=request.getParameter("telephone");
		String address=request.getParameter("address");
		HttpSession session=request.getSession();
		Customer customer=(Customer)session.getAttribute("customer");
		customer.setAddress(address);
		customer.setEmail(email);
		customer.setPhoneNumber(telephone);
		Connection con=(Connection)getServletContext().getAttribute("datesource");
		CustomerDao cd=new CustomerDao(con);
		cd.setCustomer(customer);
		request.setAttribute("message","update successfully!");
	    RequestDispatcher view = request.getRequestDispatcher("/customer/Person information.jsp");
	    view.forward(request,response);
	}

}
