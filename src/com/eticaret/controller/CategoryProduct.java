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
import com.ecommerce.model.Product;


@WebServlet("/CategoryProduct")
public class CategoryProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CategoryProduct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("kid"); 
		ArrayList<Product> uruns = null;
		if(id != null && !id.equals("")){
			int kategoriId = Integer.parseInt(id);
			try {
				uruns = ProductDao.allProductCategory(kategoriId); 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(uruns != null){
			request.setAttribute("k_id", id);
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}


}
