<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> payment center </title>
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <script type="text/javascript">
  function show_confirm()
  {
  var r=confirm("Confirm payment?");
  if(r==true)
  {
   alert("pay for it!");
  }
  else{
   alert("cancel it!")
  }
  location.href="pay.do";
  }
  </script>
 </head>
<style type="text/css">
/* CSS Document */
body
{
background:url(images/back.jpg);
}
hr{border:10px solid #1B3F94;}
#mytable1 {
border:0;
background-color: #b1d6f1;
}
#mytable1 td{
border:none;
}
#mytable2{
border:3px solid #b1d6f1;
width:1100px;
height:70px;
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
width:200px;
height:40px;
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

 <body>
  <body >
  <table border=0>
	<tr height="10px" valign=top align=center>
	<td width="900px" >&nbsp;</td>
	<td width="100px" ><a href="index.jsp" style="text-decoration:none;">Home page</a></td>
	<td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="personal_center.jsp" style="text-decoration:none;">Personal center</a></td>
	<td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../customer/My-cart.jsp" style="text-decoration:none;">Shopping cart</a></td>
	<td width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:1px;"><a href="../customer/Favorites.jsp" style="text-decoration:none;">Favorites</a></td>
	</table>
  <hr id="h" />

  <table border=0>
   <tr   valign=top align=center >
  <td width="400px"  >&nbsp;</td>
  <td width="300px" valign=top align=right><Font Size="6">Payment center</Font></td>
  <td  valign=bottom align=left width="100px" style="border-left-color:black; border-left-style:solid; border-left-width:3px;" ><Font size="4">My cashier</Font></td>
  </tr>
  <tr height="10px">&nbsp;</tr>
  </table>

  <table >
  <tr >
  <td width="100px">&nbsp;</td>
  <td>
  <table id="mytable1" height="70px">
  <tr>
  <td width="800px" valign=center align=center>productname:${order.productname}</td>
  <td width="300px" valign=center align=right><font color="Red">Money need to pay:${order.price*order.commnum}</font><td>
  </tr>
  </table>
  </td>
  </tr>
  <tr height="10px">&nbsp;</tr>
  <tr>


  <table border=0>
  <tr>
  <td width="100px">&nbsp;</td>
  <td><table id="mytable2"> 
  <tr>
  <td>
    <input type="checkbox" name="way1" value="c1" >Cash On Delivery</td></tr>
  </table></td></tr>

  <tr>
  <td width="100px">&nbsp;</td>
  <td>
  <table id="mytable2">
  <tr>
  <td>
    <input type="checkbox" name="wa2" value="c2" >Pay online</td></tr>


  <tr>
  <td width="200px">&nbsp;</td>
  <td> <input type="radio" name="bank" value="b1" /> <img src="images/23.jpg" style="height:40px;"/></td>
  <td width="50px">&nbsp;</td>
   <td> <input type="radio" name="bank" value="b2" /> <img src="images/24.jpg" style="height:40px;"/></td>
 <td width="50px">&nbsp;</td>
   <td> <input type="radio" name="bank" value="b3" /> <img src="images/25.jpg" style="height:40px;"/></td>
  </tr>
  <tr>
  <td width="200px">&nbsp;</td>
  <td> <input type="radio" name="bank" value="b4" /> <img src="images/26.jpg" style="height:40px;"/></td>
 <td width="50px">&nbsp;</td>
   <td> <input type="radio" name="bank" value="b5" /> <img src="images/27.jpg" style="height:40px;"/></td>
 <td width="50px">&nbsp;</td>
   <td> <input type="radio" name="bank" value="b6" /> <img src="images/28.jpg" style="height:40px;"/></td>
  </tr>
  </table>
  </td>
  </tr>
  <!-- </table>

  <table> -->

  </table>

  <table>
  <tr height="20px">&nbsp;</tr>
  <tr>
  <td width="100px">&nbsp;</td><td>credit card numbers:</td>
  <td><input Type="text" style="width:300px;font-size:18px;" name="mima"/></td>
  </tr>
  <tr height="30px"></tr>
  <tr>
  <td width="100px">&nbsp;</td><td>payment password:</td>
  <td><input Type="password" style="width:300px;font-size:18px;" name="mima"/></td>
  </tr>
  <tr height="30px">&nbsp;</tr>
  <tr height="40px"><td width="100px">&nbsp;</td><td width="200px">&nbsp;</td> <td width="300px">&nbsp;</td><td width="600px" align=right><input type="submit" onclick="show_confirm()" value="Confirm Payment" class="button b"  /></td></tr>
  </table>



  </tr>
  </table>






 </body>
</html>
