package com.parknshop.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.parknshop.dao.TopProductDao;
import com.parknshop.dao.TopStoreDao;

/**
 * Servlet implementation class ManageAdv
 */
@WebServlet("/ManageAdv")
public class ManageAdv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageAdv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String productname=request.getParameter("productname");
		String shopname=request.getParameter("shopname");
		String state=request.getParameter("state");
		//0是top 1是一申请2是没申请
		Connection con=(Connection)getServletContext().getAttribute("datesource");
		if(productname!=null)
		{
		TopProductDao td=new TopProductDao(con);		
		if(state.equals("0"))
		{
			//remove form top
			td.delTopProduct(productname, shopname);
		    response.sendRedirect("../administer&public/advmanage.jsp");
		}
		else
			if(state.equals("1"))
			{
				td.changestate(productname,shopname);
				response.sendRedirect("../administer&public/advmanage.jsp");
			}
			else
			{
				td.addTopProduct(productname,shopname);
				response.sendRedirect("../seller/check_store.jsp");
			}
		}
		else			
		{
			TopStoreDao td=new TopStoreDao(con);		
			if(state.equals("0"))
			{
				//remove form top
				td.delTopProduct(shopname);
			    response.sendRedirect("../administer&public/advmanage.jsp");
			}
			else
				if(state.equals("1"))
				{
					td.changestate(shopname);
					response.sendRedirect("../administer&public/advmanage.jsp");
				}
				else
				{   String shopowner=request.getParameter("shopowner");
					td.addTopProduct(shopname,shopowner);
					response.sendRedirect("../seller/check_store.jsp");
				}
			
			
			
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

}
