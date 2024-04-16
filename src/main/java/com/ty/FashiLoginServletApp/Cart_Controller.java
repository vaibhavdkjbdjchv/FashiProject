package com.ty.FashiLoginServletApp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ty.fashiCart.Dao.User_Cart_Dao;
import com.ty.fashiCartDto.CartProduct;
import com.ty.fashiCartDto.User;

@WebServlet("/Cart")
public class Cart_Controller extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		if (MainServer.login) 
		{
			String input = req.getParameter("purchasebutt");
			System.out.println(input);
			
			User_Cart_Dao dao = new User_Cart_Dao();
			dao.modifyProList(MainServer.user, input);
			
			RequestDispatcher rd = req.getRequestDispatcher("DynamicCartPage.jsp");
			
			req.setAttribute("proId", FashiLogin.nm);
			req.setAttribute("cartingUser", MainServer.user);
			
//			for (CartProduct product : dao.giveListOfProduct(MainServer.user)) {
//				
//			}
			rd.forward(req, resp);
		}
		else 
		{
			RequestDispatcher rd = req.getRequestDispatcher("FashiLogin.html");
			rd.forward(req, resp);
		}
	}
}



//Work o buy section
