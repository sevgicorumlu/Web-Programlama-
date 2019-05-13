package com.ecommerce.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ecommerce.model.Address;

public class AddressDao {
	private static Connection con = null;
	private static PreparedStatement psmt = null;
	private static ResultSet rs = null;
	
	public static ArrayList<Address> allAddress () throws SQLException {
		ArrayList<Address> Address = new ArrayList<Address>();
		String sql = "SELECT * FROM address;";
		try{
			
			con = ConnectionDao.getConnection();
			psmt=con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()){
				Address address=new Address();
				address.setAddress_id(rs.getInt(1));
				address.setDelivery_address(rs.getString(2));
				address.setBilling_address(rs.getString(3));

				
				Address.add(address);
			}			
		}catch(SQLException ex){
			ex.printStackTrace();
		}finally {
			con.close();
			psmt.close();
			rs.close();			
		}
		
		return Address;
	}
}
