package com.parknshop.web;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.parknshop.dao.CommodityDao;
import com.parknshop.model.Commodity;
import com.parknshop.model.Seller;

/**
 * Servlet implementation class Deleteproduct
 */

public class Deleteproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deleteproduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String shopname=request.getParameter("shopname");
		String productname=request.getParameter("productname");
		Connection con=(Connection)getServletContext().getAttribute("datesource");
		CommodityDao cd=new CommodityDao(con);
		cd.delCommodity(productname,shopname);
		HttpSession session=request.getSession();
		Seller seller=(Seller)session.getAttribute("seller");
		ArrayList<Commodity> clist=new CommodityDao(con).getClist(seller.getStore().getShopname());
		seller.getStore().setClist(clist);
		RequestDispatcher view = request.getRequestDispatcher("./check_store.jsp");
		view.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
