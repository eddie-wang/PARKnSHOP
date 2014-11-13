<%@ page import="com.parknshop.dao.* , com.parknshop.model.* , java.util.* , java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> product information </title>
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <style>
  #mytable2{
   border-top:1px dotted #C0C0C0;
   border-bottom:1px dotted #C0C0C0;
  }


  #mytable {
   border:1px solid #C1DAD7;
  }
  #mytable td{
  border:none;
  }
  #sd{
  background-color:#1B3F94;
  }
  #mytable1 {
   <!-- border:3px solid #C1DAD7; -->
   border:0;
  }
  #mytable1 td{
  border-bottom:1px solid #C1DAD7;
  }
  hr{border:10px solid #1B3F94;}
  
  #mtable {
  border:1px solid #0000CD;
  background-color: #0000CD;
  height:30px;
  width:500px;
  }
  #mtable td{
   border:none;
   }
  #text{
  height:20px;
  width:400px;
  font: bold 18px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
  }
  #button1{
  height:30px;
  width:100px;
  background: #0000CD;
  border-color:#0000CD;
  color:white;
  font:18px/100% Arial, Helvetica, sans-serif;
  }
  #button1:hover { 
  text-decoration: none;
  background:#007FFF;
  } 
  #button1:active { 
  position: relative; 
  top: 1px;
  background:#0000FF;
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
   width:80px;
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

  </style>
  <script type="text/javascript">
  
 
 function buynow() {

  var opval=document.getElementById("quantity").value;
  <c:if test="${customer!=null}">
  location.href="order_submit.jsp?quantity="+opval;
  </c:if>
  <c:if test="${customer==null}">
  location.href="../administer&public/login.jsp";
  </c:if>
 }
 
 function addtocart(){
  
	 var opval=document.getElementById("quantity").value;

	 location.href="addtocart.do?quantity="+opval;	 
 }
 
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

 <body background="images/back.jpg">
 <b>
	<table border=0>
	<tr height="10px" valign=top align=center>
	<td width="900px" >&nbsp;</td>
	<td width="100px" ><a href="index.jsp" style="text-decoration:none;">Home_page</a></td>
	<td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="personal_center.jsp" style="text-decoration:none;">Personal_center</a></td>
	<td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../customer/My-cart.jsp" style="text-decoration:none;">Shopping_cart</a></td>
	<td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../customer/Favorites.jsp" style="text-decoration:none;">Favorites</a></td>
	</table>
  <% 
     CommodityDao cd=new CommodityDao((Connection)application.getAttribute("datesource"));
     System.out.println(request.getParameter("productname")+request.getParameter("shopname"));
     Commodity commodity=cd.getCommodity(request.getParameter("productname"),request.getParameter("shopname"));
     System.out.println(commodity.getDetails());
     session.setAttribute("commodity", commodity);
     CommentDao comd=new CommentDao((Connection)application.getAttribute("datesource"));
     List<String> clist=comd.getCommodity(commodity.getProductname(), commodity.getShopname());
     pageContext.setAttribute("clist", clist);
  %>
	<hr />
	<table border=0>
	<tr height="20px"><td><table>
	<tr height="20px">
	<td width="350px">&nbsp;</td>
	<td width="100px" style="border-left-color:black; border-left-style:dotted;">${commodity.productname}</td>
	<td width="100px" style="border-left-color:black; border-left-style:dotted;">Evaluate:<br><font color="red">4.8<font></td>
	<td width="100px">&nbsp;</td>
	<td width="500px"><table id="mtable">
	<tr>
       <td width="400px"><input type="text" id="text" placeholder="search here..." /></td>
       <td width="100px"><a href="search.jsp"><input  type="submit" value="Search" id="button1"></a></td>
    </tr>
	</table></td>
	</tr>
	</table></td></tr>
	<tr><td><table>
	<tr><td width="100px"></td><td><table id="mytable">
  <td><img src="${commodity.path}"></td>
	<td width="600px">
	
	<table>
	<tr height="50px"><td width="600px">${commodity.productname}<br>
	                                    <font color=#A0A0A0>${commodity.details}</font></td></tr>
	<tr height="50px"><td>Price:    <font color="red" size="4">$ ${commodity.price}</font></td></tr>
	<tr height="100px"><td><table id="mytable2">
	<tr><td width="200px"> ${commodity.salevolume} <br/><br/>sales volume</td><td width="200px"><%=clist.size()%><br/><br/>total comments</td></tr>
	</table></td></tr>
	<tr height="50px"><td>
	<table border=0><tr class="quantity"><td width="50px">Quantity:</td>         
                              <td><input type="button" value="-" class="dow" data-act="minus"></td>
                                <td><input class="quantity-value" type="text"  value="1" id="quantity" name="quantity" style="height:20px;width:40px;font-size:18px;text-align:center;"></td>
                                <td><input type="button" value="+" class="dow" data-act="add"></td>
                                <td width="100px"></td>
				<td>${commodity.stock} pieces remaining</td></tr></table></td></tr>
	<tr height="100px"><td width="600px"><table><tr><td width="200px"><input class="button b" type="button" value="Buy now" style="width:100px;height:30px" onclick="javascrtpt:window.location.href='javascript:buynow()'"></td>
		    <td width="200px"><input class="button b" type="button" value="Add to cart" style="width:100px;height:30px" onclick="javascrtpt:window.location.href='javascript:addtocart()'"> </td>
			<td width="200px"><input class="button b" type="button" value="Collect" style="width:100px;height:30px"  onclick="javascrtpt:window.location.href='./addFavorite.do'"></td></tr></table></td></tr>
	</table></td>
	</table></td></tr>
	</table></td></tr>
	<tr><td><table>
	<tr><td width="100px"></td><td><table border=1 id="mytable">
	<tr height="50px"><td width="1060px" id="sd"><font size="5" color="white">Product Information</font></td></tr>
	<tr height="20px"><td width="1060px">${commodity.details}</td></tr>
	<tr height="100px"></tr>
	</table></td></tr>
    </table></td></tr>
	<tr><td><table>
	<tr><td width="100px"></td><td><table id="mytable1">
	<tr height="50px"><td width="1060px" id="sd"><font size="5" color="white">Product Comments</font></td></tr>
	<c:forEach var="comment" items="${clist}">
	<tr height="50px"><td>${comment}</td></tr>
	</c:forEach>
	</table></td></tr>
    </table></td></tr>
	 
	</table>
	
	 <script>
  var quantityCtrl = document.querySelector('.quantity');
  quantityCtrl.onclick = function(e){
    var aim = e.target;
    var act = aim.getAttribute('data-act');
    var number = e.target.parentNode.parentNode.querySelector('.quantity-value');
    switch(act){
      case 'add':
        number.value++;
      break;
      case 'minus':
        if(number.value<=1){alert('at least one');break;}
        number.value--;
      break;
      default:
      break;
    }
  }
  </script>
 </body>
</html>
