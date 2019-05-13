package com.eticaret.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.DAO.ContactDao;
import com.ecommerce.model.Contact;

/**
 * Servlet implementation class ContactStatus
 */
@WebServlet("/ContactStatus")
public class ContactStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ContactStatus() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int contactStatus=Integer.parseInt(request.getParameter("contactStatus"));
		int contactId=Integer.parseInt(request.getParameter("contactId"));
		if(contactId!=0){
			Contact contact=new Contact();
			contact.setStatus(contactStatus);
			contact.setContact_id(contactId);
			try {
				int eklendiMi = ContactDao.updateContactStatus(contact);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		response.sendRedirect("contacts.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
