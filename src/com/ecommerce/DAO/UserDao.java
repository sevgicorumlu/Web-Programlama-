package com.ecommerce.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ecommerce.model.Product;
import com.ecommerce.model.User;

public class UserDao {

	private static Connection con = null;
	private static PreparedStatement psmt = null;
	private static ResultSet rs = null;

	
	
	public static ArrayList<User> allUserList() throws SQLException {
		ArrayList<User> alluser = new ArrayList<User>();
		try {
			con = ConnectionDao.getConnection();
			psmt = con.prepareStatement("SELECT * from user;");
			rs = psmt.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setUser_id(rs.getInt(1));
				user.setAddress_id(rs.getInt(2));
				user.setUser_name(rs.getString(3));
				user.setUser_email(rs.getString(4));
				user.setUser_password(rs.getString(5));
				user.setAuthorized(rs.getInt(6));
				alluser.add(user);
			}
			con.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			try {
				con.close();
				psmt.close();
				rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return alluser;
	}
	
	public static int adminAdd(User admin){
		int state=0;
		String sql="INSERT INTO user(user_name, user_email, user_password, authorized) VALUES(?, ?, ?, ?)";
		try{
			con=ConnectionDao.getConnection();
			psmt=con.prepareStatement(sql);
			
			psmt.setString(1, admin.getUser_name());
			psmt.setString(2, admin.getUser_email());
			psmt.setString(3, admin.getUser_password());
			psmt.setInt(4, admin.getAuthorized());
			
			state=psmt.executeUpdate();		
		}
		catch(SQLException ex){
			ex.printStackTrace();
		}
		finally {
			try {  
				ConnectionDao.kapat(con, psmt);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return state;
	}
	
	public static boolean deleteAdmin(int adminId) throws SQLException {
		int status = 0;
		try {
			con = ConnectionDao.getConnection();
			psmt = con.prepareStatement("delete from user where user_id = ?");
			psmt.setInt(1, adminId);
			status = psmt.executeUpdate();			
			con.close();
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
		return status > 0 ? true : false;
	}
	
	public static synchronized int adminPasswordUpdate(User admin)throws SQLException {
		int state=0;
		String sql="Update from user set user_password=? where (user_id=?);";
		try{
			con=ConnectionDao.getConnection();
			psmt=con.prepareStatement(sql);
			
			psmt.setString(1, admin.getUser_password());
			psmt.setInt(2, admin.getUser_id());
			
			state=psmt.executeUpdate();	
			con.close();
		}
		catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			ConnectionDao.kapat(con, psmt);
		}
		return state;
	}
	
	public static User getAdminLogin(String Mail, String Sifre) {
		User admin=null;
		String sql="Select * from user where user_email=? and user_password=? and authorized=1;";
		
		try{
			con=ConnectionDao.getConnection();
			psmt=con.prepareStatement(sql);
			
			psmt.setString(1, Mail);
			psmt.setString(2, Sifre);
			rs=psmt.executeQuery();
			
			if(rs.next()){
				admin=new User();
				admin.setUser_id(rs.getInt(1));
				admin.setUser_name(rs.getString(2));	
				admin.setUser_email(rs.getString(3));
				admin.setUser_password(rs.getString(4));
				admin.setAuthorized(rs.getInt(5));
			}
			con.close();
		}
		catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			try {  
				ConnectionDao.kapat(con, psmt);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return admin;		
	}
	
	public static User getUserLogin(String Mail, String Sifre) {
		User admin=null;
		String sql="Select * from user where user_email=? and user_password=? and authorized=0;";
		
		try{
			con=ConnectionDao.getConnection();
			psmt=con.prepareStatement(sql);
			
			psmt.setString(1, Mail);
			psmt.setString(2, Sifre);
			rs=psmt.executeQuery();
			
			if(rs.next()){
				admin=new User();
				admin.setUser_id(rs.getInt(1));
				admin.setUser_name(rs.getString(2));	
				admin.setUser_email(rs.getString(3));
				admin.setUser_password(rs.getString(4));
				admin.setAuthorized(rs.getInt(5));
			}
			con.close();
		}
		catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			try {  
				ConnectionDao.kapat(con, psmt);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return admin;		
	}
	
	public static ArrayList<User> oneUser(int urunID) throws SQLException {
		ArrayList<User> urun = new ArrayList<User>();
		try {
			con = ConnectionDao.getConnection();
			psmt = con.prepareStatement("select * from user where user_id=?;"); 
			psmt.setInt(1, urunID);
			rs = psmt.executeQuery();
			if (rs.next()) {
				User product = new User();
				
				product.setUser_id(rs.getInt(1));
				product.setAddress_id(rs.getInt(2));
				product.setUser_name(rs.getString(3));
				product.setUser_email(rs.getString(4));
				product.setUser_password(rs.getString(5));
				product.setAuthorized(rs.getInt(6));
				urun.add(product);
						
			}
			con.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			try {
				con.close();
				psmt.close();
				rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return urun;
	}
	
	public static ArrayList<User> oneUserDetail(String mail) throws SQLException {
		ArrayList<User> urun = new ArrayList<User>();
		try {
			con = ConnectionDao.getConnection();
			psmt = con.prepareStatement("select * from user where user_email=?;"); 
			psmt.setString(1, mail);
			rs = psmt.executeQuery();
			if (rs.next()) {
				User product = new User();
				
				product.setUser_id(rs.getInt(1));
				product.setAddress_id(rs.getInt(2));
				product.setUser_name(rs.getString(3));
				product.setUser_email(rs.getString(4));
				product.setUser_password(rs.getString(5));
				product.setAuthorized(rs.getInt(6));
				urun.add(product);
						
			}
			con.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			try {
				con.close();
				psmt.close();
				rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return urun;
	}

}
