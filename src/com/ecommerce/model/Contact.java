package com.ecommerce.model;

public class Contact {
	private int contact_id;
	private String contact_name;
	private String contact_surname;
	private String contact_email;
	private String contact_message;
	private int status;
	
	public Contact() {
		super();
	}

	public int getContact_id() {
		return contact_id;
	}

	public void setContact_id(int contact_id) {
		this.contact_id = contact_id;
	}

	public String getContact_name() {
		return contact_name;
	}

	public void setContact_name(String contact_name) {
		this.contact_name = contact_name;
	}

	public String getContact_surname() {
		return contact_surname;
	}

	public void setContact_surname(String contact_surname) {
		this.contact_surname = contact_surname;
	}


	public String getContact_message() {
		return contact_message;
	}

	public void setContact_message(String contact_message) {
		this.contact_message = contact_message;
	}

	public String getContact_email() {
		return contact_email;
	}

	public void setContact_email(String contact_email) {
		this.contact_email = contact_email;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
