package com.ty.FashiLoginServletApp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet ("/prodservlet")
//public class ProductServlet extends HttpServlet
//{
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
//			throws ServletException, IOException 
//	{
//		PrintWriter pw = resp.getWriter();
//		String product = req.getParameter("productSelected");
//		
//		if (FashiLogin.login) 
//		{
//			RequestDispatcher rd = req.getRequestDispatcher("DynamicProductPage.jsp");
//			String s = "<button style=\"display: flex; justify-content: left;"
//					+ " position: absolute; right: 0; align-items: center; "
//					+ "padding: 15px; width: 147px; border:none; background-color: white;"
//					+ " height: 50px;\"><i class=\"fa-solid fa-image-user\" "
//					+ "style=\"font-size: 20px; margin-right: 10px;\"></i>"
//					+ FashiLogin.nm +"</button>";
//			req.setAttribute("loginflag", FashiLogin.login );//			req.setAttribute("username", FashiLogin.nm );//			rd.forward(req, resp);
//		}
//		else 
//		{
//			RequestDispatcher rd = req.getRequestDispatcher("FashiLogin.html");
//			rd.forward(req, resp);
//		}
//	}
//}
