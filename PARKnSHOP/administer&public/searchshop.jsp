<%@ page import="com.parknshop.dao.* , com.parknshop.model.* , java.util.* ,java.sql.* " %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>search for the shop</title>
	<link rel="stylesheet" href="../css/searchshop.css">
	 <script type="text/javascript">
 function search() {

  var opval=document.getElementById("search_text").value;

  location.href="searchshop.jsp?shopname="+opval;
 }
</script>
</head>
<body >
    <div id="link">
		<table id="link_table">
			<tr>
				<td><a href="admin_homepage.jsp">poundage record</a></td>
				<td><a href="hanshopapply.jsp">operate shop apply</a></td>
				<td><a href="searchshop.jsp">search shop</a></td>
				<td><a href="searchuser.jsp">search user</a></td>
				<td><a href="blacklist.jsp">blacklist</a></td>
			</tr>
		</table>
	</div>
	<div id="head">
		<span>Please Search The Shop</span>
		<input type="text" id="search_text" placeholder="please input shop name" >
		<input type="button" value="search" id="search_button" onclick="javascrtpt:search()">	
	</div>
	<% 
	   String shopname=request.getParameter("shopname");
	   if(shopname==null)
	   {
		   shopname="";
	   }
	   StoreDao sd=new StoreDao((Connection)application.getAttribute("datesource"));
	   List<Store> slist=sd.searchByName(shopname);
	   pageContext.setAttribute("slist", slist);
	%>  
	<div id="body">
		<table id="shop_table">
			<tr>
				<th>shop name</th>
				<th>shop owner</th>
				<th>shop type</th>
				<th>operate</th>
			</tr>
			<c:forEach var="store" items="${slist}">
			    <tr>
				<td>${store.shopname}</td>
				<td>${store.username}</td>
				<td>${store.type}</td>
				<td>
					<input type="button" value="delete" onclick="javascript:window.location.href='./deleteshop.do?username=${store.username}&shopname=${store.shopname}'">
					<input type="button" value="blacklist" onclick="javascript:window.location.href='./blacklist.do?shopname=${store.shopname}'">
				</td>
                </tr>
	      </c:forEach>
			
		</table>
	</div>
	
</body>
</html>