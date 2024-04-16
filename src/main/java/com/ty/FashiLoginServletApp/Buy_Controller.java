package com.ty.FashiLoginServletApp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Buy")
public class Buy_Controller extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		if(MainServer.login)
		{
		String input = req.getParameter("purchasebutt");
//		System.out.println(input);
		
		RequestDispatcher rd = req.getRequestDispatcher("DynamicBuyPage.jsp");
		
		req.setAttribute("username", FashiLogin.nm);
		req.setAttribute("userid", MainServer.user);
		req.setAttribute("productid", input);
		
		rd.forward(req, resp);
		}
		else {
			RequestDispatcher rd = req.getRequestDispatcher("FashiLogin.html");
			rd.forward(req, resp);
		}
	}
}
