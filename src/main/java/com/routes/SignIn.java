package com.routes;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.DAO.UserDAO;
import com.Db.DBConnect;
import com.Modals.Doctor;
import com.Modals.Patient;
import com.Modals.User;


@WebServlet(name="SignIn", urlPatterns={"/SignIn","/signin"})
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userType=request.getParameter("userType");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(email+password+userType);
		UserDAO userDAO = new UserDAO(DBConnect.getConn());
		if("doctor".equals(userType)) {
			Doctor doc = userDAO.getDoctor(new User(email,password));
			if(doc!=null) {
				request.getSession().setAttribute("auth", true);
                request.getSession().setAttribute("userType", "doctor");
                request.getSession().setAttribute("doctor", doc);
				request.getRequestDispatcher("/Dashboard").forward(request, response);
			} else {
				request.setAttribute("authInvalid", true);
				request.getRequestDispatcher("/DrPharma/Login").forward(request, response);
				
				
			}
		} else if("patient".equals(userType)) {
			Patient p = userDAO.getPatient(new User(email,password));
			System.out.println(p);
			if(p!=null) {
				request.getSession().setAttribute("auth", true);
                request.getSession().setAttribute("userType", "patient");
                request.getSession().setAttribute("patient", p);
				request.getRequestDispatcher("/Dashboard").forward(request, response);
			}else {
				request.setAttribute("authInvalid", true);
				request.getRequestDispatcher("/Login").forward(request, response);
			}
		}
		
	}

}
