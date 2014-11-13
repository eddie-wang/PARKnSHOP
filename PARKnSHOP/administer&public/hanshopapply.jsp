<%@ page import="com.parknshop.dao.* , com.parknshop.model.*,java.sql.Connection,java.util.* " %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Handle Shop Owner's Apply</title>
	<link rel="stylesheet" href="../css/hanshopapply.css">
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
		<span>Handle Shop Owner's Apply</span>
		<input type="text" id="search_text" placeholder="please input shop name" >
		<input type="submit" value="search" id="search_button">	
	</div>
	<form action="acceptapply.do" method="post">
	<div id="body">
		<table id="shop_table">
			<tr>
				<th>shop name</th>
				<th>shop owner</th>
				<th>shop type</th>
				<th>handle</th>
			</tr>
			<% 
			
			OnapplyDao od=new OnapplyDao((Connection)application.getAttribute("datesource"));
			Onapply apply=null;
			List<Onapply> applylist= od.getAllOnapply();
			Iterator<Onapply> itr=applylist.iterator();
			while(itr.hasNext())
			{
				apply=itr.next();
				pageContext.setAttribute("apply", apply);
				System.out.println(apply.getShopType());
			%>
			<tr>
				<td>${apply.shopName}</td>
				<td>${apply.userNameS}</td>
				<td>${apply.shopType}</td>
				<td>
					<div>
					<input type="radio" name="handle" value="agree" checked="true" /> Agree
					<br />
					<input type="radio" name="handle" value="reject" /> Reject
					</div>

				</td>
			</tr>
		 <%}%>
		</table>
	</div>
	<div id="tail">
		<input type="submit" value="handle" id="seave">
	</div>
 </form>
</body>
</html>