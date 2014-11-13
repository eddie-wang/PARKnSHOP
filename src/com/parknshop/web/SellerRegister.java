package com.parknshop.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.parknshop.dao.OnapplyDao;
import com.parknshop.model.Customer;
import com.parknshop.model.Onapply;

/**
 * Servlet implementation class SellerRegister
 */
@WebServlet("/SellerRegister")
public class SellerRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerRegister() {
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
		//
		
		
		  Connection con=(Connection)this.getServletContext().getAttribute("datesource");
		  OnapplyDao od=new OnapplyDao(con);
		  Onapply apply=new Onapply();
		   apply.setRealId(request.getParameter("realid"));
		   apply.setShopName(request.getParameter("shopname"));
		   apply.setShopType(request.getParameter("shoptype"));
		   apply.setUserNameS(request.getParameter("realname"));
		   apply.setEmail(request.getParameter("email"));
		   apply.setTelephone(request.getParameter("telephone"));
		   HttpSession session=request.getSession();
		   Customer customer=(Customer)session.getAttribute("customer");
		   apply.setUserNameC(customer.getUserNameC());
		   if(od.addOnapply(apply))
		   request.setAttribute("message", "applying succeed! wait for approval from administer");
		   else
		   request.setAttribute("message", "failed");   
		//需要写一个商家追踪状态的页面
		 response.sendRedirect("../public/index.jsp");
		 return;
		 
	}

}
