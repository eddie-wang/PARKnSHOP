package com.parknshop.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.parknshop.dao.CustomerDao;
import com.parknshop.dao.FavoriteDao;
import com.parknshop.model.Customer;

/**
 * Servlet implementation class Delfavorite
 */

public class Delfavorite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delfavorite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String shopname=request.getParameter("storename");
		String productname=request.getParameter("productname");
		System.out.println(username+shopname+productname);
		Connection con=(Connection)getServletContext().getAttribute("datesource");
		FavoriteDao fd=new FavoriteDao(con);
		fd.delFavorite(username, productname, shopname);
		HttpSession session=request.getSession();
		Customer customer=(Customer)session.getAttribute("customer");
	    customer.setFavoritelist(new FavoriteDao(con).getFavoriteList(customer.getUserNameC()));
		RequestDispatcher view = request.getRequestDispatcher("/customer/Favorites.jsp");
		view.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
