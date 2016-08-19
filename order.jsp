
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="test.ItemsCart"%>
<%@page import="test.Ankur"%>
<%@page import="test.Distance"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Orders</title>
</head>
<body background="images/background.png">
	<p align="center">
		<img src="images/verizon.png" width="100"
			height="100" alt="" hspace="20" /> <font size="26"> <i><b>Phone
					Next Door</b></i>
		</font> <img src="images/mobile.png" width="150"
			height="100" alt="" hspace="20" />
	</p>
	<div align="center">
		<%


    String nm1=request.getParameter("prod");
     int nm=Integer.parseInt(nm1);
     System.out.println(nm);
	//String hint=" ";
	Class.forName("oracle.jdbc.OracleDriver");
	System.out.println("forname");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "nidhi", "password");
	System.out.println("conn");
	PreparedStatement pst =conn.prepareStatement("select product_name, cost, color from product_details where product_id=?");
	pst.setInt(1,nm);
	System.out.println("ps");
	ResultSet rs=pst.executeQuery();
	System.out.println("rs");
	//int qty=Integer.parseInt(request.getParameter("quantity"));
	ItemsCart ic=null;
	while(rs.next()){
		String name=rs.getString(1);
		int cost=Integer.parseInt(rs.getString(2));
		String color=rs.getString(3);
		ic=new ItemsCart(name,nm,cost,color);
		//prod.put(nm,ic);
		System.out.println("obj");
	}
	
	int cust_id=Ankur.getUsername();
	System.out.println(cust_id);
	double clon=0,clat=0;
	PreparedStatement st = conn.prepareStatement("Select lat,longt from Customer where Cust_Id=? ") ;
			st.setInt(1, cust_id);
		    ResultSet rs1 = st.executeQuery();
		    while(rs1.next()){
			clat=rs1.getDouble(1);
			clon=rs1.getDouble(2);
			
		    }
		    conn.close();
	System.out.println("rs done");
		   
		Distance d=new Distance();
		int store=d.shortest(clon,clat);
		
	System.out.println(store+"--store");
	System.out.println(cust_id);
	System.out.println(ic.pid);
	Connection conn1 = DriverManager.getConnection(url, "nidhi", "password");
		PreparedStatement pst1 = conn1.prepareStatement("insert into order_details(cust_id,Store_Id,Product_Id,Approve)"
												+" values(?,?,?,'no')") ;
		pst1.setInt(1,cust_id);
		pst1.setInt(2,store);
		pst1.setInt(3,ic.pid);
		pst1.executeUpdate();
		System.out.println("insert done");
		
		PreparedStatement pst2= conn1.prepareStatement("update store_product set curr_qty=curr_qty-1 where store_id=? and product_id=?");
		pst2.setInt(1,store);
		pst2.setInt(2,ic.pid);
		pst2.executeUpdate();
		System.out.println("update done");
		conn1.commit();
		
		%>
<%-- 
		<TABLE BORDER="1">
			<TR>
				<TH>Product Name</TH>
				<TH>Cost</TH>
				<TH>Quantity</TH>
				<TH>Color</TH>
			</TR>
			<% while(rs.next()){ %>
			<TR>
				<TD><%= rs.getInt(1) %></td>
				<TD><%= rs.getInt(2) %></TD>
				<TD><%= rs.getInt(3) %></TD>
				<TD></TD>
			</TR>
 --%>		
		<input type="submit" name="back" onclick="location.href='User.jsp'"
			value="Add more items"> <input type="submit" name="submit"
			onclick="location.href='submit.jsp'" value="CheckOut">

	</div>

</body>
</html>

