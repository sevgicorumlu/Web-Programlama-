package com.eticaret.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.DAO.BrandDao;
import com.ecommerce.model.Brand;


@WebServlet("/BrandUpdate")
public class BrandUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public BrandUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String brand = request.getParameter("brandName");
		int brandId=Integer.parseInt(request.getParameter("brandId"));
		System.out.println(brand);
		if(brand!=""){
			Brand urun=new Brand();
			urun.setBrand_name(brand);
			urun.setBrand_id(brandId);
			try {
				int eklendiMi = BrandDao.updateBrandName(urun);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		response.sendRedirect("brand.jsp");
	}

}
