package com.routes;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChatRouter
 */
@WebServlet(name="ChatRouter" , urlPatterns={"/ChatRouter","/chat","/Chat"})
public class ChatRouter extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("chat.jsp").forward(request, response);;
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String imageData = request.getParameter("imageData");

        // Process the received image data here, you can save it or perform further operations.

        // Send a response if needed
        response.getWriter().write("Video frame received successfully!");
    }

}
