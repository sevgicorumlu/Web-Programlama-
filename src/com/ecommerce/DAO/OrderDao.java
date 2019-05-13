package com.ecommerce.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ecommerce.model.Brand;
import com.ecommerce.model.Order;
import com.ecommerce.model.Product;

public class OrderDao {
	private static Connection con = null;
	private static PreparedStatement psmt = null;
	private static ResultSet rs = null;
	
	public static ArrayList<Order> allOrderList() throws SQLException {
		ArrayList<Order> allProduct = new ArrayList<Order>();
		try {
			con = ConnectionDao.getConnection();
			psmt = con.prepareStatement("SELECT * from orderdetail;");
			rs = psmt.executeQuery();
			while (rs.next()) {
				Order product = new Order();
				product.setOrder_id(rs.getInt(1));
				product.setUser_id(rs.getInt(2));
				product.setProduct_id(rs.getInt(3));
				product.setQuantity(rs.getInt(4));
				product.setStatus(rs.getInt(5));
				product.setAddress_id(rs.getInt(6));
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

	public static int addOrder(Order urun){
		int state = 0;
		String sql = "INSERT INTO orderdetail(user_id, product_id, quantity, status, address_id) VALUES(?,?,?,?,?)";
		try {			
			con = ConnectionDao.getConnection();			
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, urun.getUser_id());
			psmt.setInt(2, urun.getProduct_id());
			psmt.setInt(3, urun.getQuantity());
			psmt.setInt(4, urun.getStatus());
			psmt.setInt(5, urun.getAddress_id());
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
	
	public static int updateOrderStatus(Order order) throws SQLException {
		int state = 0;
		String sql = "UPDATE orderdetail set status=? WHERE order_id=?";
		try{
			con = ConnectionDao.getConnection();
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, order.getStatus());
			psmt.setInt(2, order.getOrder_id());
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
