<%@ page import="com.parknshop.dao.* , com.parknshop.model.* , java.util.* , java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title>submit order </title>
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">


  <style>

hr{border:10px solid #1B3F94;}

  #mytable {
  border:1px solid #C1DAD7;
  }
  #mytable td{
  border:none;
  text-align:center;
  }
  #mytable5 {
  border:1px dotted #C0C0C0;
  }
  #mytable5 td{
  border-bottom:1px dotted #C0C0C0;
  }





#mytable th {

 font: bold 15px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
 color: white;
 border-right: 3px solid #C1DAD7;
 border-bottom: 3px solid #C1DAD7;
 border-top: 3px solid #C1DAD7;
 
 background: #1B3F94 url(images/bg_header.jpg) no-repeat;
}



#mytable4 {
border-collapse: collapse;
 width: 840px;
 padding: 0;
 text-align:center;
 }




#mytable4 td {
 border-right: 3px solid #C1DAD7;
 border-bottom: 3px solid #C1DAD7;
 <!-- background: #fff; -->
 font-size:6px;
 padding: 13px 13px 13px 13px;
 color: #FFFFFF;
}


#mytable4 td.alt {
 background: #0000CD;
 color: #0000CD;
}


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
width:200px;
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
 </head>

 <body  background="images/back.jpg">

	<table border=0>
	<tr height="10px" valign=top align=center>
	<td width="900px" >&nbsp;</td>
	<td width="100px" ><a href="../public/index.jsp" style="text-decoration:none;">Home page</a></td>
	<td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="personal_center.jsp" style="text-decoration:none;">Personal center</a></td>
	<td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../customer/My-cart.jsp" style="text-decoration:none;">Shopping cart</a></td>
	<td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../customer/Favorites.jsp" style="text-decoration:none;">Favorites</a></td>
	</table>
<hr/>


<table width="85" height="100">

<table border=0>
<tr>
<td width="220px">&nbsp</td>
<td>
<table width="850px" height="200px" border=0 id="mytable">
<caption align="center" ><font size="5" face="verdana"><b>Confirm Order Information</caption>
<tr>
<th width="100px"><b>Picture</th>
<th width="100px"><b>Store Name</th>
<th width="100px"><b>Product Name</th>
<th width="100px"><b>Price</th>
<th width="100px"><b>Quantity</th>
<th width="100px"><b>Total</th>
</tr>
<% 
  Customer  customer=(Customer)session.getAttribute("customer");
  List<Order> olist=(List<Order>)session.getAttribute("olist");
  for(Order order:olist)
  {
  Connection con=(Connection)application.getAttribute("datesource");
  CommodityDao cd=new CommodityDao(con);
  Commodity commodity=cd.getCommodity(order.getProductname(),order.getStorename());
  pageContext.setAttribute("order",order);
  pageContext.setAttribute("commodity",commodity); 
%>
<tr>
<td width="100px" ><b><img src="${commodity.path}" style="width:100px;height=100px;"></td>
<td width="100px"><b>${order.storename}</td>
<td width="100px"><b>${order.productname}</td>
<td width="100px"><b>${order.price}</td>
<td width="100px"><b>${order.commnum}</td>
<td width="100px"><b>${order.price*order.commnum}</td>
</tr>
<% }%>
</table>
</td>
<td>&nbsp</td>
</tr>
</table>
<br>
<br>

<table border=0><tr><td width="220px">&nbsp</td>
<td width="800px"><table  border=0>
<caption align="center" ><font size="5" face="verdana"><b>Select shipping information</caption>
<tr align="left"><td><input type="radio" name="address" value="b1" /><table id="mytable5"><tr><td width="200px" id="t"><%=customer.getUserNameC()%>(recipient) <br> <%=customer.getPhoneNumber()%>(telephone)</td></tr>
<tr><td width="200px"><%=customer.getAddress()%></td></tr>
</table></td><td width="10px"></td>
</tr>
<tr align="left"><td colspan="4"><input type="radio" name="address" value="b3" /><font color="black">fill in new shipping information</td></tr>
<tr><td colspan="4"><table id="mytable4">
<tr>
<td bgcolor="#0000CD" align="center" height="30px" ><font  size="4" ><b>consignee</font></td>
	<td align="left"><input type="text" style="width:600px;"></td>
</tr>
<tr>
<td bgcolor="#0000CD" align="center" height="30px"><font  size="4"><b>Telephone</font></td>
	<td align="left"><input type="text" style="width:600px;"></td>
</tr>
<tr>
<td bgcolor="#0000CD" align="center" height="30px"><font  size="4"><b>Address</font></td>
	<td align="left"><input type="text" style="width:600px;"></td>
</tr>

</table></td></tr>
</table></td>
</tr></table>


<table border=0>
<tr>
<td height="25px">&nbsp</td>
</tr>
<tr>
<td width="550px">&nbsp</td>
<td><input type="button" class="button" value="Submit Order" onclick="javascrtpt:window.location.href='./payment_center.jsp'" ></td>
</tr>
</table>


















 </body>
</html>
