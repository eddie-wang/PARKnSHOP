package com.parknshop.web;

import java.io.IOException;
import java.sql.Connection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.parknshop.dao.CustomerDao;
import com.parknshop.dao.OnapplyDao;
import com.parknshop.dao.SellerDao;
import com.parknshop.dao.StoreDao;
import com.parknshop.model.Customer;
import com.parknshop.model.Onapply;
import com.parknshop.model.Seller;
import com.parknshop.model.Store;

/**
 * Servlet implementation class HandleApply
 */
public class HandleApply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleApply() {
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
		String [] accept=request.getParameterValues("handle");
		OnapplyDao od=new OnapplyDao((Connection)getServletContext().getAttribute("datesource"));
		
		 List<Onapply> applylist=od.getAllOnapply();
		 Iterator<Onapply> itr=applylist.iterator();
		 Connection con=(Connection)getServletContext().getAttribute("datesource");
		 Onapply apply;
		 HttpSession session=request.getSession();
		 CustomerDao cd=new CustomerDao(con);
		
		 int i=0;
			while(itr.hasNext())
			{   
				apply=itr.next();
				Customer customer=cd.getCustomer(apply.getUserNameC()); 
				String realname=apply.getUserNameS();
				String realid=apply.getRealId();
				String username=customer.getUserNameC();
				String shopname=apply.getShopName();
				String type=apply.getShopType();
				String email=apply.getEmail();
				String telephone=apply.getTelephone();
				if(accept[i++].equals("agree"))
				{
					Store store=new Store(shopname,username,type);
					
					Seller seller=new Seller(customer,realname,realid,email,telephone);
					StoreDao sd=new StoreDao(con);
					sd.addStore(store);
					SellerDao sellerd=new SellerDao(con);
					sellerd.addSeller(seller);
				}
				od.delOnapply(apply.getUserNameC());
				
			}
			RequestDispatcher view = request.getRequestDispatcher("/administer&public/admin_homepage.jsp");
			view.forward(request,response);
	}

}
