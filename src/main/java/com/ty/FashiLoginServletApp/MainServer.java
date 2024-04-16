package com.ty.FashiLoginServletApp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

import com.mysql.cj.protocol.x.ContinuousOutputStream;
import com.ty.fashiCart.Dao.User_Cart_Dao;

public class MainServer extends HttpServlet 
{
	  ArrayList FemaleGender = null; 
	  ArrayList MaleGender = null;
	  ArrayList typeOfProduct = null;
	  ServletResponse response;
	  static boolean login = false;
	  static String user = null;
	  static String un = null;
	  static User_Cart_Dao dao = new User_Cart_Dao();
	  
	  public String genderCheck(List l) 
	  {
		  String gender = null;
		  for (Object object : l) 
			 {
				 if (FemaleGender.contains(object)) 
				 {
					 gender = "female";
				 }
				 else if (MaleGender.contains(object)) 
				 {
					 gender = "male";
				 }
			}
		  return gender;
	}
	 
	  public String productTypeCheck(List l) 
	  {
		  String productType = null;
		  for (Object object : l) 
		  {
			  System.out.println(object);
			  if (typeOfProduct.contains(object)) 
			  {
				productType = productType.valueOf(object);
			}
		  }
		  return productType;
	  }
	  
	 public String createquery(String search) 
	 {
		 String createdQuery = null;
		 
		 String [] searchArray = search.split(" ");
		 List l = Arrays.asList(searchArray);
		 
		 String genderFlag = genderCheck(l);
//		 System.out.println("genderflag = " + genderFlag);
		 String proTypeFlag = productTypeCheck(l);
//		 System.out.println("proTypeFlag = " + proTypeFlag);
		 
		 if (genderFlag != null && proTypeFlag != null) 
		 {
			createdQuery = "gender = '" + genderFlag + "' and ProType like '%" + proTypeFlag + "%'";
		 }
		 else if (genderFlag != null && proTypeFlag == null) 
		 {
			createdQuery = "gender = '" + genderFlag + "' " ;
		 }
		 else if (proTypeFlag != null && genderFlag == null) 
		 {
			createdQuery = "ProType like '%" + proTypeFlag + "%'";
		 }
		 else if (genderFlag != null) 
		 {
			createdQuery = "gender = '" + genderFlag + "' ";
		 }
		 else if (proTypeFlag != null) 
		 {
			 createdQuery = "ProType like '%" + proTypeFlag + "%'";
		 }
		 
		return createdQuery;
	 }
	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException 
	{
		this.response = response;
//		run();
		String serching = request.getParameter("searched");
		serching = serching.toLowerCase();
		serching = serching.trim();
		
		String QueryToRun = null;
		if (serching.contains(" ")) 
		{
			QueryToRun = "select * from fashidb.products_details where " + createquery(serching);
			RequestDispatcher dispatcher = request.getRequestDispatcher("SerchingPage.jsp");
			request.setAttribute("query", QueryToRun);
			dispatcher.forward(request, response);
		}
		else 
		{
			if (FemaleGender.contains(serching)) 
			{
				QueryToRun = "select * from fashidb.products_details where ProId like 'fe%'";
			}
			else if (MaleGender.contains(serching)) 
			{
				QueryToRun = "select * from fashidb.products_details where ProId like 'ma%'";
			}
			else 
			{
				String AtoQ = "%"+serching+"%";
				QueryToRun = "select * from fashidb.products_details where ProType like '" + AtoQ + "' or ProName like '" + AtoQ + "' or gender like '" + AtoQ + "' or ProPara like '" + AtoQ + "' or ProImg like '" + AtoQ + "'";
			}
			System.out.println(request);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("SerchingPage.jsp");
			request.setAttribute("query", QueryToRun);
			dispatcher.forward(request, response);
		}
	}
	
	@Override
	public void init() throws ServletException 
	{
		super.init();
//		ServletRequest request;
//		static boolean loginflag = false;
		
		 MaleGender = new ArrayList();
			MaleGender.add("male");
			MaleGender.add("men");
			MaleGender.add("man");
			MaleGender.add("mans");
			MaleGender.add("gents");
			MaleGender.add("boys");
			MaleGender.add("mens");
			
		 FemaleGender = new ArrayList();
			FemaleGender.add("female");
			FemaleGender.add("women");
			FemaleGender.add("womens");
			FemaleGender.add("woman");
			FemaleGender.add("womans");
			FemaleGender.add("ladies");
			FemaleGender.add("girls");
			
		typeOfProduct = new ArrayList();
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
//			String productTypeAdding = null;
			try 
			{
				Class.forName("com.mysql.jdbc.Driver");
				
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=root");

				pstmt = con.prepareStatement("select * from fashidb.products_details");
				
				rs = pstmt.executeQuery();
				
				while (rs.next()) 
				{
					String tp = rs.getString(3);
					if (!typeOfProduct.contains(tp))
					{
						typeOfProduct.add(tp);
					}
				}
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			finally 
			{
				if(con != null || pstmt != null || rs != null)
	            {
					try 
					{
						con.close();
						pstmt.close();
						rs.close();
					} 
					catch (Exception e) 
					{
						e.printStackTrace();
					}
	            	
	            }
			}
			
			
			System.out.println(toString());
	}

//	@Override
//	public void run() 
//	{ 
//		
//		try {
//			PrintWriter writer = response.getWriter();
//			writer.print("<HTML><body><div id=\"preloader\">\r\n"
//					+ "		<img alt=\"\" src=\"./images/preloader.gif\">\r\n"
//					+ "	</div>"
//					+ "<script>\r\n"
//					+ "            	var loader = document.getElementById(\"preloader\");\r\n"
//					+ "            	\r\n"
//					+ "            	window.addEventListener(\"load\",function(){\r\n"
//					+ "            		loader.style.display = \"none\";\r\n"
//					+ "            	})\r\n"
//					+ "            </script></body></HTML>");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//	}
	
}
