<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="13111049lijingyue">
  <meta name="Keywords" content="【账户设置】">
  <meta name="Description" content="【卖家和买家公用的账户设置】【主要用于修改密码】">
 
  
  <title>account setting</title>
  
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

hr{border:10px solid #1B3F94;}



.button { 
display: inline-block; 
zoom: 1; 
*display: inline; 
margin:1cm;
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
width:100px;
height:50px;
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
background: -webkit-gradient(linear, left top, left bottom, from(#feb1d3), to(#f171ab)); 
background: -moz-linear-gradient(top, #feb1d3, #f171ab); 
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#feb1d3', endColorstr='#f171ab'); 
} 

</style>



<style type="text/css">
/* CSS Document */
body
{
background:url(back.jpeg);
background-color: #f5f7f7;
font: bold 15px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
}

#mytable {
border-collapse: collapse;
 width: 750px;
 padding: 0;
 text-align:center;
 }



#mytable th {
 height="20px";
 font: bold 15px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
 /*color: #4f6b72;*/
 color: #FFFFFF;
 border-right: 3px solid #C1DAD7;
 border-bottom: 3px solid #C1DAD7;
 border-top: 3px solid #C1DAD7;
 letter-spacing: 2px;
 text-transform: uppercase;
 padding: 10px 10px 10px 10px;
 background: #0000CD url(images/bg_header.jpg) no-repeat;
}

#mytable th.nobg {
 border-top: 0;
 border-left: 0;
 border-right: 3px solid #C1DAD7;
 background: none;
}

#mytable td {
 border-right: 3px solid #C1DAD7;
 border-bottom: 3px solid #C1DAD7;
 <!-- background: #fff; -->
 font-size:6px;
 padding: 13px 13px 13px 13px;
 color: #000000;
}


#mytable td.alt {
 background: #0000CD;
 color: #FFFFFF;
}




#mytable2{
 
width:"2100px" 
height:"3000px"
padding: 0;
margin-top:1cm;
 }

#mytable2 td {
 border-right: 3px solid #C1DAD7;
 border-bottom: 3px solid #C1DAD7;
 <!-- background: #fff; -->
 font-size:6px;
 padding: 13px 13px 13px 13px;
 color: #000000;
}


#mytable2 td.alt {
 background: #F5FAFA;
 color: #797268;
}


 

</style>




 <body bgcolor="#f5f7f7" style="background-image:url(picture/back.jpg);" >
<b>
<b>
 <table border=0>
  <tr height="10px" valign=top align=center><td width="800px" clospan=9>&nbsp;</td>
  <td width="100px" ><a href="../public/index.jsp" style="text-decoration:none;"><font color="#09a7d7" size="3">Home page</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../customer/Person information.jsp" style="text-decoration:none;"><font color="#09a7d7" size="3">Personal information</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><font  size="3">Account setting</a></td></font>
 
</table>
<hr/>

<form action="change_password.do" method="post">
<table >

	<tr>
	  <td><table width="100" height="100"></table></a></td>
	 </tr>
	  <tr>
	  <td><table width="210"></table></td>
	  <td align="center" bgcolor="#1B3F94"><h4><font  size="6" color="#FFFFFF"><b>Account setting</b></font></h4></th>
	  <td></td>
	</tr>
	<tr>
	  <td><table width="2"></table></td>
	  <td><table id="mytable">
			<tr>
			<td>Old password</td>
			<td align="left"><input type="password" style="width:300px" name="password"></td>
			</tr>
			<tr>
			<td>New password</td>
			<td align="left"><input type="password" style="width:300px" name="new passwords"></td>
			</tr>
			<tr>
			<td>New password confirm</td>
			<td align="left"><input type="password" style="width:300px"></td>
			</tr>
			</table>
	  </td>
	  <tr>
	  <td><table width="2"></table></td>
	  <td align="center"><input type="button" value="submit" class="button b" onclick="this.form.submit()" >
	  </td>
	  </tr>
 </table>
 </form>
 </body>
	

