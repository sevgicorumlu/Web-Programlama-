package com.eticaret.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.DAO.*;
import com.ecommerce.model.*;

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public UserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String musteriMail = request.getParameter("musteriMail");
		String musteriSifre = request.getParameter("musteriSifre");
		request.getSession().setAttribute("kullanici_isim", musteriMail);
		request.getSession().setAttribute("kullanici_sifre", musteriMail);
		if (musteriMail != null && musteriSifre != null) {
			User musteri = UserDao.getUserLogin(musteriMail, musteriSifre);
			
			if (musteri != null) {
				ArrayList<Product> sepetim = new ArrayList<Product>();
				request.getSession().setAttribute("sepet", sepetim); 
				request.getSession().setAttribute("musteri", musteri);	
				
				response.sendRedirect("master.jsp");
			} else {				
				request.getRequestDispatcher("signin.jsp").forward(request, response);
			}
		} else {
			response.sendRedirect("signin.jsp");
		}
	}
	
}
