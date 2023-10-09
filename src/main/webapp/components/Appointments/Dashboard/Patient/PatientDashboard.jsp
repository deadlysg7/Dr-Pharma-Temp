<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.Modals.Patient" %>
<%Patient pat =(Patient)request.getSession().getAttribute("patient");%>
<link rel="stylesheet" href="styles/Appointments/patientDashboard.css" />
<div class="nav  w-screen p-4 bg-black text-white flex items-center justify-between">
	<div class="flex items-center gap-4" >
		<a href="/DrPharma/Dashboard?link=bookAppointments" class="hover:bg-white hover:text-black p-2 rounded-xl cursor-pointer">
			<h1>Book Appointments</h1>
		 </a>
		<a href="/DrPharma/Dashboard?link=viewAppointments" class="hover:bg-white hover:text-black p-2 rounded-xl cursor-pointer">
			<h1>View Appointments</h1>
		 </a>
		 <a href="/DrPharma/MediStore" class="hover:bg-white hover:text-black p-2 rounded-xl cursor-pointer">
			<h1>Buy Medicines</h1>
		 </a>
		 <a href="/DrPharma/MyOrders" class="hover:bg-white hover:text-black p-2 rounded-xl cursor-pointer">
			<h1>My Orders</h1>
		 </a>
	</div>
	<div>
		<div class="hover:bg-white hover:text-black p-2 rounded-xl cursor-pointer"> 
			<h1><a href="/DrPharma/Logout" >LOGOUT</a></h1>
		</div>
	</div>
</div>

<% if("viewAppointments".equals(request.getParameter("link"))){ %> 
	<%@ include file="/components/Appointments/Dashboard/Patient/ViewAppointments.jsp" %>
<%} %>
<%@ include file="/components/Appointments/Dashboard/Patient/BookAppointments.jsp" %>