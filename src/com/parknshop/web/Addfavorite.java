package com.parknshop.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.parknshop.dao.FavoriteDao;
import com.parknshop.model.Commodity;
import com.parknshop.model.Customer;

/**
 * Servlet implementation class Addfavorite
 */

public class Addfavorite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addfavorite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 HttpSession session=request.getSession();
		 Customer customer=(Customer)session.getAttribute("customer");  
		 if(customer==null)
		 {   String message="you need to log in first!!";
		     request.setAttribute("message", message);
		     response.sendRedirect("../administer&public/login.jsp");
		 }	
		 else
		 {
		 Commodity commodity=(Commodity)session.getAttribute("commodity");
		 System.out.println(commodity.getDetails());
		 System.out.println(commodity.getDetails());
		 Connection con=(Connection)this.getServletContext().getAttribute("datesource");
		 FavoriteDao fd=new FavoriteDao(con);
		 fd.addFavorite(customer.getUserNameC(), commodity.getProductname(), commodity.getShopname());
		 customer.setFavoritelist(new FavoriteDao(con).getFavoriteList(customer.getUserNameC()));
		 String message=new String("add success!!!");
		 String url="/public/product_information.jsp?productname="+commodity.getProductname()+"&shopname="+commodity.getShopname();
		 request.setAttribute("message", message);
		 RequestDispatcher view = request.getRequestDispatcher(url);
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
