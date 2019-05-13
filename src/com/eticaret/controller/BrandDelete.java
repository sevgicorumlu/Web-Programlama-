package com.eticaret.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.DAO.BrandDao;
@WebServlet("/BrandDelete")
public class BrandDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BrandDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		
		String id = request.getParameter("delete");
		int urunId = Integer.parseInt(id);
		
		if(id != null && !id.equals("")){
			try { 
				
				BrandDao.deleteBrand(urunId);
			} catch (SQLException e) {
				System.out.println("error " + e);
				e.printStackTrace();
			}
		}
				
		
		response.sendRedirect("brand.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
