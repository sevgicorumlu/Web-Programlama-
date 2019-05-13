package com.ecommerce.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ecommerce.model.Brand;
import com.ecommerce.model.User;

public class BrandDao {
	
	private static Connection con = null;
	private static PreparedStatement psmt = null;
	private static ResultSet rs = null;
	
	
	
	public static ArrayList<Brand> allBrand() {
		ArrayList<Brand> markalar = new ArrayList<Brand>();
		String sql = "Select * from brands;";
		try {
			con = ConnectionDao.getConnection();
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Brand marka = new Brand();
				marka.setBrand_id(rs.getInt(1));
				marka.setBrand_name(rs.getString(2));
				markalar.add(marka);
			}
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
		return markalar;
	}
	
	
	public static int addBrand(Brand urun){
		int state = 0;
		String sql = "INSERT INTO brands(brand_name) VALUES(?)";
		try {			
			con = ConnectionDao.getConnection();			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, urun.getBrand_name());
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
	
	
	public static boolean deleteBrand(int brandId) throws SQLException {
		int status = 0;
		try {
			con = ConnectionDao.getConnection();
			psmt = con.prepareStatement("delete from brands where brand_id = ?");
			psmt.setInt(1, brandId);
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
	
	public static int updateBrandName(Brand marka) throws SQLException {
		int state = 0;
		String sql = "UPDATE brands set brand_name=? WHERE brand_id=?";
		try{
			con = ConnectionDao.getConnection();
			psmt = con.prepareStatement(sql);
			psmt.setString(1, marka.getBrand_name());
			psmt.setInt(2, marka.getBrand_id());
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
