<%--
  Created by IntelliJ IDEA.
  User: CHENUMI
  Date: 4/23/2025
  Time: 10:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Order Successful | Bakery System</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    :root {
      --primary-color: #ff6b6b;
      --secondary-color: #4ecdc4;
      --success-color: #28a745;
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
      padding: 40px 0;
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
      max-width: 550px;
      width: 100%;
      margin: 10px auto;
    }

    .success-card {
      background-color: rgba(255, 255, 255, 0.9);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      border-radius: var(--border-radius);
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.3);
      overflow: hidden;
      transition: transform 0.3s, box-shadow 0.3s;
      border: 1px solid rgba(255, 255, 255, 0.1);
      text-align: center;
    }

    .success-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.4);
    }

    .success-header {
      background: linear-gradient(135deg, #28a745, #20c997);
      color: white;
      padding: 25px;
      text-align: center;
      position: relative;
      border-bottom: 3px solid rgba(255, 255, 255, 0.2);
    }

    .success-body {
      padding: 30px;
    }

    .success-icon {
      font-size: 4rem;
      color: #28a745;
      margin-bottom: 20px;
    }

    .btn {
      border-radius: 30px;
      padding: 12px 25px;
      font-weight: 600;
      text-transform: uppercase;
      letter-spacing: 1px;
      transition: all 0.3s;
      border: none;
      margin: 10px 5px;
      color: white;
    }

    .btn-primary {
      background: linear-gradient(135deg, #ff6b6b, #ff5252);
      box-shadow: 0 4px 10px rgba(255, 107, 107, 0.3);
    }

    .btn-primary:hover {
      background: linear-gradient(135deg, #ff5252, #ff3838);
      box-shadow: 0 6px 15px rgba(255, 107, 107, 0.5);
      transform: translateY(-3px);
    }

    .btn-success {
      background: linear-gradient(135deg, #28a745, #218838);
      box-shadow: 0 4px 10px rgba(40, 167, 69, 0.3);
    }

    .btn-success:hover {
      background: linear-gradient(135deg, #218838, #1e7e34);
      box-shadow: 0 6px 15px rgba(40, 167, 69, 0.5);
      transform: translateY(-3px);
    }

    .system-info {
      background-color: rgba(255, 255, 255, 0.9);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      padding: 12px;
      border-radius: var(--border-radius);
      margin-bottom: 20px;
      font-size: 0.8rem;
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
      padding: 12px;
      margin-top: 20px;
      background-color: rgba(0, 0, 0, 0.6);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      border-radius: var(--border-radius);
      border: 1px solid rgba(255, 255, 255, 0.1);
      font-size: 0.85rem;
    }

    .message-text {
      font-size: 1.1rem;
      margin: 15px 0 25px;
      color: #555;
    }

    @media (max-width: 768px) {
      .container {
        padding: 0 20px;
      }

      .system-info {
        flex-direction: column;
        gap: 8px;
        text-align: center;
      }
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
  <!-- Success Card -->
  <div class="success-card">
    <!-- Success Header -->
    <div class="success-header">
      <div class="mb-3">
        <i class="fas fa-check-circle fa-3x"></i>
      </div>
      <h3 class="mb-1">Order Successful!</h3>
      <p class="mb-0 small">Your order has been received</p>
    </div>

    <!-- Success Body -->
    <div class="success-body">
      <i class="fas fa-birthday-cake success-icon"></i>
      <h4>Thank You for Your Order!</h4>
      <p class="message-text">Your order details were saved successfully. We'll start preparing your delicious treats right away!</p>

      <div class="action-buttons">
        <a href="home.jsp" class="btn btn-primary">
          <i class="fas fa-home me-2"></i>Return Home
        </a>
        <a href="ViewOrder.jsp" class="btn btn-success">
          <i class="fas fa-list-alt me-2"></i>View Orders
        </a>
      </div>
    </div>
  </div>

  <!-- Footer Info -->
  <div class="footer-info">
    <p class="mb-0">
      © 2025 Bakery System. All Rights Reserved.
    </p>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    // Animate success card entrance
    const card = document.querySelector('.success-card');
    card.style.opacity = '0';
    card.style.transform = 'translateY(30px)';
    card.style.transition = 'opacity 0.8s ease, transform 0.8s ease';

    setTimeout(() => {
      card.style.opacity = '1';
      card.style.transform = 'translateY(0)';
    }, 300);

    // Button animation
    const buttons = document.querySelectorAll('.btn');
    buttons.forEach((btn, index) => {
      btn.style.opacity = '0';
      btn.style.transform = 'translateY(20px)';
      btn.style.transition = 'opacity 0.5s ease, transform 0.5s ease';

      setTimeout(() => {
        btn.style.opacity = '1';
        btn.style.transform = 'translateY(0)';
      }, 800 + (100 * index));
    });
  });
</script>
</body>
</html>
