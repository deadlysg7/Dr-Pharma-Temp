<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="com.DAO.UserDAO" %>
    <%@ page import="com.Db.DBConnect" %>
    <%@ page import="com.Modals.Doctor" %>
    <%@ page import="java.util.ArrayList" %>
     <%@ page import="com.Modals.Patient" %>
<% boolean auth = (boolean)request.getSession().getAttribute("auth");
			System.out.println(auth);
			if(!auth){
				response.sendRedirect("/DrPharma/Login");
			}
%>
<div class="h-full w-full p-8">
	<h1 class="text-4xl font-bold font-sans">Book An Appointment</h1>
	<p class="my-4">We have All of the World's best Doctors. Book An Appointment today!!</p>
	<hr class="border-2 border-black"/>
	<div class="flex flex-wrap gap-4">
		<%
			UserDAO us = new UserDAO(DBConnect.getConn());
			ArrayList<Doctor> doctors = us.getDoctors();
			Patient p = (Patient)request.getSession().getAttribute("patient");
			for (Doctor doctor : doctors) {
		%>
			<div class="rounded-xl bg-slate-100 shadow-large max-w-fit p-4">
					<h1 class='text-2xl font-bold'>Dr.<%=doctor.getName() %></h1>
					<p class='text-lg font-bold text-slate-600'><%=doctor.getQualifications()%> | Since : <%=doctor.getJoin_date() %></p>
					<form method="post" action="BookAppointment" >
						<input type="hidden"  name="doc_email" value=<%=doctor.getEmail() %> />
						<input type="hidden"  name="pat_email" value=<%=p.getEmail()%>  />
						<div class="flex gap-2">
							<input type="date" name="scheduled_date" required/>
							<button type="submit" class="bg-black text-white hover:scale-110 active:scale-90 py-2 px-4 rounded-xl">Book</button>
						</div>						
				</form>
			</div>
		<%}	%>
	</div>
	<% if("true".equals(request.getAttribute("booked"))){ %>
		<script>
			alert("Your Appointment has been Booked Successfully");
		</script>
	 <%}  else {%>
	 	<h1>BOOKED NOT FOUND OR NOT EQUAL</h1>
	 <%} %>		

</div>