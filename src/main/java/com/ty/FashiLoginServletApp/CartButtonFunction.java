package com.ty.FashiLoginServletApp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CartButtonFunction")
public class CartButtonFunction extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		if (MainServer.login) 
		{
			RequestDispatcher rd = req.getRequestDispatcher("DynamicCartPage.jsp");
			req.setAttribute("proId", FashiLogin.nm);
			req.setAttribute("cartingUser", MainServer.user);
			rd.forward(req, resp);
		}
		else 
		{
			RequestDispatcher rd = req.getRequestDispatcher("FashiLogin.html");
			rd.forward(req, resp);
		}
	}
}
