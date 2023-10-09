package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.Modals.Appointment;
import com.Modals.Doctor;

public class AppointmentDAO {
	private Connection conn;
	public AppointmentDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean BookAppointmnet(Appointment app) {
		boolean f = false;
		try {
			String query="insert into appointments(made_on,scheduled_date,status,diagnosis,pat_email,doc_email) values (?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, app.getMade_on());
			ps.setString(2, app.getScheduled_date());
			ps.setString(3, app.getStatus());
			ps.setString(4, app.getDiagnosis());
			ps.setString(5, app.getPat_email());
			ps.setString(6, app.getDoc_email());
			int  i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	 public ArrayList<Appointment> getPatientAppointments(String patEmail) {
	        ArrayList<Appointment> appointmentsList = new ArrayList<>();

	        try {
	            String query = "SELECT * FROM appointments WHERE pat_email = ?";
	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setString(1, patEmail);
	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {
	                Appointment appointment = new Appointment(
	                    rs.getString("made_on"),
	                    rs.getString("scheduled_date"),
	                    rs.getString("status"),
	                    rs.getString("diagnosis"),
	                    rs.getString("pat_email"),
	                    rs.getString("doc_email")
	                );
	                appointmentsList.add(appointment);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return appointmentsList;
	 }
	 
	 public ArrayList<Appointment> getDoctorAppointments(String docEmail) {
	        ArrayList<Appointment> appointmentsList = new ArrayList<>();

	        try {
	            String query = "SELECT * FROM appointments WHERE doc_email = ?";
	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setString(1, docEmail);
	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {
	                Appointment appointment = new Appointment(
	                    rs.getString("made_on"),
	                    rs.getString("scheduled_date"),
	                    rs.getString("status"),
	                    rs.getString("diagnosis"),
	                    rs.getString("pat_email"),
	                    rs.getString("doc_email")
	                );
	                appointment.setID(rs.getInt("id"));
	                appointmentsList.add(appointment);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return appointmentsList;
	 }
	 public boolean AcceptAppointment(Integer id) {
		 boolean f=false;
		 try {
	            String query = "UPDATE appointments SET status = ? WHERE id = ?";
	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setString(1, "ACCEPTED");
	            ps.setInt(2, id);
	            
	            int rowsUpdated = ps.executeUpdate();
	            
	            if (rowsUpdated > 0) {
	                f = true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		 return f;
	 }
	 public boolean CancelAppointment(Integer id) {
		 boolean f=false;
		 try {
	            String query = "DELETE FROM appointments WHERE id = ?";
	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setInt(1, id);
	            
	            int rowsUpdated = ps.executeUpdate();
	            
	            if (rowsUpdated > 0) {
	                f = true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		 return f;
	 }
}
