package com.ty.FashiLoginServletApp;

import java.io.*;
import java.sql.*;
import java.util.Scanner;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/fashi")
public class FashiLogin extends HttpServlet
{
	static String nm = null;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String fqcn = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306?user=root&password=root";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		PrintWriter pw = resp.getWriter();
		// Scanner sc = new Scanner(System.in);
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		try 
		{
			Class.forName(fqcn);
			
			con = DriverManager.getConnection(url);
			
			pstmt = con.prepareStatement("select * from fashidb.fashilogindetails where username = ? or password = ? ");
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			String un = null;
			String ps = null;
			
			while (rs.next()) 
			{
			    un = rs.getString(4);
			    ps = rs.getString(5);
			    nm = rs.getString(2);
			}
			
			if (username.equals(un) && password.equals(ps))
			{
//				pw.print("<button style=\"display: flex; justify-content: left;"
//						+ " position: absolute; right: 0; align-items: center; "
//						+ "padding: 15px; width: 147px; border:none; background-color: white;"
//						+ " height: 50px;\"><i class=\"fa-solid fa-image-user\" "
//						+ "style=\"font-size: 20px; margin-right: 10px;\"></i>"
//						+ nm +"</button>");
				RequestDispatcher rd = req.getRequestDispatcher("Fashi.jsp");
				
				MainServer.login = true;
				MainServer.user = un;
				req.setAttribute("loginflag", FashiLogin.nm);
				
//				String flagforJasonloginString = String.valueOf(MainServer.login);
//				
//				JSONObject object = new JSONObject();
//				JSONArray jArray = new JSONArray();
//				
//				object.put("flag", "flagforJasonloginString");
//				object.put("name", nm);
////				object.put("Pass", "12365478");
//				
//				jArray.add(object);
////				
//				try {
//					FileWriter writer = new FileWriter("json\\login.json",false);
//					writer.write(jArray.toJSONString());
//					writer.close();
//					
//				} 
//				catch (FileNotFoundException e) {
//					e.printStackTrace();
//				}
				
				rd.forward(req, resp);
			}
			else if (username.equals(un) || password.equals(ps)) 
			{
				pw.print("<script>setTimeout(e=>{window.alert(\"!!!! Invalid Credentials !!!!\")},0)</script>");
				RequestDispatcher rd = req.getRequestDispatcher("FashiLogin.html");
				rd.include(req, resp);
			}
			else 
			{
				pw.print("<script>setTimeout(e=>{window.alert(\"!!!! Create Account First !!!!\")},0)</script>");
				RequestDispatcher rd = req.getRequestDispatcher("FashiSignUp.html");
				rd.include(req, resp);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally 
		{
			if(pstmt != null || con != null)
			{
				try 
				{
					pstmt.close();
					con.close();
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
			}
		}
	}

}
