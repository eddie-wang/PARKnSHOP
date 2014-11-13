<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>seller regist</title>
	<link rel="stylesheet" href="../css/sellerregist.css">
</head>
<body >
	<a href="login.jsp">login</a>
	<a href="regist.jsp">regist</a>
	<div id="head">
		<span>seller register</span>
	</div>
	<form action="sellerregist.do" method="post">
	<div id="body1">
		<div id="perMessage">
			<!-- personal message -->
			<label id="lable_username">Real Name</label>
			<input type="text" id="user_name" placeholder="real name" name="realname"><br />
			<label id="label_password">ID Number</label>
			<input type="text" id="user_password" placeholder="id number" name="realid"><br />
			<label id="label_email">Email</label>
			<input type="text" style="margin-left:50px;" id="user_email" placeholder="email" name="email"><br />
			<label id="label_tele">Telephone</label>
			<input type="text" id="user_tele" placeholder="telephone number" name="telephone"><br />
		  
		</div>
	</div>
	<div id="body2">
		<div id="funMessage">
			<!-- fundamental message -->
			<label id="lable_shopname">ShopName</label>
			<input type="text" id="shop_name" placeholder="shop name" name="shopname"><br />
			<label id="label_shoptype">ShopType</label>
			<input type="text" id="shop_type" placeholder="shop type" name="shoptype"><br />
		</div>
	</div>
	<div id="body3">
		<input type="submit" value="submit" id="submit" onclick="return submitz()">
	</div>
</form>
<script type="text/javascript">
function $(id){
	return document.getElementById(id);
}
function submitz(){
	//uname
	var user=$("user_name");
    if(user.value==""){
		alert("user name can not be null!");	
		return false;
	}
	var inum=$("user_password");
    if(inum.value==""){
		alert("id number can not be null!");	
		return false;
	}
	var email=$("user_email");
	var eReg= /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.(?:com|cn)$/;
	if(email.value.search(eReg)==-1)
	{
		alert(" user email address is illegal!");	
		return false;
	}
	var tnum=$("user_tele");
	var tReg=/(\d){11}/gi;
	if(tnum.value.search(tReg)==-1)
	{
		alert("telephone number is illegal!");
		return false;
	}
	var sname=$("shop_name");
	if(sname.value=="")
	{
		alert("shop name can not be null!");
		return false;
	}
	var stype=$("shop_type");
	if(stype.value=="")
	{
		alert("shop type can not be null!");
		return false;
	}
	return true;
}



</script>
</body>
</html>