package com.parknshop.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.parknshop.dao.CustomerDao;
import com.parknshop.dao.StoreDao;
import com.parknshop.model.Customer;
import com.parknshop.model.Store;

/**
 * Servlet implementation class Blacklist
 */
@WebServlet("/Blacklist")
public class Blacklist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Blacklist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con=(Connection)getServletContext().getAttribute("datesource");
		String username=request.getParameter("username");
		String shopname=request.getParameter("shopname");
		if(username!=null)
		{
			CustomerDao cd=new CustomerDao(con);
			Customer customer =cd.getCustomer(username);
			customer.setIsBlacklist(true);
			cd.setCustomer(customer);
			response.sendRedirect("searchuser.jsp");
		}
		else
			if(shopname!=null)
			{
				StoreDao sd=new StoreDao(con);
				Store store =sd.getStorebyName(shopname);
				store.setIsBlacklist(true);
				System.out.println(store.getIsBlacklist());
				sd.setStore(store);
				response.sendRedirect("searchshop.jsp");
				
			}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
