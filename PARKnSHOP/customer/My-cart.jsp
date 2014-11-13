<%@ page import="com.parknshop.dao.* , com.parknshop.model.* , java.util.*,java.sql.* ,java.net.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> Settlement</title>
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">

<style type="text/css">

/* CSS Document */
body
{
background:url(back.jpg);
font: bold 18px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
}

#mytable
{
 font: bold 20px "Microsoft YaHei" ! important;
}
#mytable2 {
border:3px solid #C1DAD7;
background-color: #ECFFFF;
}
#mytable2 td{
border:none;
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
#mytable3 {
border:1px solid #0000CD;
background-color: #0000CD;
height:30px;
width:500px;
}
#mytable3 td{
border:none;
}
#text{
height:20px;
width:400px;
font: bold 18px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
}
#button3{
height:30px;
width:100px;
background: #0000CD;
border-color:#0000CD;
color:white;
font:18px/100% Arial, Helvetica, sans-serif; ;
}
#button3:hover { 
text-decoration: none;
background:#007FFF;
} 
#button3:active { 
position: relative; 
top: 1px;
background:#0000FF;
}
hr{border:10px solid #0000CD;}


.dow{
width:20px;
height:25px; 
text-align:center; 
font-family:Arial, Helvetica, sans-serif;; 
font-weight:bold; 
font-size:15px; 
background:#FFFFFF;
color:#000000; 
text-decoration:none; 
border: 3px solid #FFFFFF; 
cursor:pointer;
} 

.dow:hover{background:#FFFFFF;} 

.dow:active{background:#FFFFFF;}

</style>

<script type="text/javascript">
function postData(){
var myForm = document.createElement("form");
myForm.method = "post";
myForm.action = "handleshopcart.do";
var checkbox=document.getElementsByName("checkbox");
var productname=document.getElementsByName("productname");
var shopname=document.getElementsByName("shopname");
var quantity=document.getElementsByName("quantity");
var price=document.getElementsByName("price");
var i;
var ifcheck=false;
for (i=0;i<checkbox.length;i++) {
var myInput = document.createElement("input");
var myInput2 = document.createElement("input");
var myInput3=document.createElement("input");
var myInput4=document.createElement("input");
if(checkbox[i].checked)
{   ifcheck=true;
	myInput.type = "text";
    myInput.name="productname";
    myInput.value=productname[i].value;
    myForm.appendChild(myInput);
    myInput2.type="text";
    myInput2.name="shopname";
    myInput2.value=shopname[i].value;
    myForm.appendChild(myInput2);
    myInput3.type="text";
    myInput3.name="quantity";
    myInput3.value=quantity[i].value;
    myForm.appendChild(myInput3);
    myInput4.type="text";
    myInput4.name="price";
    myInput4.value=price[i].value;
    myForm.appendChild(myInput4);
    
}
}
document.body.appendChild(myForm);
if(ifcheck)
myForm.submit();
else
	alert("you have not choose any");
document.body.removeChild(myForm);
}

</script>

 </head>


 <body >
  <table border=0>
  <tr height="20px" valign=top align=center>
  <td width="900px" colspan=9>&nbsp;</td>
  <td width="100px" ><a href="../public/index.jsp" style="text-decoration:none">Home page</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../public/personal_center.jsp"  style="text-decoration:none">Personal center</a></td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;">Shopping cart</td>
  <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="Favorites.jsp"  style="text-decoration:none">Favorites</a></td>
  <!-- <td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../seller/check_store.html"  style="text-decoration:none">Sellers_center</a></td> -->
  </tr>
  </table>
  <hr />
  
<table border=0>
  <tr   valign=top align=center>
  <td width="400px"  >&nbsp;</td>
  <td width="300px" valign=top align=center><Font Size="6">Shopping Cart</Font></td>
  <td width="500px" valign=top align=center> 
  <table id="mytable3">
 <tr>
 <td width="400px"><input type="text" id="text" placeholder="search here..." /></td>
 <td width="100px"><a href="../public/search.jsp"><input  type="submit" value="Search" id="button3"></a></td>
 </tr>
 </table></td>
  </tr>
  <tr height="20px" >&nbsp;</tr>
</table >

<table border=0>
<tr>
<td width="100px">&nbsp;</td>
<td width="1200px">



<table border=0>

<tr width="1200px" height="50px"  >
<td>
<table border=0 id="mytable">
<tr height="50px" valign=center align=center>
<td width="200px"><input id="selectAll" type="checkbox" name="checkboxs" value ="apple" >Select all</td>
<td width="200px">Photo</td>
<td width="200px">Product name</td>
<td width="200px">Unit Price</td>
<td width="200px">number</td>
<td width="200px">Price</td>
<td width="200px">&nbsp;</td>
</tr>
</table>
</td>
</tr>

<%
   Customer customer=(Customer)session.getAttribute("customer");

if(customer==null)
{   response.sendRedirect("../administer&public/login.jsp");
    return;
}	
   Connection con=(Connection)application.getAttribute("datesource");
   ShopcartDao scd=new ShopcartDao(con);
   List<Shopcart> sclist=scd.getShopcartList(customer.getUserNameC());
   System.out.println("aaaaa");
   pageContext.setAttribute("sclist",sclist);
   CommodityDao cd=new CommodityDao(con);
   System.out.println("bbbbb");
   for(Shopcart shopcart:sclist)
   {
	   System.out.println("cccccc");
	   Commodity commodity=cd.getCommodity(shopcart.getProductname(), shopcart.getStorename());
	   if(commodity==null)
		   continue;
	   double price=commodity.getPrice();
	   String path=commodity.getPath();
	  
%>

<tr width="1200px" height="50px">
<td>
<table id="mytable2" border=0 >
<tr height="50px" valign=center align=center >
<td width="200px"><input type="checkbox" class="subCheck" name="checkbox"></td>
<td width="200px"><img src="<%=path%>" style="height:40px;"/></td>
<td width="200px"><%=shopcart.getProductname() %></td>
<td><input type="hidden" name="productname" value="<%=shopcart.getProductname()%>"></td>
<td><input type="hidden" name="shopname" value="<%=shopcart.getStorename()%>"></td>
<td><input type="hidden" name="price" value="<%=price%>"></td>
<td width="200px" class="price1"><%=price%></td>
<td width="200px"><table><tr class="quantity"><td><input  type="button" data-act="minus" value="-" class="dow"/></td><td><input type="text" style="height:20px;width:40px;font-size:18px;text-align:center;"  value="<%=shopcart.getCommnum()%>" name="quantity"  class="quantity-value"/></td><td><input  type="button" data-act="add" value="+" class="dow"  /></td></tr></table></td>
<td width="200px" class="total-price"><%=price*shopcart.getCommnum()%></td>
<td width="200px"><input type="button" value="Delete" class="button b" onclick="javascript:window.location.href='./shopcartdelete.do?username=<%=URLEncoder.encode(shopcart.getUsername(),"UTF-8")%>&productname=<%=URLEncoder.encode(shopcart.getProductname(),"UTF-8")%>&storename=<%=URLEncoder.encode(shopcart.getStorename(),"UTF-8")%>'"/></td>
</tr>
</table>
</td>
</tr>

<tr width="1200px" height="10px" ><td><table><tr height="10px"></tr></table></td></tr>
<%
   }
%>

<tr width="1200px" height="50px">
<td>
<table border=0 >
<tr height="50px" valign=center align=center>
<td width="200px">&nbsp;</td>
<td width="200px">&nbsp;</td>
<td width="200px">&nbsp;</td>
<td width="200px">&nbsp;</td>
<td width="200px">&nbsp;</td>
<td width="200px">&nbsp;</td>
<td width="200px"><input  type="button" value="Settlement" class="button b"  onclick="javascript:postData()"/></td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
<script>
  var selectAll = document.getElementById('selectAll');
  var subCheck = document.querySelectorAll('.subCheck');
  selectAll.onchange = function(){
    var aimValue = this.checked;
    [].forEach.call(subCheck,function(v){
      v.checked = aimValue;
    })
  }
  
  var quantityCtrl = document.querySelectorAll('.quantity');
  [].forEach.call(quantityCtrl,function(dom){
    dom.onclick = function(e){
      var aim = e.target;
      var act = aim.getAttribute('data-act');
      var number = e.target.parentNode.parentNode.querySelector('.quantity-value');

      var ancestor = e.target.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode;
      var price1 = ancestor.querySelector('.price1');
      var totalPrice = ancestor.querySelector('.total-price');

      switch(act){
        case 'add':
          number.value++;
          totalPrice.innerText = parseFloat(price1.innerText)*100*(number.value)/100;
        break;
        case 'minus':
          if(number.value<=1){alert('at least one');break;}
          number.value--;
          totalPrice.innerText = parseFloat(price1.innerText)*100*(number.value)/100;
        break;
        default:
        break;
      }
    }
  })

</script>

 </body>
</html>









