<%@ page import="com.parknshop.dao.* , com.parknshop.model.* , java.util.* ,java.sql.* " %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Poundage record</title>
	<link rel="stylesheet" href="../css/admin_homepage.css">
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
				<td><a href="advmanage.jsp">Adv Management</a></td>
				<td><a href="login.jsp">log out</a></td>
			</tr>
		</table>
	</div>
	<div id="head">
		<span>Poundage record</span>
	</div>
	<form action="calculate.do" method="get">
	<div id="body" style="text-align:center;margin-top:60px;">
			<label id="label_name">Start time</label>
			<input type="date" class="textInput"  name="start"><br />
			<label id="label_password">End time</label>
			<input type="date" class="textInput" name="end" ><br>
		   <input type="submit" value="caculate" class="btn">
	</div>
	<%
	   
	    double total=0.0; 
	    
	     if(request.getAttribute("total")!=null)
	    	 total=(Double)request.getAttribute("total");
	   
	    Connection con=(Connection)application.getAttribute("datesource");
	   // -------------
	    Commodity commodity=null;
	    int rate=3;
		  try{
			
	     PreparedStatement ps= con.prepareStatement("Select * from rate");
		 ResultSet rs= ps.executeQuery();
		 rs.next();
		  rate=rs.getInt("rate"); 
		  }
		  catch(Exception e)
		  {  
			  e.printStackTrace();			 
		  }
	%>
	</form>
		<table id = "shop_table">
			<tr>
				<td>Trading Volume:</td>
				<td>$<%=total%> </td>
			</tr>
			<tr>
				<td>Income:</td>
				<td>$<%=total*3/100%></td>
			</tr>
			<tr>
				<td>Poundage:</td>
				<td><%=rate%>%</td>
			</tr> 
		</table>
	<form action="changerate.do" method="get">
	<div id="tail">
		<span>change poundage to</span>
		<input type="text" id="search_text" name="rate">
		<p>%</p>
		<input type="submit" value="save" id="seave">
	</div>
	</form>
</body>
</html>