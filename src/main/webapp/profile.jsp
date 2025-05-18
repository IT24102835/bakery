<%@ page import="com.Bakery1.models.Users" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>User Profile | Bakery System</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #ff6b6b;
            --secondary-color: #4ecdc4;
            --dark-color: #333;
            --light-color: #f8f9fa;
            --border-radius: 10px;
            --box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            --overlay-color: rgba(0, 0, 0, 0.7);
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            color: #444;
            min-height: 100vh;
            position: relative;
            padding-top: 20px;
            padding-bottom: 20px;
            margin: 0;
            background-color: #000;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        /* Background image and overlay */
        .bg-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            overflow: hidden;
        }
        
        .bg-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('images/1.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            filter: brightness(0.7) contrast(1.1);
        }
        
        .bg-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(
                135deg, 
                rgba(0, 0, 0, 0.85) 0%, 
                rgba(0, 0, 0, 0.7) 40%, 
                rgba(0, 0, 0, 0.6) 100%
            );
            backdrop-filter: blur(3px);
        }
        
        .container {
            position: relative;
            z-index: 1;
            max-width: 600px; /* Further reduced for a more compact view */
            width: 100%;
            margin: 0 auto;
            padding: 0 10px;
        }
        
        .profile-card {
            background-color: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: var(--border-radius);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            margin-bottom: 30px;
            transition: transform 0.3s, box-shadow 0.3s;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .profile-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.4);
        }
        
        .profile-header {
            background: linear-gradient(135deg, #ff6b6b, #ff8e8e);
            color: white;
            padding: 18px; /* Further reduced padding */
            text-align: center;
            position: relative;
            border-bottom: 3px solid rgba(255, 255, 255, 0.2);
        }
        
        .profile-avatar {
            width: 80px; /* Further reduced size */
            height: 80px; /* Further reduced size */
            border-radius: 50%;
            background-color: #fff;
            padding: 3px;
            margin: 0 auto 8px; /* Reduced bottom margin */
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .avatar-icon {
            font-size: 40px; /* Further reduced size */
            color: var(--primary-color);
        }
        
        .profile-info {
            padding: 18px; /* Reduced padding */
        }
        
        .info-item {
            margin-bottom: 12px; /* Reduced margin */
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            padding-bottom: 12px; /* Reduced padding */
            transition: all 0.3s;
        }
        
        .info-item:hover {
            transform: translateX(5px);
        }
        
        .info-item:last-child {
            border-bottom: none;
            margin-bottom: 0;
        }
        
        .info-label {
            font-weight: 600;
            color: var(--dark-color);
            margin-bottom: 3px; /* Reduced margin */
            display: block;
            font-size: 0.75rem; /* Reduced font size */
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .info-value {
            color: #555;
            font-size: 0.95rem; /* Reduced font size */
            display: flex;
            align-items: center;
        }
        
        .info-value i {
            margin-right: 8px; /* Reduced margin */
            color: var(--primary-color);
            width: 18px; /* Reduced width */
            text-align: center;
        }
        
        .divider {
            height: 1px;
            background-color: rgba(0, 0, 0, 0.1);
            margin: 5px 0 12px; /* Reduced margin */
        }
        
        /* Improved button responsiveness */
        .profile-actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(85px, 1fr)); /* Responsive grid with minimum 85px columns */
            gap: 6px; /* Reduced gap */
            padding: 0 12px 12px; /* Reduced padding */
        }
        
        .btn {
            border-radius: 20px; /* Further reduced border-radius */
            padding: 6px 10px; /* Reduced padding */
            font-weight: 500; /* Lighter weight for smaller text */
            text-transform: uppercase;
            letter-spacing: 0.5px; /* Reduced letter spacing */
            transition: all 0.3s;
            border: none;
            font-size: 0.7rem; /* Further reduced font size */
            white-space: nowrap; /* Prevent text wrapping in buttons */
            height: 30px; /* Fixed height for consistency */
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .btn i {
            font-size: 0.8rem; /* Smaller icons */
            margin-right: 4px; /* Reduced margin */
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #ff6b6b, #ff5252);
            box-shadow: 0 2px 8px rgba(255, 107, 107, 0.3); /* Reduced shadow */
            color: white;
        }
        
        .btn-primary:hover {
            background: linear-gradient(135deg, #ff5252, #ff3838);
            box-shadow: 0 4px 12px rgba(255, 107, 107, 0.5); /* Reduced shadow on hover */
            transform: translateY(-2px); /* Reduced hover movement */
            color: white;
        }
        
        .btn-warning {
            background: linear-gradient(135deg, #ffc107, #ffb100);
            box-shadow: 0 2px 8px rgba(255, 193, 7, 0.3);
        }
        
        .btn-warning:hover {
            background: linear-gradient(135deg, #ffb100, #ff9d00);
            box-shadow: 0 4px 12px rgba(255, 193, 7, 0.5);
            transform: translateY(-2px);
        }
        
        .btn-danger {
            background: linear-gradient(135deg, #dc3545, #c82333);
            box-shadow: 0 2px 8px rgba(220, 53, 69, 0.3);
        }
        
        .btn-danger:hover {
            background: linear-gradient(135deg, #c82333, #bd2130);
            box-shadow: 0 4px 12px rgba(220, 53, 69, 0.5);
            transform: translateY(-2px);
        }
        
        .btn-info {
            background: linear-gradient(135deg, #17a2b8, #138496);
            box-shadow: 0 2px 8px rgba(23, 162, 184, 0.3);
            color: white;
        }
        
        .btn-info:hover {
            background: linear-gradient(135deg, #138496, #117a8b);
            box-shadow: 0 4px 12px rgba(23, 162, 184, 0.5);
            transform: translateY(-2px);
            color: white;
        }
        
        .btn-success {
            background: linear-gradient(135deg, #28a745, #218838);
            box-shadow: 0 2px 8px rgba(40, 167, 69, 0.3);
            color: white;
        }
        
        .btn-success:hover {
            background: linear-gradient(135deg, #218838, #1e7e34);
            box-shadow: 0 4px 12px rgba(40, 167, 69, 0.5);
            transform: translateY(-2px);
            color: white;
        }
        
        .system-info {
            background-color: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            padding: 8px; /* Reduced padding */
            border-radius: var(--border-radius);
            margin-bottom: 12px; /* Reduced margin */
            font-size: 0.7rem; /* Reduced size */
            color: #495057;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .footer-info {
            color: white;
            text-align: center;
            padding: 8px; /* Reduced padding */
            margin-top: 12px; /* Reduced margin */
            background-color: rgba(0, 0, 0, 0.6);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: var(--border-radius);
            border: 1px solid rgba(255, 255, 255, 0.1);
            font-size: 0.75rem; /* Reduced size */
        }
        
        /* Custom responsive breakpoints */
        @media (max-width: 480px) {
            .profile-actions {
                grid-template-columns: repeat(3, 1fr); /* 3 buttons per row on very small screens */
            }
            
            .btn {
                padding: 5px 8px; /* Further reduced padding */
                font-size: 0.65rem; /* Further reduced font size */
            }
            
            .btn i {
                margin-right: 3px; /* Further reduced margin */
            }
        }
        
        @media (max-width: 360px) {
            .profile-actions {
                grid-template-columns: repeat(2, 1fr); /* 2 buttons per row on extremely small screens */
            }
        }
        
        @media (max-width: 768px) {
            .container {
                max-width: 95%;
                padding: 0 8px;
            }
            
            .system-info {
                flex-direction: column;
                gap: 4px;
                text-align: center;
            }
            
            h3 {
                font-size: 1.3rem; /* Smaller heading on mobile */
            }
        }
        
        .action-btn {
            text-decoration: none;
            width: 100%;
        }
        
    </style>
</head>
<body>
    <!-- Background container with overlay -->
    <div class="bg-container">
        <div class="bg-image"></div>
        <div class="bg-overlay"></div>
    </div>

    <div class="container">
        <%
            Users user = (Users) session.getAttribute("currentUser");
            if (user == null) {
                response.sendRedirect("Register.jsp?message=Please register first.");
                return;
            }
        %>       
        <!-- Consolidated Profile Card -->
        <div class="profile-card">
            <!-- Profile Header -->
            <div class="profile-header">
                <div class="profile-avatar">
                    <i class="fas fa-user avatar-icon"></i>
                </div>
                <h3 class="mb-1"><%= user.getName() %></h3>
                <p class="mb-0 small">Personal Profile</p>
            </div>
            
            <!-- Profile Information -->
            <div class="profile-info">
                <div class="info-item">
                    <span class="info-label">Email Address</span>
                    <div class="info-value">
                        <i class="fas fa-envelope"></i>
                        <%= user.getEmail() %>
                    </div>
                </div>
                
                <div class="info-item">
                    <span class="info-label">Phone Number</span>
                    <div class="info-value">
                        <i class="fas fa-phone"></i>
                        <%= user.getPhone() %>
                    </div>
                </div>
                
                <div class="info-item">
                    <span class="info-label">Address</span>
                    <div class="info-value">
                        <i class="fas fa-map-marker-alt"></i>
                        <%= user.getAddress().replaceAll("%@%", ",") %>
                    </div>
                </div>
                
                <div class="info-item">
                    <span class="info-label">City</span>
                    <div class="info-value">
                        <i class="fas fa-city"></i>
                        <%= user.getCity() %>
                    </div>
                </div>
            </div>
            
            <!-- Divider -->
            <div class="divider"></div>
            
            <!-- Profile Actions - Responsive Grid Layout -->
            <div class="profile-actions">
                <form action="home.jsp" method="get" class="action-btn">
                    <button class="btn btn-primary w-100">
                        <i class="fas fa-home"></i> Dashboard
                    </button>
                </form>
                
                <form action="update.jsp" method="get" class="action-btn">
                    <button class="btn btn-warning w-100">
                        <i class="fas fa-edit"></i> Edit
                    </button>
                </form>
                
                <form action="ViewBakeryOrder.jsp" method="get" class="action-btn">
                    <button class="btn btn-info w-100">
                        <i class="fas fa-shopping-bag"></i> Orders
                    </button>
                </form>
                
                <form action="ViewOrder.jsp" method="get" class="action-btn">
                    <button class="btn btn-success w-100">
                        <i class="fas fa-birthday-cake"></i> Custom
                    </button>
                </form>
                
                <form action="DeleteServlet" method="post" class="action-btn">
                    <input type="hidden" name="email" value="<%= user.getEmail() %>">
                    <button class="btn btn-danger w-100">
                        <i class="fas fa-trash-alt"></i> Delete
                    </button>
                </form>
            </div>
        </div>
        
        <!-- Footer Info -->
        <div class="footer-info">
            <p class="mb-0">
                © 2025 Bakery System. All rights reserved. | User: <%= user.getName() %> 
            </p>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Add some subtle animations
        document.addEventListener('DOMContentLoaded', function() {
            // Animate profile card entrance
            const cards = document.querySelectorAll('.profile-card');
            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(30px)';
                card.style.transition = 'opacity 0.8s ease, transform 0.8s ease';
                
                setTimeout(() => {
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, 300 * index);
            });
            
            // Animate info items with a delay
            const items = document.querySelectorAll('.info-item');
            items.forEach((item, index) => {
                item.style.opacity = '0';
                item.style.transform = 'translateX(-20px)';
                item.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
                
                setTimeout(() => {
                    item.style.opacity = '1';
                    item.style.transform = 'translateX(0)';
                }, 500 + (100 * index));
            });
            
            // Animate buttons with a staggered effect
            const buttons = document.querySelectorAll('.action-btn');
            buttons.forEach((btn, index) => {
                btn.style.opacity = '0';
                btn.style.transform = 'translateY(10px)';
                btn.style.transition = 'opacity 0.4s ease, transform 0.4s ease';
                
                setTimeout(() => {
                    btn.style.opacity = '1';
                    btn.style.transform = 'translateY(0)';
                }, 800 + (100 * index));
            });
        });
    </script>
</body>
</html>