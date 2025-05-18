package com.Bakery1.servelets;

import com.Bakery1.models.Order;
import com.Bakery1.utils.OrderFileManager;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.util.*;

@WebServlet("/ViewOrderServlet")
public class ViewOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String customerName = request.getParameter("customerName");
        String filePath = OrderFileManager.getFileName();

        List<String> orders = OrderFileManager.readOrdersFromFile(filePath);
        Order matchedOrder = null;

        for (String line : orders) {
            Order order = Order.fromFileString(line);
            if (order != null && order.getCustomerName().trim().equalsIgnoreCase(customerName.trim())) {
                matchedOrder = order;
                break;
            }
        }

        request.setAttribute("order", matchedOrder);
        request.setAttribute("customerName", customerName);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ViewOrder1.jsp");
        dispatcher.forward(request, response);
    }
}