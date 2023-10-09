<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.DAO.AppointmentDAO" %>
<%@ page import="com.Db.DBConnect" %>
<%@ page import="com.Modals.Appointment" %>
<%@ page import="java.util.ArrayList" %>
 <%@ page import="com.Modals.Patient" %>
 <link rel="stylesheet"  href="styles/Appointments/viewAppointments.css" />
<div class="h-screen w-screen  grid justify-items-center items-center overflow-x-hidden overflow-y-auto">
	<table class="styled-table">
	    <thead>
	        <tr>
	            <th>Made On</th>
	            <th>Scheduled Date</th>
	            <th>Status</th>
	            <th>Diagnosis</th>
	            <th>Patient Email</th>
	            <th>Doctor Email</th>
	        </tr>
	        <tbody>
			       
			            <%
							AppointmentDAO appDAO = new AppointmentDAO(DBConnect.getConn());
			            	Patient p = (Patient)request.getSession().getAttribute("patient");
							ArrayList<Appointment> appList = appDAO.getPatientAppointments(p.getEmail());
							for (Appointment app : appList) { %>
								 <tr>
								 		<td><%= app.getMade_on() %></td>
								 		<td><%=app.getScheduled_date() %> </td>
								 		<td><%=app.getStatus() %></td>
								 		<td><%=(app.getDiagnosis().equals("") || app.getDiagnosis().equals(null) )?"----":app.getDiagnosis()%></td>
								 		<td><%=app.getPat_email()  %></td>
								 		<td><%=app.getDoc_email() %> </td>
								 </tr>
						<% } %>
			        
    		</tbody>
	    </thead>
    </table>
</div>