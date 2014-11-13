<%@ page import="com.parknshop.dao.* , com.parknshop.model.* , java.util.* ,java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="13111049_lijingyue">
  <meta name="Keywords" content="【增加新产品】">
  <meta name="Description" content="【卖家增加新产品】">
 
  
  <title>Add new product</title>
 </head>

<style type="text/css">
/* CSS Document */


hr{border:10px solid #0000CD;}


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
 width: 450px;
 padding: 0;

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
 background: #CAE8EA url(images/bg_header.jpg) no-repeat;
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




 <body bgcolor="#f5f7f7"  style="background-image:url(picture/back.jpg);">

 <table border=0>
  <tr height="10px" valign=top align=center><td width="800px" clospan=9>&nbsp;</td>
  <td width="100px" ><a href="../public/index.jsp" style="text-decoration:none;"><font color="#09a7d7" size="3">Home page</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../seller/Update_store_information.jsp" style="text-decoration:none;"><font color="#09a7d7" size="3">Store information</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../seller/check_store.jsp" style="text-decoration:none;"><font color="#09a7d7" size="3">Seller center</a></td></font>
 
  </table>
 


<form action=modifyproduct.do method="post" id="form">
<table cellspacing="5">

<tr>
	<td><table width="300" height="100"></table></td>
	<td></td>
	<td></td>
</tr>
<tr>
<td></td>
<td align="center" bgcolor="#0000CD" colspan="2" height="50"><b><font color="#FFFFFF" size="5">Modify product</td>
<td></td>
</tr>


<tr>
	<td>&nbsp</td>
	<td align="center">
		<table frame="box" width="200" height="200" background=""> 
		<tr>
		<td>&nbsp</td>
		<td>&nbsp</td>
		<td>&nbsp</td>
		<td>&nbsp</td>
		</tr>
		<tr>
		<td>&nbsp</td>
		<td>&nbsp</td>
		<td>&nbsp</td>
		<td>&nbsp</td>
		</tr>
		<tr>
		<td>&nbsp</td>
		<td>&nbsp</td>
		<td>&nbsp</td>
		<td ><input type="button" value="upload picture" sytle="font-size:1000px;"></td>
		</tr>
		</table> 
	</td>
<%   
     Connection con=(Connection)application.getAttribute("datesource");
     CommodityDao cd=new CommodityDao(con);
     String productname=request.getParameter("productname");
     String shopname=request.getParameter("shopname");
     Commodity commodity=cd.getCommodity(productname, shopname);
     pageContext.setAttribute("commodity", commodity);
%>
	<td >
		<table id="mytable">
		<tr>
		<td align="right">Product_name</td>
		<td align="left"> ${ commodity.productname}</td>
	    <td><input type="hidden" name="productname" value="${commodity.productname}" ></td>
		</tr>
		<tr>
		<td align="right">Product_type</td>
		<td align="left"><input type="text" style="width:250px;" value="${commodity.type}" name="type"></td>
		</tr>
		<tr>
		<td align="right">Price</td>
		<td align="left"><input type="text" style="width:250px;" value="${commodity.price}" name="price"></td>
		</tr>
		<tr>
		<td align="right">Stock</td>
		<td align="left"><input type="text" style="width:250px;" value="${commodity.stock}" name="stock"></td>
		</tr>
		</table>
	</td>
	
</tr>


<tr >
<td><table width="1"></table></td>
<td colspan=4 align="left">
<table frame="box" width="650" height="200">
<tr>
<td align="center"><font size="2"><b>upload details :</td>
</tr>

<tr>
<td align="center"><textarea cols="50" rows="5"  form="form" name='details'> ${commodity.details}</textarea></td>
</tr>

<tr>
<td align="center"><input type="button" value="SAVE" class="button b" onclick="return submitx()"></td>
</tr>
</table>
</td>
</tr>
</table>
<script type="text/javascript">
 function $(id){
	 return (document.getElementsByName(id))[0];
 }
 //实现判断输入是否合法的功能。
 function submitx(){
	 //product_name不能为空
	 var pName=$("productname");
	 //price 不能小于等于0 不能是非数字的
	 var pPrice=$("price");
	 var pPReg=/\d||((\d)+\.(\d)+)/gi;
	 //stock不能小于等于0 不能是非数字的
	 var pStock=$("stock");
	 var pSReg=/(\d)+/gi;

	 //detail不能为空
	 var pDetail=$("details");
	 //alert(pDetail.value);
     
	 if(pName.value==""){
		 alert("product name mustn't null!");
		 pName.value="";
		 return false;
	 }else if(pPrice.value.search(pPReg)==-1||pPrice.value<=0){
		 alert("product price is illegal!");
		 pPrice.value="";
		 return false;
	 }else if(pStock.value.search(pSReg)==-1||pStock.value<0){
		 alert("product price is illegal!");
		 pStock.value="";
		 return false;
	 }else if(pDetail.value==" "){
		 alert("product details mustn't null!");
		 pDetail.value="";
		 return false;
	 }
	 this.form.submit();
	 return true;
 }

 </script>
</form>
 </body>
