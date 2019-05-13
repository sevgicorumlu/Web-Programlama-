package com.ecommerce.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ecommerce.model.Category;
import com.ecommerce.model.Contact;
import com.ecommerce.model.Order;

public class ContactDao {
	private static Connection con = null;
	private static PreparedStatement psmt = null;
	private static ResultSet rs = null;
	
	public static ArrayList<Contact> allContact () throws SQLException {
		ArrayList<Contact> allContact = new ArrayList<Contact>();
		String sql = "SELECT * FROM contact;";
		try{
			
			con = ConnectionDao.getConnection();
			psmt=con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()){
				Contact contact=new Contact();
				contact.setContact_id(rs.getInt(1));
				contact.setContact_name(rs.getString(2));
				contact.setContact_surname(rs.getString(3));
				contact.setContact_email(rs.getString(4));
				contact.setContact_message(rs.getString(5));
				contact.setStatus(rs.getInt(6));				
				allContact.add(contact);
			}			
		}catch(SQLException ex){
			ex.printStackTrace();
		}finally {
			con.close();
			psmt.close();
			rs.close();			
		}
		
		return allContact;
	}
	
	
	public static int addContact(Contact contact){
		int state = 0;
		String sql = "INSERT INTO contact(contact_name, contact_surname, contact_email, contact_message) VALUES(?, ?, ?, ?)";
		try {			
			con = ConnectionDao.getConnection();			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, contact.getContact_name());
			psmt.setString(2, contact.getContact_surname());
			psmt.setString(3, contact.getContact_email());
			psmt.setString(4, contact.getContact_message());
			state = psmt.executeUpdate();
			
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			try {
				con.close();
				psmt.close();				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		return state;
	}
	
	public static int updateContactStatus(Contact contact) throws SQLException {
		int state = 0;
		String sql = "UPDATE contact set status=? WHERE contact_id=?";
		try{
			con = ConnectionDao.getConnection();
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, contact.getStatus());
			psmt.setInt(2, contact.getContact_id());
			state = psmt.executeUpdate();
			con.close();
		}catch(SQLException ex){
			ex.printStackTrace();
		}finally {
			try {
				con.close();
				psmt.close();				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		return state ;
	}
	
	
}
