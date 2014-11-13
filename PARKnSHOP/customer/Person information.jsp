<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> Person information </title>
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <script type="text/javascript">
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
<style type="text/css">
/* CSS Document */
body
{
background:url(back.jpg);
background-color: #f5f7f7;
font: bold 18px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
}
.button { 
display: inline-block; 
zoom: 1; 
*display: inline; 
vertical-align: center; 
outline: none; 
cursor: pointer; 
text-align: center; 
text-decoration: none; 
font: 14px/100% Arial, Helvetica, sans-serif; 
text-shadow: 0 1px 1px rgba(0,0,0,.3); 
-webkit-border-radius: .5em; 
-moz-border-radius: .5em; 
border-radius: .5em; 
-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2); 
-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2); 
box-shadow: 0 1px 2px rgba(0,0,0,.2); 
width:70px;
height:30px;
} 
.button:hover { 
text-decoration: none; 
} 
.button:active { 
position: relative; 
top: 1px; 
} 
.b { 
color: #0000000; 
border: solid 1px #d2729e; 
background: #b1d6f1; 
} 
hr{border:10px solid #1B3F94;}		
</style>





 <body >
  <table border=0 >
  <tr height="20px" valign=top align=center>
  <td width="900px" colspan=9>&nbsp;</td>
  <td width="100px" ><a href="../public/index.jsp"  style="text-decoration:none">Home page</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;">Personal center</td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="My-cart.jsp"  style="text-decoration:none">Shopping cart</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="Favorites.jsp"  style="text-decoration:none">Favorites</a></td>
  <!-- <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../seller/check_store.html"  style="text-decoration:none">Sellers_center</a></td> -->
  </tr>
  </table>
  <hr />

 <form action="updateperson" method="post">
  <table border=0>
  <tr height="70px"  valign=center align=center>
  <td  width="500px">&nbsp;</td>
  <td>
  <table>
  <tr height="20px"  valign=center align=left>
  <td width="300px" ><a href="../public/personal_center.jsp"  style="text-decoration:none">Home page</a></td>
  <td width="300px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;">Personal information</td>
  <td width="300px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../seller/account_setting.jsp"  style="text-decoration:none">Account settings</a></td>
  <td colspan=5 >&nbsp;</td>
  </tr>
  <tr></tr>
  </table>
  </tr>


  <tr height="100px">
  <td width="500px"  valign=buttom align=right>Username:</td>
  <td width="500px"  valign=buttom align=left><span>${customer.userNameC}</span></td>
  <td width="500px" colspan=3 >&nbsp</td>
  </tr>

  

  <tr height="70px" >
  <td width="500px"  valign=top align=right>Phone Number:</td>
  <td width="500px"  valign=top align=left><input Type="text" style="width:250px;font-size:18px;" name="telephone"  id="telephone" value="${customer.phoneNumber}" /></td>
  <td width="500px" colspan=3 >&nbsp</td>
  </tr>


  <tr height="70px" >
  <td width="500px"  valign=top align=right>Email:</td>
  <td width="500px"  valign=top align=left><input  Type="text" style="width:250px;font-size:18px;" name="email" id="email" value="${customer.email}"/></td>
  <td width="500px" colspan=5>&nbsp</td>
  </tr>

<tr height="70px" >
  <td width="500px"  valign=top align=right>Address:</td>
  <td width="500px"  valign=top align=left><input  Type="text" style="width:250px;font-size:18px;" name="address" id="address" value="${customer.address}"/></td>
  <td width="500px" colspan=5>&nbsp</td>
  </tr>


  <tr height="70px" >
  <td width="100px"/>
  <td > &nbsp;&nbsp;&nbsp;&nbsp;  <input type="submit" value="Save" class="button b" onclick="return submitI()" /></td>
  </tr>
  </table>
  </form>

 <script type="text/javascript">
  function $(name){
	  return (document.getElementsByName(name))[0];
  }
  function submitI(){
	  var tnum=$("telephone");
	  var tReg=/(\d){11}/gi;
	  if(tnum.value.search(tReg)==-1)
	 {
	    	alert("telephone number is illegal!");
		    return false;
	 }
	 var email=document.getElementById("email");
	var eReg= /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.(?:com|cn)$/;
	if(email.value.search(eReg)==-1)
	{
		alert(" user email address is illegal!");	
		return false;
	}

	var add=document.getElementById("address");
	if(add.value==""){
		alert("address can not be null!");
	}
	return true;
  }
  </script>
   </body>
</html>
