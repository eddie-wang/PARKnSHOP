<%@ page import="com.parknshop.dao.* , com.parknshop.model.* , java.util.* ,java.sql.* " %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>your blacklist</title>
	<link rel="stylesheet" href="../css/blacklist.css">
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
		<span>Your Blacklist</span>
		<input type="text" id="search_text" placeholder="user name/shop name" >
		<input type="submit" value="search" id="search_button">	
	</div>
	<div id="body">
		<div id="black_shop">
			<table id="shop_table">
			<tr height="55px">
				<th>shop name</th>
				<th>shop owner</th>
				<th>shop type</th>
				<th>handle</th>
			</tr>
			<% 
			   StoreDao sd=new StoreDao((Connection)application.getAttribute("datesource"));
			   List<Store> slist=sd.getBlacklist();
			   pageContext.setAttribute("slist", slist);
			%>
			 <c:forEach var="store" items="${slist}">
			<tr height="55px">
				<td>${store.shopname}</td>
				<td>${store.username}</td>
				<td>${store.type}</td>
				<td>
					<input type="button" value="delete" onclick="javascript:window.location.href='./deleteshop.do?username=${store.username}'">
					<input type="button" value="remove" onclick="javascript:window.location.href='./removefromblaclist.do?shopname=${store.shopname}'">
				</td>
			</tr>
			</c:forEach>
		</table>
		</div>
		<div id="black_user">
			<table id="user_table">
			<tr height="55px">
				<th>user name</th>
				<th>sex</th>
				<th>email</th>
				<th>operate</th>
			</tr>
			<% 
			   CustomerDao cd=new CustomerDao((Connection)application.getAttribute("datesource"));
			   List<Customer> clist=cd.getBlacklist();
			   pageContext.setAttribute("clist", clist);
			%>
			
			 <c:forEach var="customer" items="${clist}">			 
			 <tr height="55px">	
				<td>${customer.userNameC}</td>
				<td>${customer.sex}</td>
				<td>${customer.email}</td>
				<td>
					<input type="button" value="delete" onclick="javascript:window.location.href='./userdelete.do?username=${customer.userNameC}'">
					<input type="button" value="remove" onclick="javascript:window.location.href='./removefromblaclist.do?username=${customer.userNameC}'">
				</td>
		   	</tr>
			</c:forEach>
		</table>
		</div>
	</div>
	<!-- <div id="tail">
		<input type="submit" value="seave" id="seave">
	</div> -->
	
</body>
</html>