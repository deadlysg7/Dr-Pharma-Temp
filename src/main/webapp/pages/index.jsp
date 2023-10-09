<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dr.Pharma</title>
<link rel="stylesheet" href="components/utils/commons/css_reset.css">
<link rel="stylesheet" href="styles/Appointments/index.css" />
<%@ include file="/components/utils/commons/tailwind_and_reset.jsp" %>
</head>
<body>
	<div class="home-page">
		<!--DOCTOR SECTION - 50% on PAGE  --> 
		<div class="dark-section">
			<%@ include file="/components/Appointments/Login/BlackScreen.jsp" %>
		</div>
		<!-- PATIENT SECTION - 50% on PAGE  --> 
		<div class="signup-section">
			<%@ include file="/components/Appointments/Login/SignUp.jsp" %>
		</div>
	</div>
</body>
</html>