package com.homeservice.api.auth;

public class UserAuth {
	
	private Integer id;
	private String email;
	private String password;
	
	public UserAuth() {
	
	}
	
	public UserAuth(Integer id, String email, String password) {
		this.id = id;
		this.email = email;
		this.password = password;
	}
	
	public Integer getId() {
		return id;
	}

	public void getId(Integer id) {
		this.id = id;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
