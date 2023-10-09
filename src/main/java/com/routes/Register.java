package com.routes;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.UserDAO;
import com.Db.DBConnect;
import com.Modals.Doctor;
import com.Modals.Patient;


@WebServlet(name="Register" , urlPatterns = {"/Register","/register"})
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO userDAO = new UserDAO(DBConnect.getConn());
		String userType = request.getParameter("userType");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		System.out.println(userType);
		if("doctor".equals(userType)) {
			String qualifications = request.getParameter("qualification");
			String dept_no = request.getParameter("dept_no");
			LocalDate currentDate = LocalDate.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String join_date = currentDate.format(formatter);
			Doctor doc = new Doctor(name,email,password,join_date,qualifications,Integer.parseInt(dept_no),gender);
			boolean f = userDAO.addDoctor(doc);
			if(f) {
				request.getSession().setAttribute("auth", true);
                request.getSession().setAttribute("userType", "doctor");
                request.getSession().setAttribute("doctor", doc);
				request.getRequestDispatcher("/Dashboard").forward(request, response);
			} else {
				
			}
		} else if("patient".equals(userType)){
			Patient p = new Patient(name,email,password,gender);
			boolean f= userDAO.addPatient(p);
			if(f) {
				request.getSession().setAttribute("auth", true);
                request.getSession().setAttribute("userType", "patient");
                request.getSession().setAttribute("patient", p);
				request.getRequestDispatcher("/Dashboard").forward(request, response);
			} else {
				
			}
		}
	}

}
