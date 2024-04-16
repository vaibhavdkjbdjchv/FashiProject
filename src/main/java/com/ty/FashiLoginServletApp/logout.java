package com.ty.FashiLoginServletApp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/logout")
public class logout extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		FashiLogin.login = false;
		MainServer.login = false;
		MainServer.user = null;
		MainServer.un = null;
		
		PrintWriter pw = resp.getWriter();
		pw.print("<script>setTimeout(e=>{window.alert(\"logout successfully\")},0)</script>");
		RequestDispatcher dispatcher = req.getRequestDispatcher("Fashi.jsp");
		dispatcher.include(req, resp);
		}
}
