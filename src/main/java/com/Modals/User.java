package com.Modals;

public class User {
	private String name;
	private Integer id;
	private String email;
	private String password;
	public User() {
		
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
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
	public User( String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}
}
