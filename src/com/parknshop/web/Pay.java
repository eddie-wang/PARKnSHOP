package com.parknshop.web;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.parknshop.dao.CommodityDao;
import com.parknshop.dao.OrderDao;
import com.parknshop.dao.ShopcartDao;
import com.parknshop.model.Commodity;
import com.parknshop.model.Order;

/**
 * Servlet implementation class Pay
 */
@WebServlet("/Pay")
public class Pay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
	    List<Order> olist=(List<Order>)session.getAttribute("olist");
	    Connection con=(Connection)getServletContext().getAttribute("datesource");
	    OrderDao od=new OrderDao(con);
	    CommodityDao cd=new CommodityDao(con);
	    ShopcartDao sd=new ShopcartDao(con);
	    for(Order order:olist)
	    {
	    	od.addOrder(order);
	    	
	    	Commodity commodity=cd.getCommodity(order.getProductname(), order.getStorename());
			commodity.setSalevolume(commodity.getSalevolume()+order.getCommnum());
			commodity.setStock(commodity.getStock()-order.getCommnum());
			cd.setCommodity(commodity);	
			sd.delShopcart(order.getUsername(), order.getProductname(), order.getStorename());
			
	    }
	    RequestDispatcher view = request.getRequestDispatcher("My_order.jsp");
		view.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
