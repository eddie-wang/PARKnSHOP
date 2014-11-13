<%@ page import="com.parknshop.dao.* , com.parknshop.model.* , java.util.* ,java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="13111049_lijingyue">
  <meta name="Keywords" content="【查看订单】">
  <meta name="Description" content="【卖家查看店铺订单】">
 
  
  <title>check orders</title>
 </head>




<style type="text/css">

hr{border:10px solid #1B3F94;}

.button { 
display: inline-block; 
zoom: 1; 
*display: inline; 
vertical-align: center; 
outline: none; 
cursor: pointer; 
text-align: center; 
text-decoration: none; 
font: 14px/100% Arial, Helvetica, sans-serif; 
text-shadow: 0 1px 1px rgba(0,0,0,.3); 
-webkit-border-radius: .5em; 
-moz-border-radius: .5em; 
border-radius: .5em; 
-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2); 
-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2); 
box-shadow: 0 1px 2px rgba(0,0,0,.2); 
width:90px;
height:30px;
} 
.button:hover { 
text-decoration: none; 
} 
.button:active { 
position: relative; 
top: 1px; 
} 
.b { 
color: #0000000; 
border: solid 1px #d2729e; 
background: #b1d6f1; 
}

</style>


<style type="text/css">
/* CSS Document */
body
{
background:url(back.jpeg);
background-color: #f5f7f7;
font: bold 15px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
}

#mytable {
border-collapse: collapse;
 width: 750px;
 padding: 0;
text-align:center;
margin-left:1cm;
 }



#mytable th {

width:"303px";
 height:"500px";
 font: bold 15px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
 /*color: #4f6b72;*/
 color: black;
 border-right: 3px solid #C1DAD7;
 border-bottom: 3px solid #C1DAD7;
 border-top: 3px solid #C1DAD7;
 letter-spacing: 2px;
 text-transform: uppercase;
 padding: 10px 10px 10px 10px;
 background: #1B3F94 url(images/bg_header.jpg) no-repeat;
}

#mytable th.nobg {
 border-top: 5px;
 border-left: 5px;
 border-right: 3px solid #C1DAD7;
 background: none;
}

#mytable td {
 border-right: 3px solid #C1DAD7;
 border-bottom: 3px solid #C1DAD7;
 <!-- background: #fff; -->
 font-size:6px;
 padding: 13px 13px 13px 13px;
 color: #000000;
}


#mytable td.alt {
 background: #F5FAFA;
 color: #797268;
}




#mytable2{
 
width:"210px" 
height:"300px"
padding: 0;
margin-top:1cm;
 }

#mytable2 td {
 border-right: 3px solid #C1DAD7;
 border-bottom: 3px solid #C1DAD7;
 <!-- background: #fff; -->
 font-size:6px;
 padding: 13px 13px 13px 13px;
 color: #000000;
}


#mytable2 td.alt {
 background: #F5FAFA;
 color: #797268;
}


 

</style>





 <body bgcolor="#f5f7f7" style="background-image:url(picture/back.jpg);">
 <b>
<table border=0>
  <tr height="10px" valign=top align=center><td width="800px" clospan=9>&nbsp;</td>
  <td width="100px" ><a href="../public/index.jsp" style="text-decoration:none;"><font color="#09a7d7" size="3">Home page</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../seller/Update_store_information.jsp" style="text-decoration:none;"><font color="#09a7d7" size="3">Store information</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../seller/check_store.jsp" style="text-decoration:none;"><font color="#09a7d7" size="3">Seller center</a></td></font>
 
</table>
  <hr />

<table >

<tr>
	<td><table width="100" height="100"></table></td>
	<td></td>
	<td></td>
</tr>

<tr>
	<td><table id="mytable2" >
			<tr>
			<td>check_orders</td>
			</tr>
			<tr>
			<td><a href="../seller/check_store.jsp" style="text-decoration:none">check store products</td>
			</tr>
			<tr>
			<td><a href="../seller/check_sales.jsp" style="text-decoration:none">check sales</td>
			</tr>
		</table>
	</td>



	<td>
		<table id="mytable">
		<tr>
			<th><font color="#FFFFFF" size="5">order_number</th>
			<th><font color="#FFFFFF" size="5">Name</th>
			<th><font color="#FFFFFF" size="5">Quantity</th>
			<th><font color="#FFFFFF" size="5">Price</th>
			<th><font color="#FFFFFF" size="5">state</th>
		</tr>
        <%
        OrderDao od=new OrderDao((Connection)application.getAttribute("datesource"));
        Seller seller=(Seller)session.getAttribute("seller");
        List<Order> olist=od.getOrderbyshop(seller.getStore().getShopname());
        pageContext.setAttribute("olist", olist);
        %>  
        <c:forEach var="order" items="${olist}">  
		<tr>
		<td><a href="../customer/Order information.jsp?idorder=${order.idorder }" style="text-decoration:none;">${order.idorder}</a></td>
		<td>${order.productname}</td>
		<td>${order.commnum}</td>
		<td>$${order.price}</td>
		<c:if test="${order.state=='undelivered'}">
		<td align="center"><input type="button" value="undelivered" class="button b" onclick="javascript:window.location.href='./changeorderstate.do?idorder=${order.idorder}&state=delivered'" ></td>
		</c:if>
		<c:if test="${order.state!='undelivered'}">
		<td align="center"><input type="button" value="${order.state}" class="button b" disabled="true"></td>
		</c:if>
		</tr>
		</c:forEach>
		</table>
	
	
	
	</td>
	
</tr>






 </body>
