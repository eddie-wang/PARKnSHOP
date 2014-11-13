<%@ page import="com.parknshop.dao.* , com.parknshop.model.* , java.util.* , java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> Product_comment </title>
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
font: bold 18px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
}

#mytable2 {
border:3px solid #0000CD;
}
#mytable2 td{
border:none;
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
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;">Personal center</td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="My-cart.jsp"  style="text-decoration:none">Shopping cart</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="Favorites.jsp"  style="text-decoration:none">Favorites</a></td>
  <!-- <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../seller/check_store.html"  style="text-decoration:none">Sellers_center</a></td> -->
  </tr>
  </table>
  <hr />
  
<table>
  <tr height="70px"  valign=center align=center>
  <td >&nbsp;</td>
  </tr>
  <tr height="20px"></tr>
</table>
<%
   String productname=request.getParameter("productname");
   String shopname=request.getParameter("shopname");
   Connection con=(Connection)application.getAttribute("datesource");
   CommodityDao cd= new CommodityDao(con);
   cd.getCommodity(productname, shopname);
   pageContext.setAttribute("commodity",cd.getCommodity(productname, shopname));
%>
<table >
<tr height="150px">
<td width="300px">&nbsp;</td>
<td><table id="mytable2"><tr><td><img src="${commodity.path }" height="150px" width="150px"></td></tr></table></td>
<td width="800px">

<table id="mytable2">
<tr height="30px" valign=center align=center><td colspan=2>Product information</td></tr>
<tr height="40px">
<td width="300px" valign=center align=right>Product_name:</td><td width="300px" valign=center align=left>${commodity.productname }</td>
</tr  >
<tr height="40px">
<td width="300px" valign=center align=right>Product_price:</td><td width="300px" valign=center align=left>${commodity.price}</td>
</tr  >
<tr  height="40px">
<td width="300px" valign=center align=right>Store_name:</td><td width="300px" valign=center align=left>${commodity.shopname}</td>
</tr>
</table>

</td>
<td width="300px">&nbsp;</td>
</tr>
</table>

<table>
<tr height="200px">
<td width="250px">&nbsp;</td>
<td>
<form action="comment.do" method="post">
<table id="mytable2">
<tr height="20px" >&nbsp;</tr>
<tr height="50px" align=right valign=center><td width="100px">Product_comment:</td><td width="300px"  align=left><input type="text" style="width:300px;font-size:18px;" name="comment" /></td></tr>
<tr height="50px" align=right valign=center>
 <td width="10px">Product_score:</td>
      <td align="left" width="30px">
  
        <select name="score">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        </select>
  
      </td>

</tr>
</td>
<td width="20px">&nbsp;</td>
<td>
</td>
<td width="300px">&nbsp;</td>
</tr>
<tr>
<td>
<input type="hidden" name="productname" value="${commodity.productname }"/>
</td>
</tr>
<tr>
<td>
<input type="hidden" name="shopname" value="${commodity.shopname}"/>
</td>
</tr>
<tr  align="center" valign="center" ><td colspan=7><input type="submit" class="button b" value="Submit" /></td></tr>
</table>
</form>  
 </body>
</html>
