package com.Bakery1.servlets;

import com.Bakery1.models.BakeryOrder;
import com.Bakery1.utils.BakeryOrderFileManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.List;

@WebServlet("/BakeryOrderServlet")
public class BakeryOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String customerName = request.getParameter("customerName");
        String itemType = request.getParameter("itemType");
        String sauceFlavour = request.getParameter("sauceFlavour");
        String itemCountStr = request.getParameter("itemCount");
        String payment = request.getParameter("payment");

        if (customerName != null && !customerName.trim().isEmpty() &&
                itemType != null && !itemType.trim().isEmpty() &&
                sauceFlavour != null && !sauceFlavour.trim().isEmpty() &&
                itemCountStr != null && !itemCountStr.trim().isEmpty() &&
                payment != null && !payment.trim().isEmpty()) {

            try {
                int itemCount = Integer.parseInt(itemCountStr.trim());
                BakeryOrder order = new BakeryOrder(customerName.trim(), itemType.trim(), sauceFlavour.trim(), itemCount, payment.trim());

                String filePath = BakeryOrderFileManager.getFileName();
                
                // Use CSV format instead of object serialization
                BakeryOrderFileManager.writeOrderAsCSV(order, filePath);

                response.sendRedirect("success1.jsp");

            } catch (NumberFormatException e) {
                response.sendRedirect("BakeryOrder.jsp?message=Invalid number for item count.");
            } catch (IOException e) {
                response.sendRedirect("BakeryOrder.jsp?message=Error writing to file: " + e.getMessage());
            }

        } else {
            response.sendRedirect("BakeryOrder.jsp?message=Please fill in all fields.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String filePath = BakeryOrderFileManager.getFileName();
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Use the new CSV reading method instead
            List<BakeryOrder> orders = BakeryOrderFileManager.readOrdersFromCSV(filePath);

            out.println("<html><head><title>Bakery Orders</title>");
            out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' rel='stylesheet'>");
            out.println("</head><body><div class='container mt-5'>");
            out.println("<h2>Registered Bakery Orders</h2>");

            if (orders.isEmpty()) {
                out.println("<div class='alert alert-warning'>No bakery orders found.</div>");
            } else {
                out.println("<table class='table table-striped'><thead><tr>");
                out.println("<th>Name</th><th>Item</th><th>Sauce</th><th>Count</th><th>Payment</th></tr></thead><tbody>");

                for (BakeryOrder order : orders) {
                    out.println("<tr><td>" + order.getCustomerName() + "</td>");
                    out.println("<td>" + order.getItemType() + "</td>");
                    out.println("<td>" + order.getSauceFlavour() + "</td>");
                    out.println("<td>" + order.getItemCount() + "</td>");
                    out.println("<td>" + order.getPayment() + "</td></tr>");
                }

                out.println("</tbody></table>");
            }

            out.println("<a href='adminDashboard.jsp' class='btn btn-secondary mt-3'>Back to Dashboard</a>");
            out.println("</div></body></html>");

        } catch (IOException e) {
            out.println("<p style='color:red;'>Error reading file: " + e.getMessage() + "</p>");
        }
    }
}