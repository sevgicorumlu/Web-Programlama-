package com.eticaret.controller;

import java.io.IOException;


import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.ecommerce.DAO.*;
import com.ecommerce.model.*;

@WebServlet("/AddBrand")
public class AddBrand extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddBrand() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String brand = request.getParameter("marka");
		System.out.println(brand);
		if(brand!=""){
			Brand urun=new Brand();
			urun.setBrand_name(brand);
			int eklendiMi = BrandDao.addBrand(urun);
			if(eklendiMi != 0){
				response.sendRedirect("brand.jsp");
				
			}else{	
				
				response.sendRedirect("addBrand.jsp");
				
			}
		}
		else{			
			
			response.sendRedirect("addBrand.jsp");
			
		}
		
	
	}

}
