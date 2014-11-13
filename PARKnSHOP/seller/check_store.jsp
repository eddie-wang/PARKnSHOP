<%@ page import="com.parknshop.dao.* , com.parknshop.model.* , java.util.* ,java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="13111049_lijingyue">
  <meta name="Keywords" content="【查看网店商品】">
  <meta name="Description" content="【卖家查看店铺商品】">
 
  
  <title>check store</title>
 </head>

<style type="text/css">
/* CSS Document */

hr{border:10px solid #1B3F94;}


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
color: #000000; 
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
 width: 750px;
 padding: 0;
 margin-left:1cm;
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
 background: #1B3F94 url(images/bg_header.jpg) no-repeat;
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
<b>
 <table border=0>
  <tr height="10px" valign=top align=center><td width="800px" clospan=9>&nbsp;</td>
  <td width="100px" ><a href="../public/index.jsp" style="text-decoration:none;"><font color="#09a7d7" size="3">Home page</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../seller/Update_store_information.jsp" style="text-decoration:none;"><font color="#09a7d7" size="3">Store information</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../seller/check_store.jsp" style="text-decoration:none;"><font color="#09a7d7" size="3">Seller Center</a></td></font>
 
</table>
<hr/>



 
<table >

<%
Seller seller =(Seller)session.getAttribute("seller");
Connection con=(Connection)application.getAttribute("datesource");
TopStoreDao tsd=new TopStoreDao(con);
  int state=tsd.getState(seller.getStore().getShopname());
 pageContext.setAttribute("state", state);
%>
<tr>
	<td><table width="100" height="100"></table></td>
	<td>&nbsp</td>
	
	<td align="right">
	<c:choose>
        <c:when test="${state==0}">
    	<a  style="text-decoration:none;">Your store is on our homepage</a>
		 </c:when>
		 <c:when test="${state==2}">
    	<a href="./manageadv.do?shopname=${seller.store.shopname}&shopowner=${seller.userNameC}&state=2'" style="text-decoration:none;">Apply for advertisement on our homepage</a>
		</c:when>
		
		</c:choose>
		<br>
		<br>
	<a href="../seller/Add_new_product.html" style="text-decoration:none;">Add new product</a>
	</td>
</tr>
<tr>
	<td><table id="mytable2">
			<tr>
			<td><a href="../seller/check_orders.jsp" style="text-decoration:none;">check orders</td>
			</tr>
			<tr>
			<td>check store products</td>
			</tr>
			<tr>
			<td><a href="../seller/check_sales.jsp" style="text-decoration:none;">check sales</td>
			</tr>
		</table>
	</td>


	<td><table width="10"></table>
	</td>


	<td>
		<table id="mytable" >
		
		<tr>
			<th ><font color="#FFFFFF" size="4">Name</th>
			<th ><font color="#FFFFFF"  size="4">Price</th>
			<th ><font color="#FFFFFF"  size="4">Details</th>
			<th ><font color="#FFFFFF"  size="4">Picture</th>
			<th ><font color="#FFFFFF"  size="4">MODIFY</th>
			<th ><font color="#FFFFFF"  size="4">DELETE</th>
			<th ><font color="#FFFFFF"  size="4">APPLY ADV</th>
		</tr>
        <%
          
           List<Commodity> clist=seller.getStore().getClist();   
           
           for(Commodity commodity :clist)
          {
        	    TopProductDao pd=new TopProductDao(con);
        	    int status=pd.getState(commodity.getProductname(),commodity.getShopname());
        	    pageContext.setAttribute("commodity", commodity);
        	    pageContext.setAttribute("status", status);
        %>
		<tr>
		<td>${commodity.productname}</td>
		<td>${commodity.price}</td>
		<td>${commodity.details}</td>
		<td><img src="${commodity.path}"></td>
		<td align="center"><input type="submit" value="modify" class="button b" onclick="javascript:window.location.href='./modify_product.jsp?productname=${commodity.productname}&shopname=${commodity.shopname}'"  ></td>
		<td align="center"><input type="submit" value="delete" class="button b" onclick="javascript:window.location.href='./deleteproduct.do?productname=${commodity.productname}&shopname=${commodity.shopname}'"  ></td>
		
		<c:choose>
        <c:when test="${status==0}">
    	<td align="center"><input type="button" value="on the top" class="button b"  disabled="true" ></td>
		</c:when>
		 <c:when test="${status==1 }">
    	<td align="center"><input type="button" value="checking" class="button b" disabled="true"></td>
		</c:when>
		 <c:when test="${status==2}">
    	<td align="center"><input type="button" value="apply" class="button b" onclick="javascript:window.location.href='./manageadv.do?productname=${commodity.productname}&shopname=${commodity.shopname}&state=2'"  ></td>
		</c:when>
		
		</c:choose>
		</tr>
		<%} %>
       
			
		
		</table>
	
	
	



 </body>
