<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<%@ include file="/components/utils/commons/tailwind_and_reset.jsp" %>
</head>
<body>
	<% boolean auth1 = (boolean)request.getSession().getAttribute("auth");
			System.out.println(auth1);
			if(!auth1){
				response.sendRedirect("/DrPharma/Login");
			}
	%>
	<% if("doctor".equals(request.getSession().getAttribute("userType"))){ %>
	<div class="h-screen w-screen overflow-x-hidden overflow-y-auto flex  flex-col items-center  p-8 mt-8">
		<%@ include file="/components/Appointments/Dashboard/Doctor/DoctorDashboard.jsp" %>
	</div>
	<%} else if("admin".equals(request.getSession().getAttribute("userType"))) { %>
		<h1>I am A Admin</h1>
	<% } else { %>
		<%@ include file="/components/Appointments/Dashboard/Patient/PatientDashboard.jsp" %>
	<%}%>
</body>
</html>