package com.utilityServlets;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.AppointmentDAO;
import com.Db.DBConnect;
import com.Modals.Appointment;


@WebServlet(name="BookAppointment" , urlPatterns={"/BookAppointment","/bookAppointment","/BookAppointments","/bookAppointments"})
public class BookAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/pages/Dashboard.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String doc_email=request.getParameter("doc_email");
		String pat_email=request.getParameter("pat_email");
		LocalDate currentDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String made_on = currentDate.format(formatter);
		LocalDate scheduled_date = LocalDate.parse((String)(request.getParameter("scheduled_date")), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		Appointment app = new Appointment(made_on,scheduled_date.toString(),"PENDING","",pat_email,doc_email);
		AppointmentDAO appDAO = new AppointmentDAO(DBConnect.getConn());
		boolean f = appDAO.BookAppointmnet(app);
		if (f) {
			request.setAttribute("booked", "true");
		} 
		doGet(request,response);
	}

}
