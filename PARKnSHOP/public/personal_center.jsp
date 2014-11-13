<%@ page import="com.parknshop.dao.* , com.parknshop.model.* " %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> personal center </title>
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <style type="text/css">
  hr{border:10px solid #1B3F94;}
  #mytable{
  border:3px solid #C1DAD7;
  }
  #mytable td{
  border-bottom:1px solid #C1DAD7; 
  }
  #mytable1 {
   border:3px solid #C1DAD7;
  }
  #mytable1 td{
  border:none;
  }
  </style>
 </head>

 <body  background="images/back.jpg">
 <b>
  <table border=0>
  <tr height="20px" valign=top align=center>
  <td width="1000px" colspan=9>&nbsp;</td>
  <td width="100px" ><a href="index.jsp"  style="text-decoration:none">Home page</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;">Personal center</td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../customer/My-cart.jsp"  style="text-decoration:none">Shopping cart</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../customer/Favorites.jsp"  style="text-decoration:none">Favorites</a></td>
  </tr>
  </table>
  <hr />
 <% 
  Customer  customer=(Customer)session.getAttribute("customer");
 if(customer==null)
 {   response.sendRedirect("../administer&public/login.jsp");
     return;
 }	
%>
  <table border=0 style="margin-left:50px">
  <tr height="50px" valign=center align=center>
  <td width="300px" colspan=2 >&nbsp;</td>
  <td>
  <table >
  <tr height="50px"  valign=center align=center>
  <td width="300px" >Home page</td>
  <td width="300px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../customer/Person information.jsp"  style="text-decoration:none">Personal information</a></td>
  <td width="300px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../seller/account_setting.jsp"  style="text-decoration:none">Account settings</a></td>
  <td colspan=8 >&nbsp;</td>
  </tr>
  <tr></tr>
  </table>
  </tr>
  <tr height="50px"> </tr>
  <tr><td width="50px"></td>
    <td>
	<table  id="mytable">
	<tr height="60px" valign=center align=center><td  width="100px"><a href="../customer/My_order.jsp" style="text-decoration:none">My order</a></td>
	<tr height="60px" valign=center align=center><td  width="100px"><a href="../customer/My-cart.jsp" style="text-decoration:none">My cart</a></td>
	<tr height="60px" valign=center align=center><td width="100px"><a href="../customer/Favorites.jsp" style="text-decoration:none">My favorites</a></td>
	
	</table>
  </td>
  <!-- <td width="5px">&nbsp;</td> -->
  <td><table id="mytable1">
  <tr height="200px" valign=center align=center><td width="200px"><img src="images/head.PNG" width="200px" height="180px"></td>
  <td><table border=0>
  <tr height="60px"><td width="200px" align=center>User name:</td><td width="200px" align=left>${customer.userNameC}</td></tr>
  <tr height="60px"><td width="200px" align=center>Birthday:</td><td width="200px" align=left>${customer.birthday}</td></tr>
  <tr height="60px"><td width="200px" align=center>Sex:</td><td width="200px" align=left>${customer.sex}</td></tr>
  </table></td>
  </tr>
  </table></td></tr></table></td>
  </tr>
  </table>
 </body>
</html>
