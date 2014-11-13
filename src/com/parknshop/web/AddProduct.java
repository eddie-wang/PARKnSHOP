package com.parknshop.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.parknshop.dao.CommodityDao;
import com.parknshop.model.Commodity;
import com.parknshop.model.Seller;

/**
 * Servlet implementation class AddProduct
 */
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
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
		
	
		   /*  String productname=request.getParameter("product_name");
		  String type=request.getParameter("product_type");
		  System.out.println(request.getParameter("price"));
		  double price=Double.valueOf(request.getParameter("price"));
		  int stock=Integer.valueOf(request.getParameter("stock"));
		  String details=request.getParameter("details");
		  System.out.println(details);
		  HttpSession session=request.getSession();
		  Seller seller=(Seller)session.getAttribute("seller");
		  String shopname=seller.getStore().getShopname();
		  Commodity commodity=new Commodity(productname,shopname,price,type,details,0,stock);
		  Connection con=(Connection)this.getServletContext().getAttribute("datesource");
		  CommodityDao cd=new CommodityDao(con);
		  cd.addCommodity(commodity);
		  seller.getStore().addCommodity(commodity);
		 */
		 //---------------------------------------------------------
		 String path=null;  
		SmartUpload mySmartUpload = new SmartUpload(); 		  
		  mySmartUpload.setCharset("UTF-8");
		  JspFactory _jspxFactory = null;
	         PageContext pageContext = null;
	         _jspxFactory = JspFactory.getDefaultFactory();
	         pageContext = _jspxFactory.getPageContext(this,request,response,"",true,8192,true);
		  mySmartUpload.initialize(pageContext); 
		  // 设定上传限制 
		  // 1.限制每个上传文件的最大长度。          
		  // mySmartUpload.setMaxFileSize(10000); 
		  // 2.限制总上传数据的长度。 
		  // mySmartUpload.setTotalMaxFileSize(20000); 
		  // 3.设定允许上传的文件（通过扩展名限制）,仅允许doc,txt文件。 
		  // mySmartUpload.setAllowedFilesList("doc,txt"); 
		  // 4.设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat, jsp,htm,html扩展名的文件和没有扩展名的文件。 
		  // mySmartUpload.setDeniedFilesList("exe,bat,jsp,htm,html,,"); 

		  try {
			System.out.println("begin");
			mySmartUpload.upload();
			System.out.println("ok");
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		  //读取其它数据 
		  String ext=mySmartUpload.getFiles().getFile(0).getFileExt();
		  System.out.println(mySmartUpload.getFiles().getCount());
		  Request req = mySmartUpload.getRequest(); 
		  String title = req.getParameter("title"); 
		           System.out.println(ext);
		  //保存文件 
		  for (int i = 0; i < mySmartUpload.getFiles().getCount(); i++) { 
		   System.out.println("adasdasdasd"); 
		 com.jspsmart.upload.File file = mySmartUpload.getFiles().getFile(i); 
		  if (file.isMissing()) 
			  {  
			    System.out.println("miss");
			    continue; 
			  }
		  try {
			  path="../images/" + file.getFileName();
			file.saveAs("/images/" + file.getFileName(),1);
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		  } 
		//------------------------------------------------------- 
		  String productname=(String)mySmartUpload.getRequest().getParameter("product_name");
		  String type=(String)mySmartUpload.getRequest().getParameter("product_type");
		 
		  double price=Double.valueOf((String)mySmartUpload.getRequest().getParameter("price"));
		  int stock=Integer.valueOf((String)mySmartUpload.getRequest().getParameter("stock"));
		  String details=(String)mySmartUpload.getRequest().getParameter("details");
		  System.out.println(details);
		  HttpSession session=request.getSession();
		  Seller seller=(Seller)session.getAttribute("seller");
		  String shopname=seller.getStore().getShopname();
		  System.out.println(path+"!!!!!");
		  Commodity commodity=new Commodity(productname,shopname,price,type,details,0,stock,path);
		  Connection con=(Connection)this.getServletContext().getAttribute("datesource");
		  CommodityDao cd=new CommodityDao(con);
		  cd.addCommodity(commodity);
		  seller.getStore().addCommodity(commodity);
		  RequestDispatcher view = request.getRequestDispatcher("/seller/check_store.jsp");
		  view.forward(request,response);
	}

}
