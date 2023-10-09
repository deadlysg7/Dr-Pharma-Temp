package com.routes;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Modals.Doctor;
import com.Modals.Patient;


@WebServlet(name="Dashboard", urlPatterns= {"/Dashboard","/dashboard","/DrPharma/Dashboard","/DrPharma/dashboard"})
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object UserType = request.getSession().getAttribute("userType");
		if(UserType.equals("doctor")) {
			System.out.println( request.getSession().getAttribute("doctor"));
		} else if(UserType.equals("patient")) {
			System.out.println( request.getSession().getAttribute("doctor"));
		}
		request.getRequestDispatcher("/pages/Dashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
