package com.ty.FashiLoginServletApp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CartToPayment")
public class Cart_To_Payment_Page extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String input = req.getParameter("pricetopaymentmethod");
		
		RequestDispatcher rd = req.getRequestDispatcher("DynamicPaymentPage.jsp");
		
		req.setAttribute("username", FashiLogin.nm);
		req.setAttribute("userid", MainServer.user);
		req.setAttribute("productprice", input);
		
		rd.forward(req, resp);
		
		
	}
}
