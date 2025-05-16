<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.9)),
                        url('images/1.jpg') center/cover fixed;
            min-height: 100vh;
        }
        .registration-container {
            max-width: 600px;
            margin: auto;
            animation: fadeIn 0.5s ease-in;
        }
        .form-header {
            color: #ff4d4d;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }
        .form-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .form-control:focus {
            border-color: #ff4d4d;
            box-shadow: 0 0 0 0.25rem rgba(255, 77, 77, 0.25);
        }
        .btn-register {
            background: #ff4d4d;
            color: white;
            padding: 12px 0;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 77, 77, 0.3);
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body class="d-flex align-items-center">
    <div class="container registration-container">
        <h2 class="form-header text-center mb-4 display-4 fw-bold">Create Account</h2>
        
        <div class="form-container p-4 p-md-5">
            <form action="RegisterServlet" method="post">
                <div class="row g-3">
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="name" placeholder="Name" required>
                            <label>Full Name</label>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="email" class="form-control" name="email" placeholder="Email" required>
                            <label>Email Address</label>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="address" placeholder="Address" required>
                            <label>Street Address</label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="city" placeholder="City" required>
                            <label>City</label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="tel" class="form-control" name="phone" placeholder="Phone" required>
                            <label>Phone Number</label>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="form-floating">
                            <input type="password" class="form-control" name="password" placeholder="Password" required>
                            <label>Create Password</label>
                        </div>
                    </div>

                    <div class="col-12">
                        <button type="submit" class="btn btn-register btn-lg w-100">
                            Register Now <i class="fas fa-arrow-right ms-2"></i>
                        </button>
                    </div>

                    <div class="col-12 text-center mt-3">
                        <p class="text-muted">Already have an account? 
                            <a href="login.jsp" class="text-decoration-none text-danger">Login here</a>
                        </p>
                    </div>
                </div>
            </form>

            <% String message = request.getParameter("message"); %>
            <% if (message != null) { %>
                <div class="alert alert-success mt-4 text-center" role="alert">
                    <%= message %>
                </div>
            <% } %>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/your-kit-code.js"></script>
</body>
</html>