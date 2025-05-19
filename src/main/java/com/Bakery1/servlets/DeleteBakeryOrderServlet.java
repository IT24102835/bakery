package com.Bakery1.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import com.Bakery1.utils.BakeryOrderFileManager;

@WebServlet("/DeleteBakeryOrderServlet")
public class DeleteBakeryOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String customerName = request.getParameter("customerName");
        String filePath = BakeryOrderFileManager.getFileName();

        try {
            BakeryOrderFileManager.deleteOrderByCustomerName(customerName, filePath);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("message", "Order deleted successfully for: " + customerName);
        request.getRequestDispatcher("delete.jsp").forward(request, response);
    }
}
