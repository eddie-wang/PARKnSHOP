package com.parknshop.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.parknshop.dao.SellerDao;
import com.parknshop.dao.StoreDao;
import com.parknshop.model.Seller;
import com.parknshop.model.Store;

/**
 * Servlet implementation class ChangeStore
 */
@WebServlet("/changestore.do")
public class ChangeStore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeStore() {
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
		

		String type=request.getParameter("type");
		String email=request.getParameter("email");
		String telephone=request.getParameter("telephone");
		HttpSession session=request.getSession();
		Seller seller=(Seller)session.getAttribute("seller");
		seller.setEmail(email);
		seller.setTelephone(telephone);
		Store store=seller.getStore();
		store.setType(type);
		Connection con=(Connection)getServletContext().getAttribute("datesource");
		StoreDao sd=new StoreDao(con);
        sd.setStore(store);
        SellerDao sed=new SellerDao(con);
        sed.setSeller(seller);
        request.setAttribute("message","update successfully!");
    	 RequestDispatcher view = request.getRequestDispatcher("/seller/Update_store_information.jsp");
	   view.forward(request,response);
	}

}
