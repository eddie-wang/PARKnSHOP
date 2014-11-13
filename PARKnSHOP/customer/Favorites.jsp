<%@ page import="com.parknshop.dao.* , com.parknshop.model.* , java.util.* ,java.net.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> Favorites </title>
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

#mytable {
 width: 900px;
 padding: 0;
 margin: 0;
 }



#mytable th {
 font: bold 15px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
 color: #FFFFFF;
 border-right: 3px solid #C1DAD7;
 border-bottom: 3px solid #C1DAD7;
 border-top: 3px solid #C1DAD7;
 letter-spacing: 2px;
 text-transform: uppercase;
 padding: 1px 1px 1px 1px;
 background: #1B3F94 url(images/bg_header.jpg) no-repeat;

}


#mytable td {
 border-right: 3px solid #C1DAD7;
 border-bottom: 3px solid #C1DAD7;
 <!-- background: #fff; -->
 font-size:11px;
 padding: 6px 6px 6px 12px;
 color: #4f6b72;
}


#mytable td.alt {
 background: #F5FAFA;
 color: #797268;
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
width:70px;
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
hr{border:10px solid #1B3F94;}

</style>


 <body >
  <table border=0 >
  <tr height="20px" valign=top align=center>
  <td width="900px" colspan=9>&nbsp;</td>
  <td width="100px" ><a href="../public/index.jsp"  style="text-decoration:none">Home page</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../public/personal_center.jsp"  style="text-decoration:none">Personal center</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="My-cart.jsp"  style="text-decoration:none">Shopping cart</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;">Favorites</td>
  <!-- <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../seller/check_store.html"  style="text-decoration:none">Sellers_center</a></td> -->
  </tr>
  </table>
  <hr />
  
<table>
  <tr height="70px"   valign=left align=center>
  <td  width="300px">&nbsp;</td>
  </tr>
  <tr height="50px" >
  &nbsp;
  </tr>
<table >


<table>
<tr>
<td width="200px">&nbsp;</td>
<td>
<table id="mytable" >
 <tr height="50px">
<th   width="150px"><font size="4">Product name</font></th>
<th  width="150px" ><font  size="4">Store</font></th>
<th width="150px" ><font  size="4">Price</font></th>
<th   width="150px"><font  size="4">Class</font></th>
<th   width="150px"><font size="4">&nbsp;</font></th>
 </tr>
 <% 
 Customer  customer=(Customer)session.getAttribute("customer");
 if(customer==null)
 {   response.sendRedirect("../administer&public/login.jsp");
     return;
 }	
  for(Commodity commodity:customer.getFavoritelist())
  {
 %>
<tr valign=center align=center height="50px"><td><a href='../public/product_information.jsp?productname=<%=URLEncoder.encode(commodity.getProductname(),"UTF-8")%>&shopname=<%=URLEncoder.encode(commodity.getShopname(),"UTF-8")%>' style="text-decoration:none"><%=commodity.getProductname() %></a></td>
<td><%=commodity.getShopname()%></td>
<td><%=commodity.getPrice()%></td>
<td><%=commodity.getType()%></td>
 <td><input type="button" value="Delete" class="button b" onclick="javascript:window.location.href='./favoritedelete.do?username=<%=URLEncoder.encode(customer.getUserNameC(),"UTF-8")%>&productname=<%=URLEncoder.encode(commodity.getProductname(),"UTF-8")%>&storename=<%=URLEncoder.encode(commodity.getShopname(),"UTF-8")%>'" /></td></tr>
<% }%>
<!-- <tr valign=center align=center height="50px"><td><a href="#" style="text-decoration:none">5</a></td><td></td><td></td><td></td><td><input  value="Delete" class="button b" /></td></tr> -->
  </table>
</td>
</th>


  </table>
 </body>
</html>
