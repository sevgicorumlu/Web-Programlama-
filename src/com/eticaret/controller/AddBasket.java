package com.eticaret.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.DAO.*;
import com.ecommerce.model.*;

@WebServlet("/AddBasket")
public class AddBasket extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("productId"));

		if (request.getSession().getAttribute("musteri") != null) {
			@SuppressWarnings("unchecked")
			ArrayList<Product> sepet = (ArrayList<Product>) request.getSession().getAttribute("sepet"); //Sessiondaki sepet namesini liste olarak tanımladığımız sepet değişkenine ata
			try {
				sepet.add(ProductDao.oneProduct(id).get(0));
				request.getSession().setAttribute("sepet",sepet);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("master3.jsp").forward(request, response);
		} else {
			response.sendRedirect("signin.jsp");
		}
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}