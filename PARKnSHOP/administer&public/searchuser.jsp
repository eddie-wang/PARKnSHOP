<%@ page import="com.parknshop.dao.* , com.parknshop.model.* , java.util.* ,java.sql.* " %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>search for the user</title>
	<link rel="stylesheet" href="../css/searchuser.css">
	<script type="text/javascript">
	function search() {

   var opval=document.getElementById("search_text").value;

    location.href="searchuser.jsp?username="+opval;
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
		<span>Please Search The User</span>
		<input type="text" id="search_text" placeholder="please input user name" >
		<input type="submit" value="search" id="search_button" onclick="javascrtpt:search()">	
	</div>
	<% 
	   String username=request.getParameter("username");
	   if(username==null)
	   {
		   username="";
	   }
	   CustomerDao cd=new CustomerDao((Connection)application.getAttribute("datesource"));
	   List<Customer> clist=cd.searchByname(username);
	   pageContext.setAttribute("clist", clist);
	%>  
	<div id="body">
		<table id="user_table">
			<tr>
				<th>User name</th>
				<th>Telephone</th>
				<th>Email</th>
				<th>operate</th>
			</tr>
			<c:forEach var="customer" items="${clist}">
			<tr>
				<td>${customer.userNameC}</td>
				<td>${customer.phoneNumber}</td>
				<td>${customer.email}</td>
				<td>
					<input type="button" value="delete" onclick="javascript:window.location.href='./userdelete.do?username=${customer.userNameC}'">
					<input type="button" value="blacklist" onclick="javascript:window.location.href='./blacklist.do?username=${customer.userNameC}'">
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<!-- <div id="tail">
		<input type="submit" value="seave" id="seave">
	</div> -->
	
</body>
</html>