package com.eticaret.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.ecommerce.DAO.*;
import com.ecommerce.model.*;

@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String productName = request.getParameter("product_name");
		String productCode = request.getParameter("product_code");
		
		int categoryId=Integer.parseInt(request.getParameter("product_category"));
		int brandId=Integer.parseInt(request.getParameter("product_brand"));
		int productStock = Integer.parseInt(request.getParameter("product_stock"));
		float productPrice = Float.parseFloat(request.getParameter("product_price"));
	
		String productExplain = request.getParameter("product_explain");
		String productImage = request.getParameter("product_image");
		
				
		if(productName!="" && productStock!=0 && productPrice!=0 && productImage!=null && productCode!=""){
			Product urun=new Product();
			urun.setProduct_name(productName);
			urun.setProduct_code(productCode);
			urun.setProduct_stock(productStock);
			urun.setProduct_price(productPrice);
			urun.setProduct_explain(productExplain);
			urun.setCategory_id(categoryId);
			urun.setBrand_id(brandId);
			urun.setProduct_image(productImage);
			int eklendiMi = ProductDao.addProduct(urun);
			if(eklendiMi != 0){
				response.sendRedirect("product.jsp");
				
			}else{	
				
				response.sendRedirect("addProduct.jsp");
				
			}
		}
		else {
			response.sendRedirect("addProduct.jsp");
		}
		
		
	}
}


