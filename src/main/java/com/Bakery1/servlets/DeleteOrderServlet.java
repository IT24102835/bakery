package com.Bakery1.servelets;

import com.Bakery1.models.Order;
import com.Bakery1.utils.OrderFileManager;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.util.*;

@WebServlet("/DeleteOrderServlet")
public class DeleteOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String customerName = request.getParameter("customerName");
        String filePath = OrderFileManager.getFileName();

        List<String> orders = OrderFileManager.readOrdersFromFile(filePath);
        List<String> updatedOrders = new ArrayList<>();

        for (String line : orders) {
            Order order = Order.fromFileString(line);
            if (order != null && !order.getCustomerName().equalsIgnoreCase(customerName)) {
                updatedOrders.add(line);
            }
        }

        OrderFileManager.overwriteOrdersToFile(updatedOrders, filePath);
        response.sendRedirect("cake.jsp?message=Order deleted successfully.");
    }
}
