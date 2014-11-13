package com.parknshop.web;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.parknshop.dao.CommodityDao;
import com.parknshop.model.Commodity;
import com.parknshop.model.Seller;

/**
 * Servlet implementation class Modifyproduct
 */
public class Modifyproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modifyproduct() {
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
	
		HttpSession session=request.getSession();
		Seller seller=(Seller)session.getAttribute("seller");
		String productname=request.getParameter("productname");
		String shopname=seller.getStore().getShopname();
		System.out.println(productname+shopname);
		Double price=Double.valueOf(request.getParameter("price"));
		int stock=Integer.valueOf(request.getParameter("stock"));
		String details=request.getParameter("details");
		Connection con=(Connection)getServletContext().getAttribute("datesource");
		CommodityDao cd=new CommodityDao(con);
		Commodity commodity=cd.getCommodity(productname, shopname);
		commodity.setDetails(details);
		commodity.setPrice(price);
		commodity.setStock(stock);
		cd.setCommodity(commodity);
		
		ArrayList<Commodity> clist=new CommodityDao(con).getClist(seller.getStore().getShopname());
		seller.getStore().setClist(clist);
		RequestDispatcher view = request.getRequestDispatcher("/seller/check_store.jsp");
		view.forward(request,response);
	}

}
