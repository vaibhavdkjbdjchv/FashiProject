package com.ty.FashiLoginServletApp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/AddProductServlet")
public class AddProduct extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String fqcn = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306?user=root&password=root";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int i = 1;
		String protype = req.getParameter("protype");
		protype = protype.toLowerCase();
		
		String gender = req.getParameter("gender");
		gender = gender.toLowerCase();
		
		String proname = req.getParameter("proname");
		proname = proname.toLowerCase();
		
		String propara = req.getParameter("propara");
		propara = propara.toLowerCase();
		
		String prodiscount = req.getParameter("prodiscount");
		prodiscount = prodiscount.toLowerCase();
		
		String proprice = req.getParameter("proprice");
		proprice = proprice.toLowerCase();
		
		String prodesc = req.getParameter("prodesc");
		prodesc = prodesc.toLowerCase();
		
		String proimg = req.getParameter("proimg");
		proimg = proimg.toLowerCase();
//		
		String procolour = req.getParameter("procolour");
		procolour = procolour.toLowerCase();
//		
		String proquantity = req.getParameter("proquantity");
		proquantity = proquantity.toLowerCase();
//		
		try 
		{
			Class.forName(fqcn);
			
			con = DriverManager.getConnection(url);
			
			pstmt = con.prepareStatement("select * from fashidb.products_details");
			rs = pstmt.executeQuery();
			while (rs.next()) 
			{
				i++;
			}
			String proid = req.getParameter("gender").substring(0,2) + protype + req.getParameter("proname").hashCode() + i;
			
			pstmt = con.prepareStatement("insert into fashidb.products_details values (?,?,?,?,?,?,?,?,?,?) ");
			pstmt.setInt(1, i);
			pstmt.setString(2, proid);
			pstmt.setString(3, protype);
			pstmt.setString(4, proname);
			pstmt.setString(5, propara);
			pstmt.setString(6, prodiscount);
			pstmt.setString(7, proprice);
			pstmt.setString(8, prodesc);
			pstmt.setString(9, proimg);
			pstmt.setString(10, gender);
//			pstmt.setString(11, procolour);
//			pstmt.setString(12, proquantity);
			
			pstmt.executeUpdate();
			
			PrintWriter pw = resp.getWriter();
			pw.print("<button style=\"display: flex; justify-content: left;"
					+ " position: absolute; right: 0; align-items: center; "
					+ "padding: 15px; width: 147px; border:none; background-color: white;"
					+ " height: 50px;\"><i class=\"fa-solid fa-image-user\" "
					+ "style=\"font-size: 20px; margin-right: 10px;\"></i>"
					+ "</button>");
			RequestDispatcher rd = req.getRequestDispatcher("Fashi.jsp");
			rd.include(req, resp);
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			if (con != null || pstmt != null || rs != null) {
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
	}
}
