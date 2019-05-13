package com.eticaret.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.DAO.OrderDao;
import com.ecommerce.model.Order;

/**
 * Servlet implementation class OrderStatus
 */
@WebServlet("/OrderStatus")
public class OrderStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public OrderStatus() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int orderStatus=Integer.parseInt(request.getParameter("orderStatus"));
		int orderId=Integer.parseInt(request.getParameter("orderId"));
		if(orderId!=0){
			Order order=new Order();
			order.setStatus(orderStatus);
			order.setOrder_id(orderId);
			try {
				int eklendiMi = OrderDao.updateOrderStatus(order);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		response.sendRedirect("order.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
