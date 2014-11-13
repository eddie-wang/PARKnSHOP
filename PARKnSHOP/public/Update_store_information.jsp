<!doctype html>
<html lang="en">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Update store information</title>
 </head>

<style type="text/css">
/* CSS Document */


hr{border:10px solid #1B3F94;}


.button { 
display: inline-block; 
zoom: 1; 
*display: inline; 
vertical-align: left; 
outline: none; 
cursor: pointer; 
text-align: center; 
text-decoration: none; 
font: 18px/100% Arial, Helvetica, sans-serif; 
text-shadow: 0 1px 1px rgba(0,0,0,.3); 
-webkit-border-radius: .5em; 
-moz-border-radius: .5em; 
border-radius: .5em; 
-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2); 
-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2); 
box-shadow: 0 1px 2px rgba(0,0,0,.2); 
width:90px;
height:35px;
margin-left:50px;
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
 width: 700px;
 padding: 0;
 margin-top:1.5cm;
 margin-left:5.5cm;
 text-align:center;
 }



#mytable th {
 height="20px";
 font: bold 15px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
 /*color: #4f6b72;*/
 color: black;
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
 background: #F5FAFA;
 color: #797268;
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






 <body bgcolor="#f5f7f7" style="background-image:url(picture/back.jpg);">

  <table border=0>
  <tr height="10px" valign=top align=center><td width="800px" clospan=9>&nbsp;</td>
  <td width="100px" ><a href="../public/index.jsp" style="text-decoration:none;"><font color="#09a7d7" size="3">Home page</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><font  size="3">Store information</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../seller/check_store.jsp" style="text-decoration:none;"><font color="#09a7d7" size="3">seller center</a></td></font>
 
</table>
<hr/>
 
<table>
<td><table width="100" height="100"></table></td>

</table>
<form action="changestore.do" method="post">
<table id="mytable">

<tr>
	<td bgcolor="#1B3F94"><font  size="5" color="#FFFFFF">Store nameš</font></td>
	<td align="left" >${seller.store.shopname}</td>
</tr>

<tr>
	<td bgcolor="#1B3F94"><font  size="5" color="#FFFFFF">Store typeš</font></td>
	<td align="left" ><div>
						<select name="type" style="width:260px;">
						<option value="food" >Wines&Beer</option>
						<option value="clothes">Dairy&Eggs</option>
						<option value="cleans">Frozen_food</option>
						<option value="cooking">Snacks</option>
						<option value="cooking">Personal_care</option>
						<option value="cooking">Paper</option>
						<option value="cooking">Bakery</option>
						<option value="cooking">House_clean</option>
						<option value="cooking">House_use</option>
						<option value="cooking">Rice&oil</option>
						
						</select>
						</div></td>
</tr>

<tr>
	<td bgcolor="#1B3F94"><font  size="5" color="#FFFFFF">Emailš</font></td>
	<td align="left"><input type="text" style="width:300px;" name="email" value="${seller.email}" ></td>
</tr>


<tr>
	<td bgcolor="#1B3F94"><font  size="5" color="#FFFFFF">Telephone</font></td>
	<td align="left"><input type="text" style="width:300px" name="telephone" value="${seller.telephone }"></td>
</tr>

</table>

<table cellspacing="20">
<tr>
<td><table width="320px"></table></td>
<td align="left">
<input type="button" value="save" class="button b" onclick="this.form.submit()">
</td>
</table>

</tr>
</form>
 </body>
