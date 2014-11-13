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

import com.parknshop.dao.CommodityDao;
import com.parknshop.dao.CustomerDao;
import com.parknshop.dao.SellerDao;
import com.parknshop.dao.StoreDao;
import com.parknshop.model.Commodity;

/**
 * Servlet implementation class Userdelete
 */
@WebServlet("/userdelete")
public class Userdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Userdelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		System.out.println(username);
		Connection con=(Connection)getServletContext().getAttribute("datesource");	
		StoreDao sd=new StoreDao(con);
		CustomerDao cd=new CustomerDao(con);
		cd.delCustomer(username);
		try {
		String shopname=sd.getStore(username).getShopname();
		sd.delStore(username);
		SellerDao sed=new SellerDao(con);
		sed.delSeller(username);
		
		CommodityDao comd=new CommodityDao(con);
		List<Commodity> clist=comd.searchByshop(shopname);
		for(Commodity c:clist)
		{
			comd.delCommodity(c.getProductname(), shopname);
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		response.sendRedirect("./searchuser.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
