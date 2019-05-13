package com.ecommerce.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;




import com.ecommerce.model.Category;

public class CategoryDao {

	private static Connection con = null;
	private static PreparedStatement psmt = null;
	private static ResultSet rs = null;
	
	public static ArrayList<Category> allCategory () throws SQLException {
		ArrayList<Category> allCategories = new ArrayList<Category>();
		String sql = "SELECT * FROM categories;";
		try{
			
			con = ConnectionDao.getConnection();
			psmt=con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()){
				Category category=new Category();
				category.setCategory_id(rs.getInt(1));
				category.setCategory_name(rs.getString(2));
				category.setCategory_image(rs.getString(3));

				
				allCategories.add(category);
			}			
		}catch(SQLException ex){
			ex.printStackTrace();
		}finally {
			con.close();
			psmt.close();
			rs.close();			
		}
		
		return allCategories;
	}
	
	public static int addCategory(Category category){
		int state = 0;
		String sql = "INSERT INTO categories(category_name, category_image) VALUES(?, ?)";
		try {			
			con = ConnectionDao.getConnection();			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, category.getCategory_name());
			psmt.setString(2, category.getCategory_image());
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
	
	public static boolean deleteCategory(int categoryId) throws SQLException {
		int status = 0;
		try {
			con = ConnectionDao.getConnection();
			psmt = con.prepareStatement("delete from categories where category_id = ?");
			psmt.setInt(1, categoryId);
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
	
	public static int updateCategory(Category kategori) throws SQLException{
		int state = 0;
		String sql = "UPDATE categories SET category_name=?,category_image=? WHERE (category_id = ? );";
		try{
			con = ConnectionDao.getConnection();
			psmt = con.prepareStatement(sql);
			psmt.setString(1, kategori.getCategory_name());
			psmt.setString(2, kategori.getCategory_image());
			psmt.setInt(3, kategori.getCategory_id());
			state = psmt.executeUpdate();
			con.close();
		}catch(SQLException ex){
			ex.printStackTrace();
		}finally {
			ConnectionDao.kapat(con, psmt);
		}
		return state;
	}
	
}
