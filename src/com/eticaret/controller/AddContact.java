package com.eticaret.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ecommerce.DAO.*;
import com.ecommerce.model.*;

@WebServlet("/AddContact")
public class AddContact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddContact() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String contactName = request.getParameter("first_name");
		System.out.println(contactName);
		String contactSurname = request.getParameter("last_name");
		System.out.println(contactSurname);
		String contactEmail = request.getParameter("email");
		System.out.println(contactEmail);
		String contactMessage = request.getParameter("message");
		System.out.println(contactMessage);
		if(contactName!="" && contactSurname!="" && contactEmail!="" && contactMessage!=""){
			Contact contact=new Contact();
			contact.setContact_name(contactName);
			contact.setContact_surname(contactSurname);
			contact.setContact_email(contactEmail);
			contact.setContact_message(contactMessage);
			int eklendiMi = ContactDao.addContact(contact);
			if(eklendiMi != 0){
				response.sendRedirect("master.jsp");
				
			}else{	
				
				response.sendRedirect("iletisim.jsp");
				
			}
		}
		else{			
			response.sendRedirect("iletisim.jsp");
		}
	}

}
