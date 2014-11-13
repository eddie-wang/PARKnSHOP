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
import com.parknshop.model.Commodity;

/**
 * Servlet implementation class SearchByshop
 */
@WebServlet("/SearchByshop")
public class SearchByshop extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchByshop() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con=(Connection)getServletContext().getAttribute("datesource");
		CommodityDao cd=new CommodityDao(con);
		String name=request.getParameter("shopname");
		List<Commodity> clist=cd.searchByshop(name);
		request.setAttribute("clist", clist);
		RequestDispatcher view = request.getRequestDispatcher("/public/search.jsp");
		view.forward(request,response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
