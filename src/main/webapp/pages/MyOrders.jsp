<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Orders</title>
</head>
<body>
	<% boolean auth = (boolean)request.getSession().getAttribute("auth");
				System.out.println(auth);
				if(!auth){
					response.sendRedirect("/DrPharma/Login");
				}
	%>
	<h1>MY ORDERS</h1>
</body>
</html>