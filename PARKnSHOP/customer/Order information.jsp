<%@ page import="com.parknshop.dao.* , com.parknshop.model.* , java.util.* ,java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> Order information </title>
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
 </head>
<style type="text/css">

/* CSS Document */

body
{
background:url(back.jpg);
background-color: #f5f7f7;
font: bold 18px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
}

#mytable1 {
 padding: 0;
 margin: 0;
 }


#mytable1 td {
 border-right: 3px solid #C1DAD7;
 border-bottom: 3px solid #C1DAD7;
 <!-- background: #fff; -->
 font: bold 15px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
 padding: 6px 6px 6px 12px;
 color: #4f6b72;
}


#mytable1 td.alt {
 background: #F5FAFA;
 color: #797268;
}
hr{border:10px solid #1B3F94;}

</style>





   <body >
  <table border=0 >
  <tr height="20px" valign=top align=center>
  <td width="900px" colspan=9>&nbsp;</td>
  <td width="100px" ><a href="../public/index.jsp"  style="text-decoration:none">Home page</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;">Personal center</td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="My-cart.jsp"  style="text-decoration:none">Shopping cart</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="Favorites.jsp"  style="text-decoration:none">Favorites</a></td>
  <!-- <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../seller/check_store.html"  style="text-decoration:none">Sellers_center</a></td> -->
  </tr>
  </table>
  <hr />
  
<table>
  <tr height="70px" valign=center align=center>
  <td width="300px">&nbsp;</td>
  </tr>
  <tr height="30px"></tr>
</table>

<table>
<!-- <tr><td align="right" width="400px"colspan=4>µ±Ç°¶©µ¥×´Ì¬:</td><td align="left" width="1000px" colspan=10><label width="200px"/></td></tr> -->
<tr>
<td width="200px">&nbsp;</td>
<td width="900px">

<% 
  Connection con=(Connection)application.getAttribute("datesource");
  OrderDao od=new OrderDao(con);
  int idorder=Integer.valueOf(request.getParameter("idorder"));
  System.out.println(idorder);
  Order order=od.getOrder(idorder);
  System.out.println(order.getCommnum());
  pageContext.setAttribute("order", order);
  SellerDao sd= new SellerDao(con);
  Seller seller=sd.getSellerByshop(order.getStorename());
  System.out.println(seller==null);
  Customer customer= new CustomerDao(con).getCustomer(order.getUsername());
  System.out.println(order.getCommnum());
  pageContext.setAttribute("customer", customer);
  pageContext.setAttribute("seller", seller);
  System.out.println(seller.getRealName());
%>
<table  id="mytable1">
<tr height="50px" valign=center align=center ><td width="900px" colspan=9><font color="blue" size="4">Determine order information</font></td></tr>
<tr height="50px"><td align="right" width="400px" colspan=4>Customer name:</td><td align="left" width="500px" colspan=5>${customer.userNameC}</td></tr>
<tr height="50px"><td align="right" width="400px" colspan=4>Customer address:</td><td align="left" width="500px" colspan=5>${customer.address}</td></tr>
<tr height="50px"><td align="right" width="400px" colspan=4>Customer phone:</td><td align="left" width="500px" colspan=5>${customer.phoneNumber}</td></tr>
<tr height="50px"><td align="right" width="400px" colspan=4>Seller email</td><td align="left" width="500px" colspan=5>${seller.email}</td></tr>
<tr height="50px"><td align="right" width="400px" colspan=4>Store name:</td><td align="left" width="500px" colspan=5>${order.storename }</td></tr>
<tr height="50px"><td align="right" width="400px" colspan=4>Product name:</td><td align="left" width="500px" colspan=5>${order.productname}</td></tr>
<tr height="50px"><td align="right" width="400px" colspan=4>Price:</td><td align="left" width="500px" colspan=5>${order.price}</td></tr>
<tr height="50px"><td align="right" width="400px" colspan=4>Date:</td><td align="left" width="500px" colspan=5>${order.date}</td></tr>
<tr height="50px"><td align="right" width="400px" colspan=4>State:</td><td align="left" width="500px" colspan=5>${order.state}</td></tr>
</table>
</td>
<td width="300px">&nbsp;</td>




</tr>
</table>

 </body>
</html>
