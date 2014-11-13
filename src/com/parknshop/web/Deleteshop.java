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

import sun.security.krb5.SCDynamicStoreConfig;

import com.parknshop.dao.CommodityDao;
import com.parknshop.dao.SellerDao;
import com.parknshop.dao.StoreDao;
import com.parknshop.model.Commodity;

/**
 * Servlet implementation class Deleteshop
 */
@WebServlet("/Deleteshop")
public class Deleteshop extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deleteshop() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String shopname=request.getParameter("shopname");
		Connection con=(Connection)getServletContext().getAttribute("datesource");
		StoreDao sd=new StoreDao(con);
		sd.delStore(username);
		SellerDao sed=new SellerDao(con);
		sed.delSeller(username);
		CommodityDao cd=new CommodityDao(con);
		List<Commodity> clist=cd.searchByshop(shopname);
		for(Commodity c:clist)
		{
			cd.delCommodity(c.getProductname(), shopname);
		}
		response.sendRedirect("./searchshop.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
