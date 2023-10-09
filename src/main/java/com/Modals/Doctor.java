package com.Modals;

public class Doctor {
	private String name;
	private Integer id;
	private String email;
	private String password;
	private String join_date;
	private String qualifications;
	private Integer dept_no;
	private String gender;
	public Doctor(String name, String email,String password, String join_date, String qualifications, Integer dept_no,
		String gender) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.join_date = join_date;
		this.qualifications = qualifications;
		this.dept_no = dept_no;
		this.gender = gender;
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
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
	public String getQualifications() {
		return qualifications;
	}
	public void setQualifications(String qualifications) {
		this.qualifications = qualifications;
	}
	public Integer getDept_no() {
		return dept_no;
	}
	public void setDept_no(Integer dept_no) {
		this.dept_no = dept_no;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}	
	public String getPassword() {
		return password;
	}
	public void setPassword(String pass) {
		this.password = pass;
	}	
}
