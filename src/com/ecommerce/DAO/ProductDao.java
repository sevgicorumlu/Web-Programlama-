package com.ecommerce.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ecommerce.model.Product;

public class ProductDao {
	private static Connection con = null;
	private static PreparedStatement psmt = null;
	private static ResultSet rs = null;
	
	public static ArrayList<Product> allProductCategory(int cid) throws SQLException {
		ArrayList<Product> allProduct = new ArrayList<Product>();
		try {
			con = ConnectionDao.getConnection();
			psmt = con.prepareStatement("Select * from product where category_id =?");
			psmt.setInt(1, cid);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProduct_id(rs.getInt(1));
				product.setProduct_code(rs.getString(2));
				product.setProduct_name(rs.getString(3));
				product.setProduct_stock(rs.getInt(4));
				product.setProduct_price(rs.getFloat(5));
				product.setProduct_explain(rs.getString(6));
				product.setCategory_id(rs.getInt(7));
				product.setBrand_id(rs.getInt(8));
				product.setProduct_image(rs.getString(9));
				
				allProduct.add(product);
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
		return allProduct;
	}
	
	public static ArrayList<Product> allProductList() throws SQLException {
		ArrayList<Product> allProduct = new ArrayList<Product>();
		try {
			con = ConnectionDao.getConnection();
			psmt = con.prepareStatement("SELECT * from product;");
			rs = psmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProduct_id(rs.getInt(1));
				product.setProduct_code(rs.getString(2));
				product.setProduct_name(rs.getString(3));
				product.setProduct_stock(rs.getInt(4));
				product.setProduct_price(rs.getFloat(5));
				product.setProduct_explain(rs.getString(6));
				product.setCategory_id(rs.getInt(7));
				product.setBrand_id(rs.getInt(8));
				product.setProduct_image(rs.getString(9));
				allProduct.add(product);
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
		return allProduct;
	}

	public static byte[] getImageByUrunId(int urunId) {
		String query = "select product_image from urun where product_id=?";
		Connection con = ConnectionDao.getConnection();
		PreparedStatement psmt;
		byte[] bytesImage = null;
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, urunId);
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
				bytesImage = rs.getBytes("product_image");
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bytesImage;
	}
	
	
	public static ArrayList<Product> oneProduct(int urunID) throws SQLException {
		ArrayList<Product> urun = new ArrayList<Product>();
		try {
			con = ConnectionDao.getConnection();
			psmt = con.prepareStatement("select * from product where product_id=?;"); 
			psmt.setInt(1, urunID);
			rs = psmt.executeQuery();
			if (rs.next()) {
				Product product = new Product();
				
				product.setProduct_id(rs.getInt(1));
				product.setProduct_code(rs.getString(2));
				product.setProduct_name(rs.getString(3));
				product.setProduct_stock(rs.getInt(4));
				product.setProduct_price(rs.getFloat(5));
				product.setProduct_explain(rs.getString(6));
				product.setCategory_id(rs.getInt(7));
				product.setBrand_id(rs.getInt(8));
				product.setProduct_image(rs.getString(9));
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
	
	public static boolean deleteProduct(int urunId) throws SQLException {
		int status = 0;
		try {
			con = ConnectionDao.getConnection();
			psmt = con.prepareStatement("delete from product where product_id = ?");
			psmt.setInt(1, urunId);
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
	
	public static int addProduct(Product urun){
		int state = 0;
		String sql = "INSERT INTO product(product_code, product_name, product_stock, product_price, product_explain, category_id, brand_id, product_image) VALUES(?,?,?,?,?,?,?,?)";
		try {			
			con = ConnectionDao.getConnection();			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, urun.getProduct_code());
			psmt.setString(2, urun.getProduct_name());
			psmt.setInt(3, urun.getProduct_stock());
			psmt.setFloat(4, urun.getProduct_price());
			psmt.setString(5, urun.getProduct_explain());
			psmt.setInt(6, urun.getCategory_id());
			psmt.setInt(7, urun.getBrand_id());
			psmt.setString(8, urun.getProduct_image());
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
	
}
