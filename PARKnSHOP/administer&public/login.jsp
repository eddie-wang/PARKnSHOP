<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>longin PARKnSHOP</title>
	<link rel="stylesheet" href="../css/login.css">
</head>
<body >
	<div>
	</div>
	<div id="box">
		<div id="head">
			<span>Welcome TO PARKnSHOP</span>		
		</div>
		<p align="center" style="color:red">
		 <% 
	     String message=(String)request.getAttribute("message");
		 if(message!=null){
		 %>
		 <%=message %> 
		 <%} %>
		 </p>
		 <form action="login.do" method="post">
		<div id="loginDiv">
			<label id="label_name">USERNAME</label>
			<input type="text" class="textInput" id="user_name" name="user_name" placeholder="username"><br />
			<label id="label_password">PASSWORD</label>
			<input type="password" class="textInput" id="user_password" name="user_password" placeholder="password" >
			<div>
				<span>Choose Your Identity</span></br>
				<input type="radio" name="identity" value="customer" checked="true" /> customer
				<input type="radio" name="identity" value="administrator" /> administrator
			</div>
			<a href="findpassword.html">forget password?</a>
			<a href="regist.html">register</a>
			<a href="../public/index.jsp"><input type="submit" value="login" id="submit"></a>
		</div>
		</form>
	</div>

</body>
</html>