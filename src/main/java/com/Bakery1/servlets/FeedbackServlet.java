package com.Bakery1.servlets;

import com.Bakery1.models.Feedback;
import com.Bakery1.utils.FeedbackFileManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String message = request.getParameter("message");

        if (name != null && message != null && !name.trim().isEmpty() && !message.trim().isEmpty()) {
            Feedback feedback = new Feedback(name, message);
            String filePath = getServletContext().getRealPath("/") + "feedbacks.txt";
            FeedbackFileManager.saveFeedback(feedback, filePath);
            response.sendRedirect("ViewFeedback.jsp");
        } else {
            response.sendRedirect("feedback.jsp?error=Please fill in all fields.");
        }
    }
}