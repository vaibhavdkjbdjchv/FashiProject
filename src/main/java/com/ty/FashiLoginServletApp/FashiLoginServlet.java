package com.ty.FashiLoginServletApp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ty.fashiCart.Dao.User_Cart_Dao;

@WebServlet ("/fashisignup")
public class FashiLoginServlet extends HttpServlet
{
	static Connection con = null;
	static PreparedStatement pstmt = null;
	static String fqcn = "com.mysql.jdbc.Driver";
	static String url = "jdbc:mysql://localhost:3306?user=root&password=root";
	static Scanner sc = new Scanner(System.in);
	static int id = 0;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		String gender = req.getParameter("gender");
		String username = req.getParameter("username");
		
		ToAdd(name,password,gender,username,req,resp);	
//		ToRemove();
		
	}
	
	public static void ToAdd(String name, String password,String gender, String username, HttpServletRequest req, HttpServletResponse resp)
	{
		id = 0;
		
		try 
		{
			Class.forName(fqcn);
			
			con = DriverManager.getConnection(url);
			
			pstmt = con.prepareStatement("select id from fashidb.fashilogindetails ");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				id = rs.getInt(1);
			}
			id++;
			pstmt = con.prepareStatement("insert into fashidb.fashilogindetails values (?, ?, ?, ?, ?)");
			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, gender);
			pstmt.setString(4, username);
			pstmt.setString(5, password);
			pstmt.executeUpdate();
			
			PrintWriter pw = resp.getWriter();
			pw.print("<script>setTimeout(e=>{window.alert(\"Account Created Successful\")},0)</script>");
			User_Cart_Dao dao = new User_Cart_Dao();
			dao.saveUser(username);
			RequestDispatcher rd = req.getRequestDispatcher("FashiLogin.html");
			rd.forward(req, resp);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			if(pstmt != null ||con != null)
			{
				try 
				{
					pstmt.close();
					System.out.println("PreparedStement closed");
					con.close();
					System.out.println("Connection closed");
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
			}
		}
	}
	public static void ToRemove() 
	{
		try 
		{
			Class.forName(fqcn);
			
			con = DriverManager.getConnection(url);
			
			pstmt = con.prepareStatement("delete from fashidb.fashilogintable where id = ?");
			pstmt.setInt(1, --id);
		
			pstmt.executeUpdate();
		} 
		catch (Exception e) {
			
			e.printStackTrace();
		}
		finally 
		{
			if(pstmt != null ||con != null)
			{
				try 
				{
					pstmt.close();
					System.out.println("PreparedStement closed");
					con.close();
					System.out.println("Connection closed");
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
			}
		}
	}
}
