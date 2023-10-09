<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% if("true".equals(request.getParameter("doctor-signup"))) { %>
<style>
	.signup-section{
		grid-column: 1/2;
	}
	.dark-section{
		grid-column: 2/3;
	}
	.black-block {
		background-color: black;
		animation: fade-in-right 0.6s ease-in-out;
		color: white;
	}
	
</style>
<% }%>  
<div class="black-block w-full h-full  overflow-hidden"  >

	<div class="black-block-content w-full h-full ">
		<% if("true".equals(request.getParameter("doctor-signup"))) { %>
					<div class="text-5xl "><h1>Welcome Doctor</h1></div>
				<% } else {%>
					<div class="text-5xl "><h1>Welcome Patient</h1></div>
		<% }%>
		
		
		<div class=" text-lg">
			<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. </p>
		</div>
		
		<div class=" w-full flex justify-center items-center text-center">
			
				<% if("true".equals(request.getParameter("doctor-signup"))) { %>
					<a href="/DrPharma/login?doctor-signup=false" class="set-doctor-link  border-4 border-white border-solid hover:bg-white hover:text-black py-2 px-4  w-2/5 cursor-pointer ">
						<div class="flex justify-around items-center text-xl">I AM A PATIENT<i class="fa-solid fa-angles-right fa-beat" ></i></div>
					</a>
				<% } else {%>
					<a href="/DrPharma/login?doctor-signup=true" class="set-doctor-link  border-4 border-white border-solid hover:bg-white hover:text-black py-2 px-4  w-2/5 cursor-pointer">
						<div class="flex justify-around items-center text-xl"><i class="fa-solid fa-angles-left fa-beat" ></i>I AM A DOCTOR</div>
					</a>
				<% }%>
			
		</div>
	</div>
</div> 
    