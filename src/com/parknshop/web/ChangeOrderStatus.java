package com.parknshop.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.parknshop.dao.OrderDao;
import com.parknshop.model.Order;

/**
 * Servlet implementation class ChangeOrderStatus
 */
@WebServlet("/ChangeOrderStatus")
public class ChangeOrderStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeOrderStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idorder=request.getParameter("idorder");
		String state=request.getParameter("state");
		Connection con=(Connection)getServletContext().getAttribute("datesource");
		OrderDao od=new OrderDao(con);
		Order order=od.getOrder(Integer.valueOf(idorder));
		order.setState(state);
		od.setOrder(order);
	
		if(state.equals("delivered"))
		{ RequestDispatcher view = request.getRequestDispatcher("/seller/check_orders.jsp");
	      view.forward(request,response);
	       return;
		}
		else
		{
			response.sendRedirect("../customer/My_order.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
