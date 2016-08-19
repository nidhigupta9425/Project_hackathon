package test;

import java.io.IOException;
import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.Driver;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.Statement;




import javax.servlet.RequestDispatcher;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class validationServlet
 */
public class Validate1 extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		//String message=null;
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		int uname=Integer.parseInt(username);
		Ankur ank=new Ankur();
		String pswd=ank.encrypt(password);
		ank.setUsername(uname);
		if(ank.valid()==true){
		RequestDispatcher rd=request.getRequestDispatcher("User.jsp");
		rd.forward(request, response);	
		}
		else
			out.println("not found");
	}


		

	}
