<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<div class="signin-block w-full h-full  overflow-hidden">
	<div class="signin-block-content  w-full h-4/5">
				<% if("true".equals(request.getParameter("doctor-signup"))) { %>
					<div class="text-5xl  flex gap-3"><h1>Doctor </h1>
						<% if("true".equals(request.getParameter("signup"))) { %> 
						<h1>Sign Up</h1> </div>
						<%@ include file="/components/Appointments/Login/DoctorSignup.jsp" %>
						<%} else { %><h1> Sign In</h1></div><%} %>
				<% } else {%>
					<div class="text-5xl  flex gap-3"><h1>Patient </h1>
						<% if("true".equals(request.getParameter("signup"))) { %> 
						<h1>Sign Up</h1> </div>
						<%@ include file="/components/Appointments/Login/PatientSignup.jsp" %>
						<%} else { %><h1> Sign In</h1></div> <%} %>
				<% }%>
				
				<% if("true".equals(request.getParameter("signup"))) { %>
				
				<% } else { %>
					<form method="post" action="SignIn"  class="signin-form h-full w-full flex flex-col justify-center items-center text-center">
						<% if("true".equals(request.getParameter("doctor-signup"))) { %>
							<input  name="userType" value="doctor"  type="hidden" />
						<%} else { %>
						<input  name="userType" value="patient" type="hidden" />
						<%} %>
						<input name="email"  placeholder="Enter Your email"  type="text" />
						<input name="password" placeholder="Enter Your password"  type="password" />
						<button class="bg-black text-white p-4 text-xl hover:scale-105 active:scale-90" type="submit" >Sign In</button>
					</form>
				<% } %>
				
			<p class="underline text-black text-md text-extrabold my-6">
				<% if("true".equals(request.getParameter("doctor-signup"))) { %>
					<div class="underline  flex justify-center text-center gap-1 items-center align-center align-content-center center">
						<i class="fa-solid fa-user-doctor"></i>
							<% if("true".equals(request.getParameter("signup"))) { %> <a href="/DrPharma/Login?doctor-signup=true&signup=false">Already A  User ? Sign In</a>
							<%} else { %><a class="text-md" href="/DrPharma/Login?doctor-signup=true&signup=true">Create a New Doctor Account with us</a> <%} %>
					</div>

					</div>
				<% } else {%>
					<div class="underline  flex justify-center text-center gap-1 items-center align-center align-content-center center">
						<i class="fa-solid fa-user-nurse"></i>
						<% if("true".equals(request.getParameter("signup"))) { %> <a href="/DrPharma/Login?doctor-signup=false&signup=false">Already A  User ? Sign In</a>
						<%} else { %><a class="text-md" href="/DrPharma/Login?doctor-signup=false&signup=true">Create a New Patient Account with us</a> <%} %>
					</div>
				<% }%>
			</p>
	</div>
</div>





