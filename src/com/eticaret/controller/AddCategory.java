package com.eticaret.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.DAO.CategoryDao;
import com.ecommerce.model.Category;


@WebServlet("/AddCategory")
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String categoryName = request.getParameter("category");
		String categoryImage = request.getParameter("categoryImage");
		if(categoryName!="" && categoryImage!=""){
			Category category=new Category();
			category.setCategory_name(categoryName);
			category.setCategory_image(categoryImage);
			int eklendiMi = CategoryDao.addCategory(category);
			if(eklendiMi != 0){
				response.sendRedirect("category.jsp");
				
			}else{	
				
				response.sendRedirect("addCategory.jsp");
				
			}
		}
		else{			
			
			response.sendRedirect("addCategory.jsp");
			
		}
	}

}
