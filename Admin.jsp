<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Get Details</title>
</head>
<body background="images\background.png">
	<%
	
	Class.forName("oracle.jdbc.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "nidhi", "password");
	String query="select Product_id,Store_id,Cost from approve_table where diff<5";

	PreparedStatement statement = conn.prepareStatement(query) ;
	ResultSet resultset = statement.executeQuery() ;
	%>	
	<TABLE BORDER="1">
    <TR>
        <TH>Product ID</TH>
        <TH>Store ID</TH>
        <TH>Cost</TH>
        <TH>Approve/Disapprove</TH>
    </TR>
    <% while(resultset.next()){ %>
    <TR>
        <TD id="pid"> <%= resultset.getInt(1) %></td>
        <TD id="sid"> <%= resultset.getInt(2) %></TD>
        <TD> <%= resultset.getInt(3) %></TD>
        <TD><INPUT type="radio" name="approved" onclick="clicked()"></INPUT> </TD>
    </TR>
    <% } %>
</TABLE>
	
	<script type="text/javascript">
	function clicked() {
		alert("Order Approved");
		/* String pid=document.getElementById("pid").value;
		int p=Integer.parseInt(pid);
		String sid=document.getElementById("sid").value;
		int s=Integer.parseInt(sid);
		System.out.println("s"+s+"p"+p);
		Class.forName("oracle.jdbc.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection conn = DriverManager.getConnection(url, "nidhi", "password");
		String query="update order_details set approve='yes' where store_id=? and product_id=?";
		PreparedStatement statement = conn.prepareStatement(query) ;
		statement.setInt(1,s);
		statement.setInt(2,p);
		statement.executeUpdate() ;
		System.out.println("done"); */
	}

	</script>
	<br>
	<a href="Admin1.html">Logout</a><br>
</body>
</html>