package com.utilityServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.AppointmentDAO;
import com.Db.DBConnect;

/**
 * Servlet implementation class CancelAppointment
 */
@WebServlet(name="CancelAppointment", urlPatterns={"/CancelAppointment","/DrPharma/CancelAppointment"})
public class CancelAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AppointmentDAO app = new AppointmentDAO(DBConnect.getConn());
		if (app.CancelAppointment(Integer.parseInt(request.getParameter("id")))) {
			request.setAttribute("appointment-cancelled", true);
		}
		response.sendRedirect("/DrPharma/Dashboard");
	}
}
