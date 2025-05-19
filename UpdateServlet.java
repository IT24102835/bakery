package com.Bakery1.servlets;

import com.Bakery1.models.Users;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import com.Bakery1.utils.UserValidator;

// Servlet annotation to map this servlet to the URL "/UpdateServlet"
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {

    // Constant file path to the user data file
    private static final String FILE_NAME = "C:\\Users\\USER\\Desktop\\projectfinal\\bakery\\src\\main\\webapp\\WEB-INF\\users.txt";
    
    // Handles POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String originalEmail = request.getParameter("originalEmail");
        
        // Retrieve updated user details from form parameters
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String phoneStr = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
 
        // File path to user data
        String filePath = FILE_NAME;
       
        List<String> lines = new ArrayList<>();
        try {
            UserValidator validator = new UserValidator();

            // Get current user from session
            Users currentUser = (Users) request.getSession().getAttribute("currentUser");
            
            // Only check for duplicate username if it's changed
            if (!name.equals(currentUser.getName()) && validator.isDuplicateUsername(name)) {
                response.sendRedirect("update.jsp?message=Username already exists! Please choose a different username.");
                return;
            }

            // Only check for duplicate email if it's changed
            if (!email.equals(originalEmail) && validator.isDuplicateEmail(email)) {
                response.sendRedirect("update.jsp?message=Email already exists! Please use a different email address.");
                return;
            }

            int phone = Integer.parseInt(phoneStr);
            
            // Only check for duplicate phone if it's changed
            if (phone != currentUser.getPhone() && validator.isDuplicatePhone(phoneStr)) {
                response.sendRedirect("update.jsp?message=Phone number already exists! Please use a different phone number.");
                return;
            }

            // Read all users from file, skip the current user's record
            try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    if (line.contains(originalEmail)) continue; // skip old record
                    lines.add(line);
                }
            }

            // Create updated user object and add to lines
            Users updatedUser = new Users(name, address, city, phone, email, password);
            lines.add(updatedUser.toString());

            // Write all lines back to file
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
                for (String l : lines) {
                    writer.write(l);
                    writer.newLine();
                }
            }

            // Update session with new user data
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", updatedUser);

            response.sendRedirect("profile.jsp");
   
        } catch (NumberFormatException e) {
            response.sendRedirect("update.jsp?message=Invalid phone number format.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("update.jsp?message=An error occurred while updating your profile: " + e.getMessage());
        }
    }
}
