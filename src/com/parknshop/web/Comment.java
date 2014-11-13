package com.parknshop.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.parknshop.dao.CommentDao;

/**
 * Servlet implementation class Comment
 */
@WebServlet("/Comment")
public class Comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Comment() {
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
		
		String productname=request.getParameter("productname");
		String shopname=request.getParameter("shopname");
		String comment=request.getParameter("comment");
		String score=request.getParameter("score");
		System.out.println(score);
	    Connection con=(Connection)getServletContext().getAttribute("datesource");
		CommentDao cd=new CommentDao(con);
		com.parknshop.model.Comment c=new com.parknshop.model.Comment(productname,shopname,comment,Integer.valueOf(score));
		cd.addComment(c);
		RequestDispatcher view = request.getRequestDispatcher("./My_order.jsp");
	    view.forward(request,response);
	
	}

}
