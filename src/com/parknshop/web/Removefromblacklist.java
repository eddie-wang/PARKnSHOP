package com.parknshop.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class Removefromblacklist
 */
@WebServlet("/Removefromblacklist")
public class Removefromblacklist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Removefromblacklist() {
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
			Customer customer =cd.getCustomerFromBlacklist(username);
			customer.setIsBlacklist(false);
			cd.setCustomer(customer);
			RequestDispatcher view = request.getRequestDispatcher("/administer&public/blacklist.jsp");
			view.forward(request,response);
		}
		if(shopname!=null)
		{
			StoreDao cd=new StoreDao(con);
			System.out.println(shopname);
			Store store =cd.getStoreFromBlacklist(shopname);
			store.setIsBlacklist(false);
			cd.setStore(store);
			RequestDispatcher view = request.getRequestDispatcher("/administer&public/blacklist.jsp");
			view.forward(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
