<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
  <div class="h-full w-full mt-8">
	  <form method="post" action="Register" class="signin-form h-full w-full flex flex-col justify-center items-center text-center">
	  				<input  name="userType" type="hidden" value="doctor"/>
					<input  placeholder="Enter Your email"  name="name" type="text" />
					<input  placeholder="Enter Your email"  name="email"  type="text" />
					<input  placeholder="Create Password"  name="password" type="password" />
					<input  placeholder="Enter Qualification"  name="qualification" type="text" />
					<div class="select">
						<select class="  bg-white text-black "name="dept_no" id="deptno" >
						 	<option value="1">NEUROLOGY</option>
						    <option value="2">MEDICINE</option>
						    <option value="3">PEDIATRICS</option>
						    <option value="4">DERMATOLOGIST</option>
						    <option value="5">UROLOGY</option>
						    <option value="6">GYNAECOLOGY</option>
						    <option value="7">CARDIOLOGY</option>
						    <option value="8">OPHTHALMOLOGY</option>
					</select>
					</div>
					<div class="select">
						<select name="gender" id="gender" >
						 	<option value="M">Male</option>
						    <option value="F">FEMALE</option>
						</select>
					</div>
					<button class="bg-black text-white p-4 text-xl hover:scale-105 active:scale-90" type="submit" >Sign Up</button>
	</form>
  </div>
