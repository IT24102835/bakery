package com.Bakery1.servlets;

import com.Bakery1.models.Users;
import com.Bakery1.utils.FileManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String FILE_NAME = "C:\\Users\\USER\\Desktop\\projectfinal\\bakery\\src\\main\\webapp\\WEB-INF\\users.txt";//users.txt

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("username"); // field name could be 'email'
        String password = request.getParameter("password");

     
        // Path to the file
        String filePath = FILE_NAME;

        // Read users
        List<Users> users = FileManager.readUsersAsObjects(filePath);

        // Check if any user matches
        for (Users user : users) {
            if (user.getEmail().equals(email) || user.getName().equals(email) && user.getPassword().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", user);
                response.sendRedirect("home.jsp");
                return;
            }
        }


        response.sendRedirect("login.jsp?error=Invalid email, username or password.");
    }
}