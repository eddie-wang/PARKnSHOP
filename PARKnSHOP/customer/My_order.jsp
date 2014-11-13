<%@ page import="com.parknshop.dao.* , com.parknshop.model.* , java.util.* ,java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> My order </title>
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  
   <script type="text/javascript">
  function show_confirm(id)
  {
  var r=confirm("Clicking this button means you have received the commodity and your money will be transfered to the seller's account ,are you sure?!!!");
  if(r==true)
  {
   var url="../seller/changeorderstate.do?idorder="+id+"&state=received";
   location.href=url;
  }
 
  }
  </script>
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

#mytable th.nobg {
 border-top: 0;
 border-left: 0;
 border-right: 3px solid #C1DAD7;
 background: none;
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
#h{border:10px solid #1B3F94;}

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
  <hr id="h" />
  
<table>
  <tr height="70px"  valign=center align=center>
  <td width="300px" >&nbsp;</td>
  </tr>

  <tr height="50px" >
  &nbsp;
  </tr>
<tr >
<td>
<table >
  <tr height="20px">
  <td >My order<hr align=left width="80px"/><td>
  </tr>
  <tr height="20px">
  <td><a href="My-cart.jsp"  style="text-decoration:none">My cart<hr align=left width="80px"/></a><td>
  </tr>
  <tr height="20px">
   <td><a href="Favorites.jsp"  style="text-decoration:none">My favorites</a><td>
  </tr>
  </table>
  </td>


  <td>

<table id="mytable" >
 <tr height="50px">
<th  width="150px"><font  size="4">Order number</font></th>
<th  width="150px" ><font  size="4">Product name</font></th>
<th  width="150px" ><font size="4">Store name</font></th>
<th   width="150px"><font  size="4">Price</font></th>
<th  width="150px"><font  size="4">State</font></th>
 </tr>
 <%   
      Connection con=(Connection)application.getAttribute("datesource");
      OrderDao od=new OrderDao(con);
      Customer customer=(Customer)session.getAttribute("customer");
      List<Order> olist=od.getOrderbyCustomer(customer.getUserNameC());
      pageContext.setAttribute("olist", olist);
 %>
<c:forEach var="order" items="${olist}" >
<tr valign=center align=center height="50px">
<td><a href="Order information.jsp?idorder=${order.idorder }" style="text-decoration:none">${order.idorder}</a></td>
<td>${order.productname}</td>
<td>${order.storename}</td>
<td>${order.price*order.commnum}</td>
<c:choose>
   <c:when test="${order.state=='delivered'}">
   <td><input type="button" onclick="show_confirm( ${order.idorder})" value="delivered" class="button b"  /></td>
   </c:when> 
   <c:when test="${order.state=='received'}">
   <td><input type="button" onclick="javascript:window.location.href='./Product_comment.jsp?productname=${order.productname}&shopname=${order.storename}'" value="received" class="button b"  /></td>
   </c:when> 
   <c:otherwise>
    <td>not delivered</td>
   </c:otherwise>
</c:choose>


</c:forEach>
<!-- <tr valign=center align=center height="50px"><td><a href="#" style="text-decoration:none">5</a></td><td></td><td></td><td></td><td></td><td></td></tr> -->
  </table>
</td>
</tr>
  </table>
 
 </body>
</html>
