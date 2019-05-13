package com.eticaret.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.DAO.CategoryDao;
import com.ecommerce.model.Category;


@WebServlet("/CategoryUpdate")
public class CategoryUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public CategoryUpdate() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String categoryName = request.getParameter("categoryName");
		String categoryImage = request.getParameter("categoryImage");
		int categoryId=Integer.parseInt(request.getParameter("categoryId"));
		if(categoryName!="" && categoryImage!="" ){
			Category category=new Category();
			category.setCategory_id(categoryId);
			category.setCategory_name(categoryName);
			category.setCategory_image(categoryImage);
			try {
				int eklendiMi = CategoryDao.updateCategory(category);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		response.sendRedirect("category.jsp");
	}

}
