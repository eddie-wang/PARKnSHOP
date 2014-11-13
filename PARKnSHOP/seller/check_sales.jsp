<%@ page import="com.parknshop.dao.* , com.parknshop.model.* , java.util.* ,java.sql.*,java.text.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="13111049_lijingyue">
  <meta name="Keywords" content="【查看销量】">
  <meta name="Description" content="【卖家查看店铺商品销量】">
 
  
  <title>check_sales</title>
 </head>
<style type="text/css">
/* CSS Document */


hr{border:10px solid #0000CD;}


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
 margin-left:1.5cm;
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

.seave{
		position: absolute;
		width: 100px;
		height: 30px;
		margin-left: 500px;
		margin-top: 10px;
		left: 20px;
		cursor: pointer;
		background-color: #b1d6f1;
		border: 0;
		color: #1B3F94;
		font: bold 20px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
} 
.btn {
	width: 100px;
	height: 30px;
	margin-top: 10px;
	left: 20px;
	cursor: pointer;
	background-color: #b1d6f1;
	border: 0;
	color: #1B3F94;
	font: bold 20px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
}
#seave{
			position: absolute;
		width: 100px;
		height: 30px;
		margin-left: 1150px;
		margin-top: 10px;
		left: 20px;
		cursor: pointer;
		background-color: #b1d6f1;
		border: 0;
		color: #1B3F94;
		font: bold 20px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
}
.textInput{
		padding-left: 20px;
		margin-bottom: 20px;
		width: 250px;
		height: 40px;		
		background-color: #b1d6f1;
		border: 0;
		color:blue;
		border-radius: 2px;
		}
label{color: #1B3F94;}
 #body{
 	width:500px;
 	margin-left: 170px;
 }
#shop_table{
top:0;
position: absolute;
margin-left: 500px;
margin-top: 60px;
width:300px;
}
#shop_table td{
	font: bold 20px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	text-align: center;
	width: 200px;
	height: 40px;
	border-width: 5px;
}
#shop_table form{
	/*border: 1px dotted black;*/
}

#shop_table tr>td:nth-child(2n){
	background-color:  #B1D6F1;
	border-radius: 3px;
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
  <hr />




<table >

<tr>
	<td><table width="100" height="100"></table></td>
	<td></td>
	<td></td>
</tr>

<tr>





	<td><table id="mytable2">
			<tr>
			<td><a href="../seller/check_orders.jsp" style="text-decoration:none">check orders</td>
			</tr>
			<tr>
			<td><a href="../seller/check_store.jsp" style="text-decoration:none">check store product</td>
			</tr>
			<tr>
			<td>check sales</td>
			</tr>
		</table>
	</td>


	<td>
		<table cellspacing="60" align="right"  id="mytable">
		
		<tr>
			<th ><font color="#FFFFFF" size="5">product name</th>
			<th ><font color="#FFFFFF"  size="5">total sale</th>
			<th ><font color="#FFFFFF"  size="5">total price</th>
			
		</tr>
		<% 
		   Seller seller=(Seller)session.getAttribute("seller");
		   List<Commodity> clist=seller.getStore().getClist();
		   pageContext.setAttribute("clist", clist);
		   double sale=0.0;
			  String start=request.getParameter("start");
			  String end=request.getParameter("end");
			  if(start==null&&end==null)
			  {
				  start="2014-01-01";
				  
			  }
			  java.util.Date dstart=new java.util.Date();
			  java.util.Date dend=new java.util.Date();
			  Connection con=(Connection)getServletContext().getAttribute("datesource");
			  OrderDao od=new OrderDao(con);
		      try{
		          dstart= new SimpleDateFormat("yyyy-MM-dd").parse(start);
		          if(end!=null)
		          dend=new SimpleDateFormat("yyyy-MM-dd").parse(end);
		          List<Order> olist=od.getOrderbyshop(seller.getStore().getShopname());
		          System.out.println(olist.size());
		          sale=Fun.commission(dstart, dend, olist );
		      }
		      catch(Exception e){
		          e.printStackTrace();
		      }
			  
		%>
		<c:forEach var="commodity" items="${clist}">
		<tr>
		<td align="center" >${commodity.productname}</td>
		<td align="center">${commodity.salevolume}</td>
		<td align="center">${commodity.salevolume*commodity.price}</td>
		</tr>
		</c:forEach>
		
	</table>
	</table>
	
	<form action="check_sales.jsp" method="get">
     <div id="body" style="text-align:center;margin-top:60px;position:relative;">
			<label id="label_name">Start time</label>
			<input type="date" class="textInput" name="start"><br>
			<label id="label_password">End time</label>
			<input type="date" class="textInput" name="end" ><br>
		<input type="submit" value="caculate" class="btn">
		
     <table id="shop_table">
			<tbody><tr>
				<td>Totalsales:</td>
				<td><%=sale %></td>
			</tr>
		</tbody>
</table>
</div>
</form>	
	

 </body>
