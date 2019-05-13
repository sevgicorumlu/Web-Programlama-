package com.eticaret.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.DAO.CategoryDao;
@WebServlet("/CategoryDelete")
public class CategoryDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CategoryDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		
		String id = request.getParameter("sil");
		int urunId = Integer.parseInt(id);
		
		if(id != null && !id.equals("")){
			try { 
				
				CategoryDao.deleteCategory(urunId);
			} catch (SQLException e) {
				System.out.println("error " + e);
				e.printStackTrace();
			}
		}
		response.sendRedirect("category.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
