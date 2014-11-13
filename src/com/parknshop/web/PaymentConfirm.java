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

import com.parknshop.dao.CommodityDao;
import com.parknshop.dao.OrderDao;
import com.parknshop.model.Commodity;
import com.parknshop.model.Order;

/**
 * Servlet implementation class PaymentConfirm
 */
@WebServlet("/PaymentConfirm")
public class PaymentConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentConfirm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//1.Ìí¼ÓorderÊý¾Ý¿â 2.salevolum+1
		HttpSession session=request.getSession();
		Order order=(Order)session.getAttribute("order");
		Connection con=(Connection)this.getServletContext().getAttribute("datesource");
		OrderDao od=new OrderDao(con);
		od.addOrder(order);
		System.out.println("asdfqqqqqqqqqq");
		Commodity commodity=(Commodity)session.getAttribute("commodity");
		commodity.setSalevolume(commodity.getSalevolume()+order.getCommnum());
		commodity.setStock(commodity.getStock()-order.getCommnum());
		CommodityDao cd=new CommodityDao(con);
		cd.setCommodity(commodity);
		request.setAttribute("order", order);
		System.out.println(order.getIdorder());
		response.sendRedirect("../customer/My_order.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
