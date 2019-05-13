package com.eticaret.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.*;
@WebServlet("/DeletBasket")
public class DeletBasket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletBasket() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int urunId = Integer.parseInt(request.getParameter("urunId"));
		@SuppressWarnings("unchecked")
		ArrayList<Product> sepet = (ArrayList<Product>) request.getSession().getAttribute("sepet");
		ArrayList<Product> yeniSepet = new ArrayList<Product>(); 
		
		for(int i = 0; i < sepet.size();i++){
			if(sepet.get(i).getProduct_id() != urunId){ 
				yeniSepet.add(sepet.get(i));
			}			
		}
		request.getSession().setAttribute("sepet",yeniSepet);
		request.getRequestDispatcher("sepet.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
