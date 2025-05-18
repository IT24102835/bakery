<%--
  Created by IntelliJ IDEA.
  User: CHENUMI
  Date: 4/23/2025
  Time: 10:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Cake Order | Bakery System</title>
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

    .input-with-icon {
      position: relative;
      margin-bottom: 20px;
    }

    .input-icon {
      position: absolute;
      top: 50%;
      left: 15px;
      transform: translateY(-50%);
      color: var(--primary-color);
      font-size: 1.1rem;
    }

    .form-control {
      border-radius: 8px;
      padding: 12px 15px 12px 45px;
      background-color: rgba(255, 255, 255, 0.8);
      border: 1px solid rgba(0, 0, 0, 0.1);
      transition: all 0.3s;
      width: 100%;
      font-size: 1rem;
    }

    .form-control:focus {
      box-shadow: 0 0 0 3px rgba(255, 107, 107, 0.25);
      border-color: var(--primary-color);
      background-color: #fff;
      outline: none;
    }

    .form-control::placeholder {
      color: #adb5bd;
      opacity: 1;
      font-style: italic;
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
    }

    .btn-primary {
      background: linear-gradient(135deg, #ff6b6b, #ff5252);
      box-shadow: 0 4px 10px rgba(255, 107, 107, 0.3);
      color: white;
      width: 100%;
      margin-top: 10px;
    }

    .btn-primary:hover {
      background: linear-gradient(135deg, #ff5252, #ff3838);
      box-shadow: 0 6px 15px rgba(255, 107, 107, 0.5);
      transform: translateY(-3px);
    }

    .btn-secondary {
      background: linear-gradient(135deg, #6c757d, #495057);
      box-shadow: 0 4px 10px rgba(108, 117, 125, 0.3);
      color: white;
      text-decoration: none;
      display: inline-block;
      text-align: center;
      width: 100%;
      margin-top: 15px;
    }

    .btn-secondary:hover {
      background: linear-gradient(135deg, #5a6268, #343a40);
      box-shadow: 0 6px 15px rgba(108, 117, 125, 0.5);
      transform: translateY(-3px);
      color: white;
    }

    /* Feedback button styling */
    .btn-feedback {
      background: linear-gradient(135deg, #4ecdc4, #2dbeb1);
      box-shadow: 0 4px 10px rgba(78, 205, 196, 0.3);
      color: white;
      text-decoration: none;
      display: inline-block;
      text-align: center;
      width: 100%;
      margin-top: 15px;
    }

    .btn-feedback:hover {
      background: linear-gradient(135deg, #2dbeb1, #26a69a);
      box-shadow: 0 6px 15px rgba(78, 205, 196, 0.5);
      transform: translateY(-3px);
      color: white;
    }

    .description-text {
      color: #666;
      margin-bottom: 25px;
      font-size: 1rem;
      line-height: 1.5;
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

    /* Modal styles */
    .modal-content {
      background-color: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      border-radius: var(--border-radius);
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
      border: 1px solid rgba(255, 255, 255, 0.1);
    }

    .modal-header {
      background: linear-gradient(135deg, #4ecdc4, #2dbeb1);
      color: white;
      border-bottom: none;
      padding: 20px 25px;
    }

    .modal-footer {
      border-top: none;
      padding: 15px 25px 25px;
    }

    .modal-body {
      padding: 25px;
    }

    .btn-close {
      color: white;
      opacity: 0.8;
    }

    .btn-close:hover {
      opacity: 1;
    }

    .star-rating {
      display: flex;
      flex-direction: row-reverse;
      justify-content: center;
      margin: 20px 0;
    }

    .star-rating input {
      display: none;
    }

    .star-rating label {
      cursor: pointer;
      font-size: 2rem;
      color: #ddd;
      padding: 0 5px;
      transition: all 0.2s ease;
    }

    .star-rating label:hover,
    .star-rating label:hover ~ label,
    .star-rating input:checked ~ label {
      color: #ffcc00;
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
      <h3 class="mb-1">View Your Cake Order</h3>
      <p class="mb-0 small">Track your custom cake orders</p>
    </div>

    <!-- Order Form Body -->
    <div class="order-body">
      <p class="description-text">Enter your name below to view all your pending and completed cake orders.</p>

      <form method="post" action="ViewOrderServlet" id="viewOrderForm">
        <!-- Fixed Input with Icon -->
        <div class="input-with-icon">
          <i class="fas fa-user input-icon"></i>
          <input type="text" class="form-control" name="customerName" placeholder="Enter your full name" required>
        </div>

        <button type="submit" class="btn btn-primary">
          <i class="fas fa-search me-2"></i>Find My Cake Orders
        </button>
      </form>

      <a href="home.jsp" class="btn btn-secondary">
        <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
      </a>

      <!-- Feedback Button -->
      <a href="feedback.jsp" class="btn btn-feedback">
        <i class="fas fa-comment-alt me-2""></i>Leave Feedback
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

<!-- Bootstrap and custom scripts -->
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

    // Input field animation
    const input = document.querySelector('.form-control');
    input.addEventListener('focus', function() {
      this.parentElement.style.transform = 'scale(1.02)';
      this.parentElement.style.transition = 'transform 0.3s ease';
    });

    input.addEventListener('blur', function() {
      this.parentElement.style.transform = 'scale(1)';
    });

    // Pre-fill feedback name if available in the search field
    const feedbackModal = document.getElementById('feedbackModal');
    if (feedbackModal) {
      feedbackModal.addEventListener('show.bs.modal', function (event) {
        const nameInput = document.querySelector('input[name="customerName"]');
        if (nameInput && nameInput.value) {
          document.getElementById('feedbackName').value = nameInput.value;
        }
      });
    }
  });

  // Simple feedback submission function
  function submitFeedback() {
    const form = document.getElementById('feedbackForm');

    // Basic form validation
    if (!form.checkValidity()) {
      form.reportValidity();
      return;
    }

    // Get values
    const name = document.getElementById('feedbackName').value;
    const rating = document.querySelector('input[name="rating"]:checked').value;
    const message = document.getElementById('feedbackMessage').value;

    // In a real implementation, you would send these values to the server
    console.log({name, rating, message});

    // Close modal
    const modal = bootstrap.Modal.getInstance(document.getElementById('feedbackModal'));
    modal.hide();

    // Show success message
    alert('Thank you for your feedback! Your opinion helps us improve our services.');
  }
</script>
</body>
</html>
