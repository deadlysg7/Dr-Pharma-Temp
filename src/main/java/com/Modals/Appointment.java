package com.Modals;

public class Appointment {
	private Integer id;
	private String made_on;
	private String scheduled_date;
	private String status;
	private String diagnosis;
	private String pat_email;
	private String doc_email;
	public Appointment(String made_on, String scheduled_date, String status, String diagnosis,String pat_email,String doc_email) {
		super();
		this.made_on = made_on;
		this.scheduled_date = scheduled_date;
		this.status = status;
		this.diagnosis = diagnosis;
		this.pat_email = pat_email;
		this.doc_email = doc_email;
	}
	public String getMade_on() {
		return made_on;
	}
	public void setMade_on(String made_on) {
		this.made_on = made_on;
	}
	public String getScheduled_date() {
		return scheduled_date;
	}
	public void setScheduled_date(String scheduled_date) {
		this.scheduled_date = scheduled_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDiagnosis() {
		return diagnosis;
	}
	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}
	public String getPat_email() {
		return pat_email;
	}
	public void setPat_email(String pat_email) {
		this.pat_email = pat_email;
	}
	public String getDoc_email() {
		return doc_email;
	}
	public void setDoc_email(String doc_email) {
		this.doc_email = doc_email;
	}
	public Integer getID() {
		return id;
	}
	public void setID(Integer id) {
		this.id = id;
	}
}
