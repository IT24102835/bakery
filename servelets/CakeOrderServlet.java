package com.Bakery1.servelets;

import  com.Bakery1.models.Order;
import com.Bakery1.utils.OrderFileManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.List;

@WebServlet("/CakeOrderServlet")
public class CakeOrderServlet extends HTTPServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String customerName = request.getParameter("customerName");
        String cakeType = request.getParameter("cakeType");
        String cakeFlavour = request.getParameter("cakeFlavour");
        String cakeSize = request.getParameter("cakeSize");
        String message = request.getParameter("message");
        String payment = request.getParameter("payment");

        if (customerName != null && !customerName.trim().isEmpty() &&
                cakeType != null && !cakeType.trim().isEmpty() &&
                cakeFlavour != null && !cakeFlavour.trim().isEmpty() &&
                cakeSize != null && !cakeSize.trim().isEmpty() &&
                message != null && !message.trim().isEmpty() &&
                payment != null && !payment.trim().isEmpty()) {

            try {
                Order order = new Order(customerName, cakeType, cakeFlavour, cakeSize, message, payment);
                String filePath =  OrderFileManager.getFileName();

                OrderFileManager.writeOrderToFile(order, filePath);
                response.sendRedirect("success.jsp");

            } catch (IOException e) {
                response.sendRedirect("cake.jsp?message=Error writing to file: " + e.getMessage());
            }

        } else {
            response.sendRedirect("cake.jsp?message=Invalid input.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String filePath =  OrderFileManager.getFileName();
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            List<String> orders = OrderFileManager.readOrdersFromFile(filePath);

            out.println("<html><head><title>Orders</title>");
            out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' rel='stylesheet'>");
            out.println("</head><body><div class='container mt-5'>");
            out.println("<h2>Registered Cake Orders</h2>");

            if (orders.isEmpty()) {
                out.println("<div class='alert alert-warning'>No cake orders found.</div>");
            } else {
                out.println("<ul class='list-group'>");
                for (String order : orders) {
                    out.println("<li class='list-group-item'>" + order + "</li>");
                }
                out.println("</ul>");
            }

            out.println("<a href='adminDashboard.jsp' class='btn btn-secondary mt-3'>Back to Dashboard</a>");
            out.println("</div></body></html>");

        } catch (IOException e) {
            out.println("<p style='color:red;'>Error reading file: " + e.getMessage() + "</p>");
        }
    }

}
