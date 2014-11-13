package com.parknshop.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.parknshop.model.Customer;
import com.parknshop.model.Order;

/**
 * Servlet implementation class Handleshopcart
 */
@WebServlet("/Handleshopcart")
public class Handleshopcart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Handleshopcart() {
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
		String [] productname=request.getParameterValues("productname");
		String [] shopname=request.getParameterValues("shopname");
		String [] number=request.getParameterValues("quantity");
		String [] p=request.getParameterValues("price");
		HttpSession session=request.getSession();
		Customer customer=(Customer)session.getAttribute("customer");
		String username=customer.getUserNameC();
		int quantity=0;
		double price=0.0;
		List<Order> olist=new ArrayList<Order>();
		for(int i=0;i<productname.length;i++)
		{
			quantity=Integer.valueOf(number[i]);
			price=Double.valueOf(p[i]);
			Order order=new Order(0,username,productname[i],shopname[i],quantity,price);
			olist.add(order);
		}
		session.setAttribute("olist", olist);
		RequestDispatcher view = request.getRequestDispatcher("./order_submit.jsp");
		view.forward(request,response);
	}

}
