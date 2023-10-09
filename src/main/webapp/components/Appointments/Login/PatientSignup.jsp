<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<div class="h-full w-full mt-8 ">
	  <form method="post" action="Register" class="signin-form h-full w-full flex flex-col justify-center items-center text-center">
	  				<input  name="userType" type="hidden" value="patient"/>
					<input  placeholder="Enter Your name"  name="name" type="text" />
					<input  placeholder="Enter Your email"  name="email"  type="text" />
					<input  placeholder="Create Password"  name="password" type="password" />
					<div class="select">
						<select name="gender" id="gender" >
						 	<option value="M">Male</option>
						    <option value="F">FEMALE</option>
						</select>
					</div>
					<button type="submit" class="bg-black text-white p-4 text-xl hover:scale-105 active:scale-90"  >Sign Up</button>
	</form>
  </div>
