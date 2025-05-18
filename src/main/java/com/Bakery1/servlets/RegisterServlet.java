package com.Bakery1.servlets;

import com.Bakery1.models.Users;
import com.Bakery1.utils.FileManager;
import com.Bakery1.utils.UserValidator;

import java.io.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FILE_NAME = "C:\\Users\\USER\\Desktop\\projectfinal\\bakery\\src\\main\\webapp\\WEB-INF\\users.txt";//users.txt

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String phoneStr = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        
        
        

        if (name != null && !name.trim().isEmpty() &&
                address != null && !address.trim().isEmpty() &&
                city != null && !city.trim().isEmpty() &&
                email != null && !email.trim().isEmpty() &&
                password != null && !password.trim().isEmpty() &&
                phoneStr != null && !phoneStr.trim().isEmpty()) {
        		
        	address = address.replaceAll(",", "%@%"); // Remove commas from address
        	
            try {
            	 UserValidator validator = new UserValidator();
            	  
            	 if (validator.isDuplicateUsername(name)) {
                	  response.sendRedirect("Register.jsp?message=Username already exists! Please choose a different username.");
                      return;
                 }
                  
                  // Check for duplicate email
                 if (validator.isDuplicateEmail(email)) {
            		  response.sendRedirect("Register.jsp?message=Email already exists! Please use a different email address.");
            		  return;
                 }
            	
                 if (validator.isDuplicatePhone(phoneStr)) {
            		  response.sendRedirect("Register.jsp?message=Phone number already exists! Please use a different phone number.");
            		  return;
                 }
                  
                int phone = Integer.parseInt(phoneStr);

                Users user = new Users(name, address, city, phone, email, password);
                String filePath = FILE_NAME;

                // Write user data to the file using FileManager
                FileManager.writeUserToFile(user, filePath);

                
                response.sendRedirect("login.jsp");

            } catch (NumberFormatException e) {
                response.sendRedirect("Register.jsp?message=Invalid phone number.");
            } catch (IOException e) {
                response.sendRedirect("Register.jsp?message=Error writing to file: " + e.getMessage());
            }

        } else {
            response.sendRedirect("Register.jsp?message=Invalid input.");
        }
    }

    
}