<%@ page import="com.parknshop.dao.* , com.parknshop.model.*,java.sql.Connection,java.util.* " %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Manage Adv</title>
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
		<span>Manage Advertisement</span>
		<input type="text" id="search_text" placeholder="please input shop name" >
		<input type="submit" value="search" id="search_button">	
	</div>
	<div id="body">
	    <div id="black_shop">
		<table id="shop_table">
			<tr>
				<th>product name</th>
				<th>shop name</th>
				<th>state</th>
				<th>operate</th>
			</tr>
			<% 
			
			TopProductDao td=new TopProductDao((Connection)application.getAttribute("datesource"));
			List<TopProduct> toplist= td.getTopList();
			Iterator<TopProduct> itr=toplist.iterator();
			TopProduct top=null;
			while(itr.hasNext())
			{
				top=itr.next();
				pageContext.setAttribute("top", top);
			%>
			<tr>
				<td>${top.productname}</td>
				<td>${top.shopname}</td>
				<c:choose>
				<c:when test="${top.state==1}">
				<td>new application </td>
				<td>
					<div>
					<input type="button" name="agree" value="agree" onclick="javascript:window.location.href='../seller/manageadv.do?productname=${top.productname}&shopname=${top.shopname}&state=1'"/> 				
					<input type="button" name="reject" value="reject" onclick="javascript:window.location.href='../seller/manageadv.do?productname=${top.productname}&shopname=${top.shopname}&state=0'" />
					</div>

				</td>
				</c:when>
				<c:when test="${top.state==0}">
				<td>On homepage</td>
				<td>
			     <input type="button" name="agree" value="remove" onclick="javascript:window.location.href='../seller/manageadv.do?productname=${top.productname}&shopname=${top.shopname}&state=0'"/> 
				</td>
				</c:when>
				</c:choose>				
			</tr>
		 <%}%>
		</table>
		</div>
		
		<div id="black_user">
		<table id="user_table">
			<tr>
				<th>shop name</th>
				<th>shop owner</th>
				<th>state</th>
				<th>operate</th>
			</tr>
			<% 
			
			TopStoreDao tsd=new TopStoreDao((Connection)application.getAttribute("datesource"));
			List<TopStore> topslist= tsd.getTopList();
			Iterator<TopStore> itrs=topslist.iterator();
			TopStore tops=null;
			while(itrs.hasNext())
			{
				tops=itrs.next();
				pageContext.setAttribute("tops", tops);
			%>
			<tr>
				<td>${tops.shopname}</td>
				<td>${tops.shopowner}</td>
				<c:choose>
				<c:when test="${tops.state==1}">
				<td>new application </td>
				<td>
					<div>
					<input type="button" name="agree" value="agree" onclick="javascript:window.location.href='../seller/manageadv.do?shopname=${tops.shopname}&state=1'"/> 				
					<input type="button" name="reject" value="reject" onclick="javascript:window.location.href='../seller/manageadv.do?shopname=${tops.shopname}&state=0'" />
					</div>

				</td>
				</c:when>
				<c:when test="${tops.state==0}">
				<td>On homepage</td>
				<td>
			     <input type="button" name="agree" value="remove" onclick="javascript:window.location.href='../seller/manageadv.do?shopname=${top.shopname}&state=0'"/> 
				</td>
				</c:when>
				</c:choose>				
			</tr>
	    <% }%>
		</table>
		</div>
	</div>
</body>
</html>