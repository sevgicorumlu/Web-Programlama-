package com.ecommerce.model;

public class User {

	private int user_id;
	private int address_id;
	private String user_name;
	private String user_email;
	private String user_password;
	private int authorized;
	
	public User() {
		super();
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getAddress_id() {
		return address_id;
	}

	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public int getAuthorized() {
		return authorized;
	}

	public void setAuthorized(int authorized) {
		this.authorized = authorized;
	}

}
