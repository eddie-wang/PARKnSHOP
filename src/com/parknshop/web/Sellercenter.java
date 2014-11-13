package com.parknshop.web;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.parknshop.dao.CommodityDao;
import com.parknshop.dao.SellerDao;
import com.parknshop.dao.StoreDao;
import com.parknshop.model.Commodity;
import com.parknshop.model.Customer;
import com.parknshop.model.Seller;
import com.parknshop.model.Store;

/**
 * Servlet implementation class Sellercenter
 */

public class Sellercenter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sellercenter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		Customer customer=(Customer)session.getAttribute("customer");
		if(customer==null)
		{
			 response.sendRedirect("../administer&public/login.jsp");
			 return;
		}	
		 //数据库查seller 表 没有 再查onapply表 
		Connection con=(Connection)this.getServletContext().getAttribute("datesource");
		String username=customer.getUserNameC();
		PreparedStatement statement=null;
		ResultSet rs=null;
		try{
		statement= con.prepareStatement("Select * from seller where userNameS=? ");
		statement.setString(1, username);
		rs=statement.executeQuery();
		if(rs.next())
		{    
			    SellerDao sd=new SellerDao(con);
			    Seller seller =sd.getSeller(username);			
			    StoreDao sd2=new StoreDao(con);
			    Store store=sd2.getStore(username);			
			    if(store==null)
			    {request.setAttribute("message", "your store is blacklisted");
				RequestDispatcher view = request.getRequestDispatcher("/public/index.jsp");
				view.forward(request,response);
			    }
			    ArrayList<Commodity> clist=new CommodityDao(con).getClist(store.getShopname());		   
			    store.setClist(clist);
			    seller.setStore(store);
	    		session.setAttribute("seller", seller);
	    		System.out.println(seller.getStore().getShopname());
				RequestDispatcher view = request.getRequestDispatcher("/seller/check_store.jsp");
				view.forward(request,response); 
		}
		else
		{
			statement= con.prepareStatement("Select * from onapply where userNameC=? ");
			
			statement.setString(1, username);
			rs=statement.executeQuery();
			if(rs.next())
			{   String message="our administrator is processing your application ,please wait";
				request.setAttribute("message", message);
				RequestDispatcher view = request.getRequestDispatcher("/public/index.jsp");
				view.forward(request,response);
			}  
			else
			{
			RequestDispatcher view = request.getRequestDispatcher("/seller/sellerregist.jsp");
			view.forward(request,response);
			}
		}	
		}
		catch(Exception e)
		{}
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
