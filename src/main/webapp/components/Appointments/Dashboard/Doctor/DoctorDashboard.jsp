<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Modals.Doctor" %>
<%@ page import="com.DAO.AppointmentDAO" %>
    <%@ page import="com.Db.DBConnect" %>
    <%@ page import="com.Modals.Appointment" %>
    <%@ page import="java.util.ArrayList" %>
     <%@ page import="com.Modals.Patient" %>
<link rel="stylesheet"  href="styles/Appointments/DoctorDashboard.css"  >
<%Doctor doc =(Doctor)request.getSession().getAttribute("doctor");
AppointmentDAO appDAO = new AppointmentDAO(DBConnect.getConn());
ArrayList<Appointment> apps = appDAO.getDoctorAppointments(doc.getEmail());
%>
<div class="doctor_banner w-full  p-8">
	<div>
		<h1 class="text-4xl font-extrabold ">Dr.<%=doc.getName() %></h1>
		<div class="flex gap-4 ">
			<p class="text-xl font-extrabold font-sans text-gray-500"><%=doc.getQualifications() %> | Since <%=doc.getJoin_date() %> | </p>
		</div>
	</div>
</div>
<h1 class="text-center text-5xl  font-bold font-sans mt-16 underline">Your Appointments </h1>
<div class="mt-16 p-4 w-full h-full">
<div class="doctor-appointments p-4">
	<div class="pending-appointments">
			<%
				for (Appointment app :  apps){
			%>
			<%if(app.getStatus().equals("PENDING")){ %> 
			
					<div class="p-4 shadow-large  rounded-xl bg-black text-white hover:scale-105">
						<h1>Date: <%=app.getScheduled_date()%></h1>
						<h1>Made on: <%=app.getMade_on() %></h1>
						<h1>Appointment No: <%=app.getID() %></h1>
						<div class="flex gap-4 w-full ">
							<a class="m-2 p-3  bg-green-500 font-bold rounded-xl"  href="AcceptAppointment?id=<%=app.getID()%>">ACCEPT</a>
							<a class="m-2 p-3 bg-red-500 font-bold rounded-xl" href="CancelAppointment?id=<%=app.getID()%>">CANCEL</a>
						</div>
					</div>
				<%} %>
		<% } %>
	</div>
	<div class="accepted-appointments">
		<%
				for (Appointment app :  apps){
			%>
			<%if(app.getStatus().equals("ACCEPTED")){ %> 
			
					<div class="p-4 shadow-large rounded-xl  hover:scale-105 bg-slate-100">
						<h1>Date: <%=app.getScheduled_date()%></h1>
						<h1>Made on: <%=app.getMade_on() %></h1>
						<h1>Appointment No: <%=app.getID() %></h1>
						<div class="flex gap-4 w-full ">
							<a class="m-2 p-3  bg-green-500 font-bold rounded-xl"  href="AcceptAppointment?id=<%=app.getID()%>">JOIN ROOM</a>
							<a class="m-2 p-3  bg-green-300 font-bold rounded-xl" href="CancelAppointment?id=<%=app.getID()%>">CANCEL</a>
						</div>
					</div>
				<%} %>
		<% } %>
	</div>
</div>
</div>




