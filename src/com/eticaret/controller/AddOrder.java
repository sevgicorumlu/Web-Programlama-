package com.eticaret.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.DAO.OrderDao;
import com.ecommerce.model.Order;


@WebServlet("/AddOrder")
public class AddOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
		int productId=Integer.parseInt(request.getParameter("productId"));
		int userId=Integer.parseInt(request.getParameter("userId"));
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		int status=Integer.parseInt(request.getParameter("status"));
		int address_id=Integer.parseInt(request.getParameter("address_id"));
		System.out.println(productId);
		 
		
				
		if(productId!=0){
			Order urun=new Order();
			urun.setProduct_id(productId);
			urun.setUser_id(userId);
			urun.setQuantity(quantity);
			urun.setStatus(status);
			urun.setAddress_id(address_id);
			
			int eklendiMi = OrderDao.addOrder(urun);
			if(eklendiMi != 0){
				response.sendRedirect("master.jsp");
				
			}else{	
				
				response.sendRedirect("sendOrder.jsp");
				
			}
		}
		else {
			response.sendRedirect("addOrder.jsp");
		}
		
	}

}
