package com.parknshop.web;

import java.io.IOException;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.parknshop.dao.OrderDao;
import com.parknshop.model.Fun;
import com.parknshop.model.Order;
/**
 * Servlet implementation class Calculate
 */
@WebServlet("/Calculate")
public class Calculate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Calculate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String start=request.getParameter("start");
		  String end=request.getParameter("end");
		  Date dstart=new Date();
		  Date dend=new Date();
		  Connection con=(Connection)getServletContext().getAttribute("datesource");
		  OrderDao od=new OrderDao(con);
	        try{
	            dstart= new SimpleDateFormat("yyyy-MM-dd").parse(start);
	            dend=new SimpleDateFormat("yyyy-MM-dd").parse(end);
	            List<Order> olist=od.getAllOrder();
	            double total=Fun.commission(dstart, dend, olist );
	            request.setAttribute("total", total);
	            RequestDispatcher view = request.getRequestDispatcher("admin_homepage.jsp");
	   		    view.forward(request,response);
	        }
	        catch(Exception e){
	            e.printStackTrace();
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
