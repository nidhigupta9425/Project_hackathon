<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="images/background.png">
<br>
<br>
<br>
<p align="center"><img src="images/verizon.png" width="100" height="100" alt="" hspace="20" />
<font size="26"> <i><b>Phone Next Door</b></i> </font>
<img src="images/mobile.png" width="150" height="100" alt="" hspace="20" />
</p>
	<form action="order.jsp" method="post">
		<h1>Welcome </h1>
		SEARCH:<input type="search" name="googlesearch">
		<input type="button" value="go" onclick="location.href = 'https://www.google.com';">
		<br><br>
		
		
		<div align="right">
		<input type="button" name="logout" value="LOGOUT" onclick="location.href='login.html'" ></div><br>
		<table>
		<tr>FILTERS:</tr> 
		
		
		<br>
		<tr><td>Cost:<td><input type="radio" name="cost" value="below" checked onclick=""> Below 25000</td><br>
  				<tr><td><td><input type="radio" name="cost" value="between" onclick=""> Above 25000</td></tr></tr>
		<td>Colour:<td><input type="radio" name="colours" value="white" checked onclick=""> White<br>
  				<tr><td><td><input type="radio" name="colours" value="gold" onclick=""> Gold<br>
  			</table>	
		<br>
		<table>
		<tr><td>
		<input type="image" id="myimage" style="height:200px;width:200px;" src="https://www.smashteckphones.ie/images/product/iPhone_6S_silver.jpg"/>
		<label>Iphone 6s White</label><br>
		<input type="submit" id="1" name="prod" value="103" >
		
		<td>
		<input type="image" id="myimage" style="height:200px;width:200px;" src="http://brain-images.cdn.dixons.com/9/4/10138649/u_10138649.jpg"/>	
		<label>Iphone 6s Gold</label><br>
		<input type="submit" id="2" value="102" name="prod"  >	
		</tr>
		<br>
		<br>
		<tr><td>
		<input type="image" id="myimage" style="height:200px;width:200px;" src="http://cdn2.gsmarena.com/vv/pics/samsung/-samsung-galaxy-note-3-neo-1.jpg" />
		<label>Samsung Note 3</label><br>
		<input type="submit" id="3" value="101" name="prod">
		
		<td>
		<input type="image" id="myimage" style="height:200px;width:200px;" src="http://cdn2.gsmarena.com/vv/pics/apple/apple-iphone-6-1.jpg">
		<label>Iphone 6</label><br>
		<input type="submit" id="4" value="104" name="prod">
		
		</table>
		
	</form><br>
	<br>
	<footer>
	<label hspace="20" style="text-align:right" name="cid"><%= request.getParameter("username") %></label>

	</footer>
	<br>
	
</body>
</html>