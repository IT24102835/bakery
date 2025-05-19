package com.Bakery1.servlets;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {

    private static final String FILE_NAME = "C:\\Users\\USER\\Desktop\\projectfinal\\cakeshop\\src\\main\\webapp\\WEB-INF\\users.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");

        String filePath =  FILE_NAME;
        List<String> lines = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                // Add the line only if it does not contain the e mail
                if (!line.contains(email)) {
                    lines.add(line);
                }
            }
        }
        // Overwrite the file with the remaining lines
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (String l : lines) {
                writer.write(l);
                writer.newLine();
            }
        }

        request.getSession().invalidate(); // log out
        // Redirect to confirmation page with success message
        response.sendRedirect("delete1.jsp?message=Account deleted successfully.");
    }
}
