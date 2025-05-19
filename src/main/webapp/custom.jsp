<%--
  Created by IntelliJ IDEA.
  User: CHENUMI
  Date: 4/17/2025
  Time: 10:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bakery Delights</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    :root {
      --primary-color: #ff4d4d;
      --secondary-color: #ff9e9e;
      --dark-color: #343a40;
      --light-color: #f8f9fa;
      --box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    body {
      background: linear-gradient(rgba(255, 255, 255, 0.92), rgba(255, 255, 255, 0.92)),
      url('images/1.jpg') center/cover fixed;
      min-height: 100vh;
      font-family: 'Poppins', sans-serif;
      padding-top: 56px;
    }

    .navbar {
      background: rgba(255, 255, 255, 0.95);
      box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
    }

    .navbar-brand {
      color: var(--primary-color) !important;
      font-weight: 700;
      font-size: 1.5rem;
    }

    .nav-link {
      color: #333 !important;
      font-weight: 500;
      transition: all 0.3s ease;
      margin: 0 5px;
    }

    .nav-link:hover {
      color: var(--primary-color) !important;
      transform: translateY(-2px);
    }

    .hero {
      height: 70vh;
      background: url('images/bakery-banner.jpg') no-repeat center center/cover;
      position: relative;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 2rem;
    }

    .hero::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.4);
    }

    .hero-content {
      position: relative;
      z-index: 1;
      text-align: center;
      padding: 2rem;
      max-width: 800px;
    }

    .hero h1 {
      color: white;
      font-size: 3.2rem;
      text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.6);
      margin-bottom: 1.5rem;
    }

    .hero p {
      color: white;
      font-size: 1.2rem;
      text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.6);
      margin-bottom: 2rem;
    }

    .section {
      padding: 70px 0;
      text-align: center;
    }

    .section h2 {
      margin-bottom: 3rem;
      position: relative;
      display: inline-block;
      font-weight: 700;
    }

    .section h2:after {
      content: '';
      position: absolute;
      bottom: -10px;
      left: 50%;
      transform: translateX(-50%);
      width: 80px;
      height: 3px;
      background-color: var(--primary-color);
    }

    .card {
      border: none;
      border-radius: 15px;
      transition: all 0.3s ease;
      background: rgba(255, 255, 255, 0.95);
      box-shadow: var(--box-shadow);
      margin-bottom: 2rem;
      overflow: hidden;
    }

    .card:hover {
      transform: translateY(-10px);
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
    }

    .card img {
      height: 220px;
      object-fit: cover;
      transition: all 0.5s ease;
    }

    .card:hover img {
      transform: scale(1.05);
    }

    .card-body {
      padding: 1.5rem;
    }

    .card-title {
      font-weight: 600;
      margin-bottom: 1rem;
      color: var(--dark-color);
    }

    .feature-icon {
      font-size: 2.5rem;
      color: var(--primary-color);
      margin-bottom: 1rem;
    }

    .btn-primary {
      background: var(--primary-color);
      border: none;
      padding: 12px 30px;
      font-weight: 600;
      border-radius: 30px;
      transition: all 0.3s ease;
    }

    .btn-primary:hover {
      transform: translateY(-3px);
      box-shadow: 0 5px 15px rgba(255, 77, 77, 0.3);
      background: #ff3333;
    }

    .btn-nav {
      background: var(--primary-color);
      border: none;
      padding: 8px 20px;
      font-weight: bold;
      border-radius: 25px;
      transition: all 0.3s ease;
      color: white !important;
      margin: 0 5px;
    }

    .btn-nav:hover {
      transform: translateY(-3px);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
      background: #ff3333;
    }

    .bg-light {
      background-color: rgba(248, 249, 250, 0.8) !important;
    }

    .footer {
      background: var(--dark-color);
      color: white;
      padding: 2rem 0;
      text-align: center;
      margin-top: 2rem;
    }

    .user-info-bar {
      background-color: rgba(0, 0, 0, 0.7);
      color: white;
      padding: 8px 0;
      font-size: 0.85rem;
      position: fixed;
      bottom: 0;
      width: 100%;
      z-index: 1000;
    }

    .user-info-content {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    @media (max-width: 768px) {
      .hero h1 {
        font-size: 2.2rem;
      }

      .hero p {
        font-size: 1rem;
      }

      .section {
        padding: 50px 0;
      }

      .user-info-content {
        flex-direction: column;
        text-align: center;
      }

      .user-info-content div {
        margin-bottom: 5px;
      }
    }
  </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top">
  <div class="container">
    <a class="navbar-brand" href="#">Bakery Delights</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link active" href="home.jsp">Dashboard</a></li>
        <li class="nav-item"><a class="nav-link" href="custom.jsp">Custom Cakes</a></li>
        <li class="nav-item"><a class="nav-link" href="BakeryOrder.jsp">Order</a></li>
        <li class="nav-item"><a class="nav-link" href="profile.jsp">Profile</a></li>
        <li class="nav-item"><a class="btn btn-nav" href="logout.jsp">Log out</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- Hero Section -->
<div id="home" class="hero">
  <div class="hero-content">
    <h1>Freshly Baked Happiness!</h1>
    <p>Discover our handcrafted cakes, pastries, and breads made with the finest ingredients</p>
    <a href="cake.jsp" class="btn btn-primary btn-lg">Order Now</a>
  </div>
</div>

<!-- Featured Cakes Section -->
<section class="section container">
  <h2>Featured Cakes</h2>
  <div class="row">
    <div class="col-md-4">
      <div class="card">
        <img src="images/images1.jpg" class="card-img-top" alt="Chocolate Cake">
        <div class="card-body">
          <h5 class="card-title">Chocolate Delight</h5>
          <p class="card-text">A rich and moist chocolate cake topped with creamy ganache.</p>
          <a href="cake.jsp" class="btn btn-primary">Order Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card">
        <img src="images/download.jpg" class="card-img-top" alt="Vanilla Cake">
        <div class="card-body">
          <h5 class="card-title">Vanilla Bliss</h5>
          <p class="card-text">A classic vanilla sponge cake with a butter frosting.</p>
          <a href="cake.jsp" class="btn btn-primary">Order Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card">
        <img src="images/images2.jpg" class="card-img-top" alt="Red Velvet Cake">
        <div class="card-body">
          <h5 class="card-title">Red Velvet Love</h5>
          <p class="card-text">Smooth, velvet texture with a hint of cocoa and creamy cheese frosting.</p>
          <a href="cake.jsp" class="btn btn-primary">Order Now</a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Features Section -->
<section id="about" class="section bg-light">
  <div class="container">
    <h2>Our Specialties</h2>
    <div class="row g-4">
      <div class="col-md-4">
        <div class="card p-4">
          <i class="fas fa-birthday-cake feature-icon"></i>
          <h3>Custom Cakes</h3>
          <p>Personalized designs for your special occasions. We turn your ideas into edible art!</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card p-4">
          <i class="fas fa-bread-slice feature-icon"></i>
          <h3>Fresh Breads</h3>
          <p>Daily baked using traditional recipes passed down through generations.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card p-4">
          <i class="fas fa-cookie feature-icon"></i>
          <h3>Artisan Pastries</h3>
          <p>Handcrafted with premium ingredients for that perfect texture and taste.</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Order Custom Cake Section -->
<section id="customization" class="section">
  <div class="container">
    <h2>Create Your Dream Cake</h2>
    <div class="row g-4 justify-content-center">
      <div class="col-md-6">
        <div class="card p-4">
          <h4>Customization Options</h4>
          <ul class="list-unstyled">
            <li class="my-3"><i class="fas fa-palette me-2"></i>Choose Your Design</li>
            <li class="my-3"><i class="fas fa-weight me-2"></i>Select Size</li>
            <li class="my-3"><i class="fas fa-ice-cream me-2"></i>Pick Flavors</li>
          </ul>
          <a href="custom.jsp" class="btn btn-primary">Start Designing</a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Special Offer Section -->
<section id="order" class="section bg-light">
  <div class="container">
    <h2>Ready to Order?</h2>
    <p class="lead mb-5">Place your order now and enjoy our fresh baked goods!</p>
    <div class="row g-4 justify-content-center">
      <div class="col-md-8">
        <div class="card p-5">
          <h3 class="mb-4">Special Offer!</h3>
          <p class="text-muted mb-4">Get 15% off your first order with code: <span class="fw-bold">WELCOME15</span></p>
          <a href="BakeryOrder.jsp" class="btn btn-primary btn-lg">Order Now</a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<footer class="footer">
  <div class="container">
    <div class="row">
      <div class="col-md-4 mb-4 mb-md-0">
        <h5>Contact Us</h5>
        <p><i class="fas fa-map-marker-alt me-2"></i>123 Baker Street, Cakeville</p>
        <p><i class="fas fa-phone me-2"></i>(555) 123-4567</p>
        <p><i class="fas fa-envelope me-2"></i>info@bakerydelights.com</p>
      </div>
      <div class="col-md-4 mb-4 mb-md-0">
        <h5>Opening Hours</h5>
        <p>Monday - Friday: 7:00 AM - 8:00 PM</p>
        <p>Saturday: 8:00 AM - 6:00 PM</p>
        <p>Sunday: 9:00 AM - 5:00 PM</p>
      </div>
      <div class="col-md-4">
        <h5>Follow Us</h5>
        <div class="d-flex justify-content-center">
          <a href="#" class="text-white me-3"><i class="fab fa-facebook fa-2x"></i></a>
          <a href="#" class="text-white me-3"><i class="fab fa-instagram fa-2x"></i></a>
          <a href="#" class="text-white"><i class="fab fa-twitter fa-2x"></i></a>
        </div>
      </div>
    </div>
    <hr class="my-4" style="background-color: rgba(255, 255, 255, 0.2);">
    <p>&copy; 2025 Bakery Delights. All Rights Reserved.</p>
  </div>
</footer>

<!-- User Information Bar -->
<div class="user-info-bar">
  <div class="container">
    <div class="user-info-content">
      <div>
        <i class="fas fa-user-circle me-2"></i> User ID: IT24102083
      </div>
      <div>
        <i class="fas fa-clock me-2"></i> Current Date/Time: 2025-05-04 20:03:15 UTC
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    // Add animation to cards
    const cards = document.querySelectorAll('.card');
    cards.forEach((card, index) => {
      card.style.opacity = '0';
      card.style.transform = 'translateY(20px)';
      card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';

      setTimeout(() => {
        card.style.opacity = '1';
        card.style.transform = 'translateY(0)';
      }, 200 * index);
    });
  });
</script>
</body>
</html>
