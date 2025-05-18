<%--
  Created by IntelliJ IDEA.
  User: CHENUMI
  Date: 4/29/2025
  Time: 09:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.Bakery1.models.Order" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Your Order Details | Bakery System</title>
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
      max-width: 500px;
      width: 100%;
      margin: 10px auto;
    }

    /* System info bar at the top */
    .system-info-bar {
      background-color: rgba(255, 255, 255, 0.15);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      border-radius: var(--border-radius);
      margin-bottom: 15px;
      padding: 10px 15px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      color: rgba(255, 255, 255, 0.8);
      font-size: 0.75rem;
      border: 1px solid rgba(255, 255, 255, 0.1);
    }

    .system-info-bar .date-time {
      display: flex;
      align-items: center;
    }

    .system-info-bar .date-time i {
      margin-right: 6px;
      font-size: 0.8rem;
    }

    .system-info-bar .user-login {
      display: flex;
      align-items: center;
    }

    .system-info-bar .user-login i {
      margin-right: 6px;
      font-size: 0.8rem;
    }

    .order-card {
      background-color: rgba(255, 255, 255, 0.9);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      border-radius: var(--border-radius);
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.3);
      overflow: hidden;
      transition: transform 0.3s, box-shadow 0.3s;
      border: 1px solid rgba(255, 255, 255, 0.1);
    }

    .order-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.4);
    }

    .order-header {
      background: linear-gradient(135deg, #ff6b6b, #ff8e8e);
      color: white;
      padding: 25px;
      text-align: center;
      position: relative;
      border-bottom: 3px solid rgba(255, 255, 255, 0.2);
    }

    .order-body {
      padding: 30px;
      text-align: center;
    }

    .order-details {
      text-align: left;
      margin-bottom: 25px;
      background-color: rgba(255, 255, 255, 0.5);
      border-radius: var(--border-radius);
      padding: 15px 20px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }

    .detail-item {
      padding: 8px 0;
      border-bottom: 1px solid rgba(0,0,0,0.05);
      display: flex;
      align-items: center;
    }

    .detail-item:last-child {
      border-bottom: none;
    }

    .detail-item i {
      margin-right: 10px;
      color: var(--primary-color);
      width: 20px;
      text-align: center;
    }

    .detail-label {
      font-weight: 600;
      margin-right: 5px;
      color: var(--dark-color);
    }

    .detail-value {
      flex-grow: 1;
      text-align: right;
    }

    .btn {
      border-radius: 30px;
      padding: 12px 25px;
      font-weight: 600;
      text-transform: uppercase;
      letter-spacing: 1px;
      transition: all 0.3s;
      border: none;
      cursor: pointer;
      margin-top: 15px;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 100%;
    }

    .btn i {
      margin-right: 8px;
    }

    .btn-primary {
      background: linear-gradient(135deg, #4ecdc4, #2dbeb1);
      box-shadow: 0 4px 10px rgba(78, 205, 196, 0.3);
      color: white;
    }

    .btn-primary:hover {
      background: linear-gradient(135deg, #2dbeb1, #26a69a);
      box-shadow: 0 6px 15px rgba(78, 205, 196, 0.5);
      transform: translateY(-3px);
    }

    .btn-danger {
      background: linear-gradient(135deg, #e74c3c, #c0392b);
      box-shadow: 0 4px 10px rgba(231, 76, 60, 0.3);
      color: white;
    }

    .btn-danger:hover {
      background: linear-gradient(135deg, #c0392b, #a93226);
      box-shadow: 0 6px 15px rgba(231, 76, 60, 0.5);
      transform: translateY(-3px);
    }

    .btn-secondary {
      background: linear-gradient(135deg, #6c757d, #495057);
      box-shadow: 0 4px 10px rgba(108, 117, 125, 0.3);
      color: white;
      text-decoration: none;
    }

    .btn-secondary:hover {
      background: linear-gradient(135deg, #5a6268, #343a40);
      box-shadow: 0 6px 15px rgba(108, 117, 125, 0.5);
      transform: translateY(-3px);
      color: white;
    }

    .not-found {
      color: #e74c3c;
      text-align: center;
      padding: 15px;
      font-size: 1.1rem;
      background-color: rgba(231, 76, 60, 0.1);
      border-radius: var(--border-radius);
      margin-bottom: 20px;
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

    @media (max-width: 768px) {
      .container {
        padding: 0 20px;
      }

      .system-info-bar {
        flex-direction: column;
        gap: 5px;
        text-align: center;
      }

      .btn {
        padding: 10px 15px;
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
  <div class="order-card">
    <!-- Order Header -->
    <div class="order-header">
      <div class="mb-3">
        <i class="fas fa-birthday-cake fa-3x"></i>
      </div>
      <h3 class="mb-1">Your Order Details</h3>
      <p class="mb-0 small">Custom cake order information</p>
    </div>

    <!-- Order Body -->
    <div class="order-body">
      <%
        Order order = (Order) request.getAttribute("order");
        String customerName = (String) request.getAttribute("customerName");

        if (order != null) {
      %>
      <div class="order-details">
        <div class="detail-item">
          <i class="fas fa-user"></i>
          <span class="detail-label">Name:</span>
          <span class="detail-value"><%= order.getCustomerName() %></span>
        </div>
        <div class="detail-item">
          <i class="fas fa-birthday-cake"></i>
          <span class="detail-label">Type:</span>
          <span class="detail-value"><%= order.getCakeType() %></span>
        </div>
        <div class="detail-item">
          <i class="fas fa-cookie-bite"></i>
          <span class="detail-label">Flavour:</span>
          <span class="detail-value"><%= order.getCakeFlavour() %></span>
        </div>
        <div class="detail-item">
          <i class="fas fa-ruler"></i>
          <span class="detail-label">Size:</span>
          <span class="detail-value"><%= order.getCakeSize() %></span>
        </div>
        <div class="detail-item">
          <i class="fas fa-comment"></i>
          <span class="detail-label">Message:</span>
          <span class="detail-value"><%= order.getMessage() %></span>
        </div>
        <div class="detail-item">
          <i class="fas fa-credit-card"></i>
          <span class="detail-label">Payment:</span>
          <span class="detail-value"><%= order.getPayment() %></span>
        </div>
      </div>

      <!-- Action Buttons -->
      <a href="feedback.jsp" class="btn btn-primary">
        <i class="fas fa-comment-alt"></i>Enter Your Feedback
      </a>

      <form action="DeleteOrderServlet" method="post">
        <input type="hidden" name="customerName" value="<%= customerName %>" />
        <button type="submit" class="btn btn-danger">
          <i class="fas fa-trash-alt"></i>Delete My Order
        </button>
      </form>
      <%
      } else {
      %>
      <div class="not-found">
        <i class="fas fa-exclamation-circle me-2"></i>
        No order found for: <%= customerName %>
      </div>
      <%
        }
      %>

      <a href="home.jsp" class="btn btn-secondary">
        <i class="fas fa-arrow-left"></i>Back to Dashboard
      </a>
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
    // Animate card entrance
    const card = document.querySelector('.order-card');
    card.style.opacity = '0';
    card.style.transform = 'translateY(30px)';
    card.style.transition = 'opacity 0.8s ease, transform 0.8s ease';

    setTimeout(() => {
      card.style.opacity = '1';
      card.style.transform = 'translateY(0)';
    }, 300);

    // Animate system info bar
    const infoBar = document.querySelector('.system-info-bar');
    if (infoBar) {
      infoBar.style.opacity = '0';
      infoBar.style.transform = 'translateY(-20px)';
      infoBar.style.transition = 'opacity 0.5s ease, transform 0.5s ease';

      setTimeout(() => {
        infoBar.style.opacity = '1';
        infoBar.style.transform = 'translateY(0)';
      }, 200);
    }

    // Animate order details with staggered effect
    const detailItems = document.querySelectorAll('.detail-item');
    detailItems.forEach((item, index) => {
      item.style.opacity = '0';
      item.style.transform = 'translateX(-20px)';
      item.style.transition = 'opacity 0.5s ease, transform 0.5s ease';

      setTimeout(() => {
        item.style.opacity = '1';
        item.style.transform = 'translateX(0)';
      }, 400 + (100 * index));
    });
  });
</script>
</body>
</html>
