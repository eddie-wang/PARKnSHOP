<%@ page import="com.parknshop.dao.* , com.parknshop.model.* , java.util.* , java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> search products </title>
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <style>
  #mytable {
   border:3px solid #C1DAD7;
  }
  #mytable td{
  border:none;
  }
  #sd{
  background-color:#1B3F94;
  }
  hr{border:10px solid #1B3F94;}
  a{border:0;}
  #mtable {
  border:1px solid #0000CD;
  background-color: #0000CD;
  height:30px;
  width:650px;
  }
  #mtable td{
  border:none;
  }
  #text{
  height:20px;
  width:550px;
  font: bold 18px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
  }
  #button{
  height:30px;
  width:100px;
  background: #0000CD;
  border-color:#0000CD;
  color:white;
  font:18px/100% Arial, Helvetica, sans-serif; ;
  }
  #button:hover { 
  text-decoration: none;
  background:#007FFF;
  } 
  #button:active { 
  position: relative; 
  top: 1px;
  background:#0000FF;
  }
  #b1{
  display: inline-block; 
  zoom: 1; 
  *display: inline; 
  vertical-align: center; 
  outline: none; 
  cursor: pointer; 
  text-align: center; 
  text-decoration: none; 
  font: 14px/100% Arial, Helvetica, sans-serif; 
  <!-- text-shadow: 0 1px 1px rgba(0,0,0,.3); --> 
  -webkit-border-radius: .5em; 
  -moz-border-radius: .5em; 
  border-radius: .5em; 
  -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2); 
  -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2); 
  box-shadow: 0 1px 2px rgba(0,0,0,.2);
  height:30px;
  width:100px;
  background:#FFFFFF;
  border:2px solid #b1d6f1;
 }
  #b1:hover { 
  text-decoration: none; 
  background:#b1d6f1;
  } 


 #b2{
  display: inline-block; 
  zoom: 1; 
  *display: inline; 
  vertical-align: center; 
  outline: none; 
  <!-- cursor: pointer; --> 
  text-align: center; 
  text-decoration: none; 
  font: 14px/100% Arial, Helvetica, sans-serif; 
  height:20px;
  width:30px;
  background:#FFFFFF;
  border-color:#FFFFFF;
  }
 #b2:hover { 
  text-decoration: none;
  border:3px solid #b1d6f1;
  } 

  </style>
  
  <script type="text/javascript">
 function search() {

  var opval=document.getElementById("text").value;
  var radios = document.getElementsByName("option");
  if(radios[0].checked==true)
    location.href="SearchByName?productname="+opval;
  else
	location.href="SearchByShop?shopname="+opval;  
 }
 

</script>
 </head>

 <body bgcolor="#f5f7f7" background="images/back.jpg">
 <b>

  <table border=0>
  <tr height="10px" valign=top align=center>
  <td width="900px" >&nbsp;</td>
  <td width="100px" ><a href="index.jsp" style="text-decoration:none;">Home_page</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="personal_center.jsp" style="text-decoration:none;">Personal_center</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../customer/My-cart.jsp" style="text-decoration:none;">Shopping_cart</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../customer/Favorites.jsp" style="text-decoration:none;">Favorites</a></td>
  </table>
  <hr />
  <table border=0>
  <tr height="40px"><td width="50px">&nbsp;</td>
  <td width="200px">&nbsp;</td>
  <td width="150px"></td>
  <td>
	<table border=0>
	<tr height="10px" valign=top align=left>
	<td>
		<form>
		<input type="radio" checked="checked" name="option" value="commodity">Product
		<input type="radio"  name="option" value="shop">Store
		</form>
	</td></tr>
	<tr height="30px" valign=top align=center><td>
        <table id="mtable">
		<tr>
        <td width="400px"><input type="text" id="text" placeholder="search here..." /></td>
         <td width="100px"><input  type="submit" value="Search" id="button" onclick="javascrtpt:search()"></td>
        </tr>
		</table>
	</td></tr>
	</table>
  </td>
  </table>
 <br>
   <div style="text-align:center;">
 <table border=0 width="90%">
 <tr valign=top>
 <td>
 <table border=0 width="100%">
 <tr><td>
 <% 
     List<Commodity> clist=(List<Commodity>)request.getAttribute("clist");
    System.out.println(clist.size());
 %>

 <table id="mytable" bgcolor="white">
 <tr height="50px" valign=center align=left id="sd"><td colspan=7><font size="5" face="Verdana" color="white">All Products</font></td></tr>
<c:forEach var="commodity" items="${clist}" varStatus="status">

 <c:if test="${status.index%4==0}">
 <tr height="200px" valign="center" align="center">
 </c:if>

    <td width="200px"><table border=1>
	<tr height="150px"><td><a href="product_information.jsp?productname=${commodity.productname}&shopname=${commodity.shopname}" style="text-decoration:none;"><img src="${commodity.path}" border=0 style="width:200px;height:150px;"></a></td></tr>
	<tr height="20px"><td><font color="#FF0000">$${commodity.price} </font></td></tr>
	<tr height="20px"><td><a href="product_information.jsp?productname=${commodity.productname}&shopname=${commodity.shopname}" style="text-decoration:none;">${commodity.productname}</a></td></tr>
	<tr height="10px"><td>${commodity.shopname}</td></tr></table></td>

 <c:if test="${status.index%4!=3}">
    <td width="10px"></td>
 </c:if>
 <c:if test="${status.index%4==3}">
   </tr>
 <tr height="10px"></tr>
 </c:if>
 </c:forEach>


 </table>
 </td></tr>
 <tr height="80px" align="center" valign="bottom"><td colspan=5>
 <form>
 <input type="button" id="b1" value="previous page">
 <input type="button" id="b2" value="1">
 <input type="button" id="b2" value="2">
 <input type="button" id="b2" value="3">
 ...
 <input type="button" id="b1" value="next page">
 </form>
 </td></tr></table>
 </td>
 <td width="30px"></td>
 <td width="10%">
 
 </table>
</div>
 </body>
</html>
