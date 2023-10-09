package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.Modals.Doctor;
import com.Modals.Patient;
import com.Modals.User;

public class UserDAO {
	private Connection conn;
	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	public Doctor getDoctor(User us) {
		try  {
			String query="Select * from doctors where email=? AND password=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, us.getEmail());
			ps.setString(2, us.getPassword());
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return new Doctor(rs.getString("name"),rs.getString("email"),rs.getString("password"),
						rs.getString("join_date"),rs.getString("qualifications"),rs.getInt("dept_no"),rs.getString("gender"));			
			} else {
				return null;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public Patient getPatient(User us) {
		try  {
			String query="Select * from patients where email=? AND password=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, us.getEmail());
			ps.setString(2, us.getPassword());
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return new Patient(rs.getString("name"),rs.getString("email"),rs.getString("password"),rs.getString("gender"));		
			} else {
				return null;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public boolean addDoctor(Doctor doc) {
		boolean f = false;
		try {
			String query = "insert into doctors(email,name,password,join_date,qualifications,dept_no,gender) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1,doc.getEmail() );
			ps.setString(2, doc.getName());
			ps.setString(3, doc.getPassword());
			ps.setString(4, doc.getJoin_date());
			ps.setString(5, doc.getQualifications());
			ps.setInt(6, doc.getDept_no());
			ps.setString(7,doc.getGender());
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public boolean addPatient(Patient pat) {
		boolean f = false;
		try {
			String query = "insert into patients(email,name,password,gender) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, pat.getEmail() );
			ps.setString(2, pat.getName());
			ps.setString(3, pat.getPassword());
			ps.setString(4,pat.getGender());
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public ArrayList<Doctor> getDoctors() {
	    ArrayList<Doctor> doctorsList = new ArrayList<>();

	    try {
	        String query = "SELECT * FROM doctors";
	        PreparedStatement ps = conn.prepareStatement(query);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Doctor doctor = new Doctor(
	                rs.getString("name"),
	                rs.getString("email"),
	                rs.getString("password"),
	                rs.getString("join_date"),
	                rs.getString("qualifications"),
	                rs.getInt("dept_no"),
	                rs.getString("gender")
	            );
	            doctorsList.add(doctor);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return doctorsList;
	}

}
