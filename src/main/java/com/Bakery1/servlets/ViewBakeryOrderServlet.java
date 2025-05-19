package com.Bakery1.servlets;
import com.Bakery1.models.BakeryOrder;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.util.*;

@WebServlet("/ViewBakeryOrderServlet")
public class ViewBakeryOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String customerName = request.getParameter("customerName");
        
        // Path to the output2.txt file
        String filePath = getServletContext().getRealPath("/output2.txt");
        
        // Read orders from the file
        List<BakeryOrder> matchedOrders = new ArrayList<>();
        
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                // Skip lines that are not in CSV format or appear to be serialized objects
                if (line.trim().isEmpty() || line.contains("ysr") || !line.contains(",")) {
                    continue;
                }
                
                // Parse CSV line
                String[] parts = line.split(",");
                if (parts.length >= 5) {
                    String orderCustomerName = parts[0].trim();
                    String itemType = parts[1].trim();
                    String sauceFlavour = parts[2].trim();
                    int itemCount = Integer.parseInt(parts[3].trim());
                    String payment = parts[4].trim();
                    
                    // Check if this order matches the requested customer name
                    if (orderCustomerName.equalsIgnoreCase(customerName.trim())) {
                        BakeryOrder order = new BakeryOrder(orderCustomerName, itemType, sauceFlavour, itemCount, payment);
                        matchedOrders.add(order);
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error reading order file: " + e.getMessage());
        }
        
        request.setAttribute("customerName", customerName);
        request.setAttribute("orders", matchedOrders);
        
        // Forward to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("ViewBakeryOrder.jsp");
        dispatcher.forward(request, response);
    }
}