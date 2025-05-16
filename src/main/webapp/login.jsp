<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.9)),
                        url('images/1.jpg') center/cover fixed;
            min-height: 100vh;
        }
        .login-card {
            max-width: 400px;
            border-radius: 15px;
            animation: slideUp 0.5s ease-out;
            background: rgba(255, 255, 255, 0.97);
        }
        .form-title {
            color: #ff4d4d;
            font-weight: 700;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }
        .form-control:focus {
            border-color: #ff4d4d;
            box-shadow: 0 0 0 0.25rem rgba(255, 77, 77, 0.25);
        }
        .btn-login {
            background: #ff4d4d;
            color: white;
            padding: 12px 0;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 77, 77, 0.3);
        }
        @keyframes slideUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .admin-link {
            position: relative;
            display: inline-block;
            animation: popEffect 1.5s infinite alternate;
        }
        @keyframes popEffect {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }
    </style>
</head>
<body class="d-flex justify-content-center align-items-center">
    <div class="login-card card shadow-lg p-4">
        <h3 class="form-title text-center mb-4 display-5 fw-bold">Welcome Back</h3>
        
        <form action="LoginServlet" method="post">
            <div class="mb-4">
                <div class="form-floating">
                    <input type="text" class="form-control" name="username" 
                           placeholder="name@example.com" required>
                    <label>Email or Username</label>
                </div>
            </div>

            <div class="mb-4">
                <div class="form-floating">
                    <input type="password" class="form-control" name="password" 
                           placeholder="Password" required>
                    <label>Password</label>
                </div>
            </div>

            <button type="submit" class="btn btn-login btn-lg w-100 mb-3">
                <i class="fas fa-sign-in-alt me-2"></i>Login
            </button>

            <div class="text-center mt-4">
                <p class="text-muted mb-2">Don't have an account? 
                    <a href="Register.jsp" class="text-decoration-none text-danger fw-bold">Register Here</a>
                </p>
                <a href="#" class="text-decoration-none text-muted">Forgot Password?</a>
                <p class="mt-2">
                    <a href="adminLogin.jsp" class="admin-link text-decoration-none text-danger fw-bold">Admin Login</a>
                </p>
            </div>
        </form>

        <%-- Add error message handling --%>
        <% String error = request.getParameter("error"); %>
        <% if (error != null) { %>
            <div class="alert alert-danger mt-4 text-center" role="alert">
                <%= error %>
            </div>
        <% } %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/your-kit-code.js"></script>
</body>
</html>