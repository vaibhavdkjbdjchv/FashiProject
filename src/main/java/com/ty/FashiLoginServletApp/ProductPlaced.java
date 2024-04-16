package com.ty.FashiLoginServletApp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProductPlaced")
public class ProductPlaced extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		PrintWriter pWriter = resp.getWriter();
		pWriter.print("<script>setTimeout(e=>{window.alert(\"Product Placed Successfully\")},0)</script>");
		RequestDispatcher rd = req.getRequestDispatcher("Fashi.jsp");
		req.setAttribute("loginflag", FashiLogin.nm);
		rd.include(req, resp);
	}
}
