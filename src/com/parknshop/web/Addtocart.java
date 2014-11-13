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

import com.parknshop.dao.ShopcartDao;
import com.parknshop.model.Commodity;
import com.parknshop.model.Customer;
import com.parknshop.model.Shopcart;

/**
 * Servlet implementation class Addtocart
 */
@WebServlet("/Addtocart")
public class Addtocart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addtocart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int commnum=Integer.valueOf(request.getParameter("quantity"));
		 HttpSession session=request.getSession();  
		 Commodity commodity=(Commodity)session.getAttribute("commodity");
		 Customer customer=(Customer)session.getAttribute("customer");
		 if(customer==null)
		 {   String message="you need to log in first!!";
		     request.setAttribute("message", message);
			 response.sendRedirect("../administer&public/login.jsp");
			 
		 }	
		 else{
		 Shopcart shopcart=new Shopcart(customer.getUserNameC(),commodity.getProductname(),commodity.getShopname(),commnum);
		 System.out.println(shopcart.getProductname()+shopcart.getStorename());
		 Connection con=(Connection)this.getServletContext().getAttribute("datesource");
		 ShopcartDao scd=new ShopcartDao(con);
		 scd.addShopcart(shopcart);
		 String url="/public/product_information.jsp?productname="+commodity.getProductname()+"&shopname="+commodity.getShopname();
		 String message="add success!";
		 request.setAttribute("message", message);
		 System.out.println(message);
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
