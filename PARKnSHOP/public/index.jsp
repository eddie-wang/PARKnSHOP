<%@ page import="com.parknshop.dao.* , com.parknshop.model.* , java.util.* , java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title>home page</title>
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
  #mytable1 {
   border:3px solid #C1DAD7;
  }
  #mytable1 td{
  border:1px solid black;
  }
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
  hr{border:10px solid #1B3F94;}
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
 
 <%
 if(request.getAttribute("message")!=null)
 {
 %>
 window.onload =function ()
 {
     alert("<%=request.getAttribute("message")%>");
 };
 <%}%>
 
</script>


 </head>

<body  background="images/back.jpg"><b>
  <table border=0><tr height="10px" valign=top align=center>
  <%
       Customer customer=(Customer)session.getAttribute("customer");
       if(customer==null)
     {	 
  %>
 
  <td width="100px" style="border-right-color:black; border-right-style:solid; border-right-width:1px;"><a href="../administer&public/login.jsp" style="text-decoration:none;">Log_in</a></td>
  <td width="100px" ><a href="../administer&public/regist.html" style="text-decoration:none;">Register</a></td>
 <%} else {%>
 <td><label>welcome ${customer.userNameC} </label> </td> 
 <%}%>
  <td width="500px" >&nbsp;</td>
  <td width="100px" ><a href="personal_center.jsp" style="text-decoration:none;">Personal center</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../customer/My-cart.jsp" style="text-decoration:none;">Shopping cart</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../customer/Favorites.jsp" style="text-decoration:none;">Favorites</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../seller/sellercenter.do" style="text-decoration:none;">Seller center</a></td>
  <c:if test="${customer!=null }">
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../administer&public/login.jsp" style="text-decoration:none;">Log Out</a></td>
   </c:if>
  </tr>

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
 <table style="margin-left:90px">
 <tr height="500px" valign=top><td>
 <table id="mytable1" bgcolor="ecffff">
 <tr height="50px" valign=center align=center id="sd"><td width="200px"><font size="5" face="Verdana" color="white">Products Types</font></td></tr>
 <tr height="30px" valign=center align=center onmouseover="this.style.backgroundColor='#b1d6f1'" onmouseout="this.style.backgroundColor='#ECFFFF'" ><td width="200px"><a href="searchbytype.do?type=Wines%26Beer" style="text-decoration:none;">Wines&Beer</a></td></tr>
 <tr height="30px" valign=center align=center onmouseover="this.style.backgroundColor='#b1d6f1'" onmouseout="this.style.backgroundColor='#ECFFFF'"><td width="200px"><a href="searchbytype.do?type=Dairy%26Eggs" style="text-decoration:none;">Dairy&Eggs</a></td></tr>
 <tr height="30px" valign=center align=center onmouseover="this.style.backgroundColor='#b1d6f1'" onmouseout="this.style.backgroundColor='#ECFFFF'"><td width="200px"><a href="searchbytype.do?type=Frozen_food" style="text-decoration:none;">Frozen food</a></td></tr>
 <tr height="30px" valign=center align=center onmouseover="this.style.backgroundColor='#b1d6f1'" onmouseout="this.style.backgroundColor='#ECFFFF'"><td width="200px"><a href="searchbytype.do?type=Snacks" style="text-decoration:none;">Snacks</a></td></tr>
 <tr height="30px" valign=center align=center onmouseover="this.style.backgroundColor='#b1d6f1'" onmouseout="this.style.backgroundColor='#ECFFFF'"><td width="200px"><a href="searchbytype.do?type=Personal_care" style="text-decoration:none;">Personal care</a></td></tr>
 <tr height="30px" valign=center align=center onmouseover="this.style.backgroundColor='#b1d6f1'" onmouseout="this.style.backgroundColor='#ECFFFF'"><td width="200px"><a href="searchbytype.do?type=Paper" style="text-decoration:none;">Paper</a></td></tr>
 <tr height="30px" valign=center align=center onmouseover="this.style.backgroundColor='#b1d6f1'" onmouseout="this.style.backgroundColor='#ECFFFF'"><td width="200px"><a href="searchbytype.do?type=Bakery" style="text-decoration:none;">Bakery</a></td></tr>
 <tr height="30px" valign=center align=center onmouseover="this.style.backgroundColor='#b1d6f1'" onmouseout="this.style.backgroundColor='#ECFFFF'"><td width="200px"><a href="searchbytype.do?type=House_clean" style="text-decoration:none;">House clean</a></td></tr>
 <tr height="30px" valign=center align=center onmouseover="this.style.backgroundColor='#b1d6f1'" onmouseout="this.style.backgroundColor='#ECFFFF'"><td width="200px"><a href="searchbytype.do?type=House_use" style="text-decoration:none;">House use</a></td></tr>
 <tr height="30px" valign=center align=center onmouseover="this.style.backgroundColor='#b1d6f1'" onmouseout="this.style.backgroundColor='#ECFFFF'"><td width="200px"><a href="searchbytype.do?type=Rice%26oil" style="text-decoration:none;">Rice&oil</a></td></tr>
 <tr height="30px" valign=center align=center onmouseover="this.style.backgroundColor='#b1d6f1'" onmouseout="this.style.backgroundColor='#ECFFFF'"><td width="200px"><a href="searchbytype.do?type=Beverage" style="text-decoration:none;">Beverage</a></td></tr>
 <tr height="30px" valign=center align=center onmouseover="this.style.backgroundColor='#b1d6f1'" onmouseout="this.style.backgroundColor='#ECFFFF'"><td width="200px"><a href="searchbytype.do?type=Grocery" style="text-decoration:none;">Grocery</a></td></tr>
 <tr height="30px" valign=center align=center onmouseover="this.style.backgroundColor='#b1d6f1'" onmouseout="this.style.backgroundColor='#ECFFFF'"><td width="200px"><a href="searchbytype.do?type=Biscuits" style="text-decoration:none;">Biscuits</a></td></tr>
 <tr height="30px" valign=center align=center onmouseover="this.style.backgroundColor='#b1d6f1'" onmouseout="this.style.backgroundColor='#ECFFFF'"><td width="200px"><a href="searchbytype.do?type=Confectionery" style="text-decoration:none;">Confectionery</a></td></tr>
 <tr height="30px" valign=center align=center onmouseover="this.style.backgroundColor='#b1d6f1'" onmouseout="this.style.backgroundColor='#ECFFFF'"><td width="200px"><a href="searchbytype.do?type=Chilled+Food" style="text-decoration:none;">Chilled Food</a></td></tr>
 <tr height="30px" valign=center align=center onmouseover="this.style.backgroundColor='#b1d6f1'" onmouseout="this.style.backgroundColor='#ECFFFF'"><td width="200px"><a href="searchbytype.do?type=Baby+Care" style="text-decoration:none;">Baby Care</a></td></tr>

 </table>
 </td>
 <td width="50px"></td>
 <% 
    Connection con=(Connection)application.getAttribute("datesource");
    TopProductDao tpd=new TopProductDao(con); 
    List<Commodity> clist= tpd.getProductList();
    pageContext.setAttribute("clist", clist);
 %>
 <td><table>
 <tr><td>
 <table id="mytable">
 <tr height="50px" valign=center align=left id="sd"><td colspan=5><font size="5" face="Verdana" color="white">Top 10 Products</font></td></tr>
 <tr height="100px" valign=center align=center>
    <c:forEach var="i" begin="0" end="4"> 
	<td width="150px"><img src="${clist[i].path}" style="width:130px;height:100px;"></td>
    </c:forEach>
 </tr>
 <tr height="20px" valign=center align=center>
	 <c:forEach var="i" begin="0" end="4"> 
	 <td width="150px"><a href="product_information.jsp?productname=${clist[i].productname}&shopname=${clist[i].shopname}" style="text-decoration:none;">${clist[i].productname}</a></td>
    </c:forEach>
 </tr>
 <tr height="100px" valign=center align=center>
	 <c:forEach var="i" begin="5" end="9"> 
	<td width="150px"><img src="${clist[i].path}" style="width:130px;height:100px;"></td>
    </c:forEach>
 </tr>
 <tr height="20px" valign=center align=center>
	<c:forEach var="i" begin="5" end="9"> 
	 <td width="150px"><a href="product_information.jsp?productname=${clist[i].productname}&shopname=${clist[i].shopname}" style="text-decoration:none;">${clist[i].productname}</a></td>
    </c:forEach>
 </tr>
 </table>
 </td></tr>

 <tr height="10px"></tr>
  <% 
    TopStoreDao tsd=new TopStoreDao(con); 
    List<Store> slist= tsd.getStoreList();
    pageContext.setAttribute("slist", slist);
 %>
 <tr>
 <td>
 <table id="mytable">
 <tr height="50px" valign=center align=left id="sd"><td colspan=5><font size="5" face="Verdana" color="white">Top 10 Stores</font></td></tr>
 <tr height="100px" valign=center align=center>
	 <c:forEach var="i" begin="0" end="4"> 
	<td width="150px"><img src="${slist[i].path}" style="width:130px;height:100px;"> 	
	<br>
	<a href="SearchByShop?shopname=${slist[i].shopname}" style="text-decoration:none;">${slist[i].shopname}</a>
	</td>
	</c:forEach>
 </tr>
    <tr height="10px" valign=center align=center>
	
	 <c:forEach var="i" begin="5" end="9"> 
	<td width="150px"><img src="${slist[i].path}" style="width:130px;height:100px;"> 	
	<br>
	<a href="SearchByShop?shopname=${slist[i].shopname}" style="text-decoration:none;">${slist[i].shopname}</a>
	</td>
	</c:forEach>	
 </tr>
 </table>
 </td></tr>

 </table>
 </td>
 </tr></table>
 </body>

</html>
