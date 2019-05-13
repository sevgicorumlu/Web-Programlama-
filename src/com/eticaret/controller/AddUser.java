package com.eticaret.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.DAO.*;
import com.ecommerce.model.*;


@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String userName = request.getParameter("user_name");
		System.out.println(userName);
		String userEmail = request.getParameter("user_email");
		String userPassword = request.getParameter("user_password");
		int authorized = Integer.parseInt(request.getParameter("user_authorized"));
		
		if(userName!="" && userEmail!="" && userPassword!=""){
			User user=new User();
			user.setUser_name(userName);
			user.setUser_email(userEmail);
			user.setUser_password(userPassword);
			user.setAuthorized(authorized);
			int eklendiMi = UserDao.adminAdd(user);
			if(eklendiMi != 0){
				response.sendRedirect("master.jsp");
				
			}else{	
				response.sendRedirect("signup.jsp");
				
			}
		}
		else{			
			
			response.sendRedirect("signup.jsp");
			
		}
	}

}
