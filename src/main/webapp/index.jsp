<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Bakery1.models.Users" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Sweet Tooth</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        /* Body Enhancements */
        body {
            background: url('images/1.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #000;
            font-family: 'Arial', sans-serif;
            position: relative;
            min-height: 100vh;
            overflow-x: hidden;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.7);
            z-index: -1;
        }

        /* Navbar Enhancements */
        .navbar {
            background: rgba(255, 255, 255, 0.9);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 15px 0;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        .navbar-brand {
            font-weight: bold;
            color: #333 !important;
            font-size: 1.8rem;
        }

        .navbar-nav .nav-link {
            color: #333 !important;
            font-weight: 600;
            transition: all 0.3s ease;
            margin: 0 10px;
        }

        .navbar-nav .nav-link:hover {
            color: #ff4d4d !important;
            transform: translateY(-2px);
        }

        /* Hero Section Enhancements */
        .hero {
            padding: 180px 0 100px;
            text-align: center;
        }

        .hero .container {
            background: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .hero h1 {
            color: #333;
            font-size: 3.5rem;
            margin-bottom: 20px;
        }

        .hero p {
            color: #666;
            font-size: 1.3rem;
            margin-bottom: 30px;
        }

        /* Button Enhancements */
        .btn-primary {
            background: #ff4d4d;
            border: none;
            padding: 12px 30px;
            font-weight: bold;
            border-radius: 25px;
            transition: all 0.3s ease;
            margin: 0 10px;
        }

        .btn-signup {
            background: #8ACCD5;
            color: #fff !important;
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            background: #ff3333;
        }

        /* Section Styling */
        section {
            padding: 80px 0;
            position: relative;
            z-index: 1;
            width: 100%;
        }

        section h2.section-title {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 50px;
            color: #333;
            position: relative;
            padding-bottom: 15px;
        }

        section h2.section-title:after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: #ff4d4d;
        }

        /* Featured Products */
        .products {
            background: rgba(255, 255, 255, 0.8);
        }

        .products .card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            transition: all 0.3s ease;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            height: 100%;
        }

        .products .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .products .card-img-top {
            height: 200px;
            object-fit: cover;
        }

        /* About Section */
        .about {
            background: rgba(255, 255, 255, 0.8);
        }

        .about-img {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .about-img img {
            width: 100%;
            height: 400px;
            object-fit: cover;
        }

        .about-content {
            padding: 20px;
        }

        /* Menu Section */
        .menu {
            background: rgba(255, 255, 255, 0.8);
        }

        .menu-item {
            margin-bottom: 30px;
            padding: 20px;
            border-radius: 10px;
            background: white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            height: 100%;
        }

        .menu-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .menu-img {
            width: 100%;
            height: 180px;
            border-radius: 10px;
            object-fit: cover;
            margin-bottom: 15px;
        }

        .menu-item h4 {
            color: #333;
            margin-bottom: 5px;
        }

        .menu-item .price {
            color: #ff4d4d;
            font-weight: bold;
            font-size: 1.2rem;
        }

        .menu-item .description {
            color: #666;
            margin-top: 10px;
        }

        .category-header {
            position: relative;
            margin-bottom: 40px;
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .category-header img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            opacity: 0.9;
        }

        .category-header .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(0, 0, 0, 0.4);
        }

        .category-header h3 {
            color: white;
            font-size: 2.5rem;
            margin: 0;
            padding: 10px 30px;
            border: 2px solid white;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.7);
        }

        /* Testimonials */
        .testimonials {
            background: rgba(255, 255, 255, 0.8);
        }

        .testimonial-card {
            padding: 30px;
            border-radius: 10px;
            background: white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            height: 100%;
        }

        .testimonial-card .quote {
            font-size: 3rem;
            color: #ff4d4d;
            opacity: 0.3;
            margin-bottom: 10px;
        }

        .testimonial-card .client {
            font-weight: bold;
            color: #333;
            margin-top: 20px;
        }

        /* Newsletter */
        .newsletter {
            background: #ff4d4d;
            color: white;
            padding: 60px 0;
        }

        .newsletter h3 {
            margin-bottom: 20px;
        }

        .newsletter-form {
            max-width: 500px;
            margin: 0 auto;
        }

        .newsletter-form .form-control {
            border-radius: 25px 0 0 25px;
            border: none;
            padding: 15px 25px;
        }

        .newsletter-form .btn {
            border-radius: 0 25px 25px 0;
            background: #333;
            color: white;
            padding: 15px 25px;
            border: none;
        }

        /* Footer */
        .footer {
            background: rgba(255, 255, 255, 0.9);
            padding: 60px 0 30px;
            position: relative;
            z-index: 1;
        }

        .footer-logo {
            font-size: 1.8rem;
            font-weight: bold;
            margin-bottom: 20px;
            display: block;
        }

        .footer h5 {
            font-size: 1.2rem;
            margin-bottom: 20px;
            color: #333;
        }

        .footer-links {
            list-style: none;
            padding: 0;
        }

        .footer-links li {
            margin-bottom: 10px;
        }

        .footer-links a {
            color: #666;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .footer-links a:hover {
            color: #ff4d4d;
            text-decoration: none;
        }

        .social-links {
            margin-top: 20px;
        }

        .social-links a {
            color: #333;
            margin-right: 15px;
            font-size: 1.5rem;
            transition: all 0.3s ease;
        }

        .social-links a:hover {
            color: #ff4d4d;
            transform: translateY(-3px);
        }

        .copyright {
            margin-top: 50px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
            color: #666;
        }

        /* Gallery */
        .gallery {
            background: rgba(255, 255, 255, 0.8);
            padding-bottom: 50px;
        }

        .gallery-container {
            padding: 0;
        }

        .gallery-item {
            margin-bottom: 30px;
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            position: relative;
            height: 250px;
        }

        .gallery-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: all 0.5s ease;
        }

        .gallery-item:hover img {
            transform: scale(1.1);
        }

        /* Back to top button */
        .back-to-top {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: #ff4d4d;
            color: white;
            width: 40px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%;
            font-size: 20px;
            z-index: 99;
            text-decoration: none;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }

        .back-to-top.show {
            opacity: 1;
            visibility: visible;
        }

        .back-to-top:hover {
            background: #ff3333;
            color: white;
        }

        /* Improved responsive adjustments */
        @media (max-width: 991px) {
            .navbar-nav {
                margin-top: 15px;
            }
            
            .navbar-nav .nav-link {
                padding: 10px;
                margin: 0;
                text-align: center;
            }
            
            .navbar-nav .btn {
                margin: 10px auto;
                display: block;
                width: 80%;
            }
            
            .about-img img {
                height: 300px;
            }
        }

        @media (max-width: 767px) {
            .navbar-brand {
                font-size: 1.5rem;
            }
            
            .hero {
                padding: 150px 0 70px;
            }
            
            .hero h1 {
                font-size: 2.5rem;
            }
            
            .hero p {
                font-size: 1rem;
            }
            
            .hero .btn {
                margin-bottom: 10px;
            }
            
            .section-title {
                font-size: 2rem;
            }
            
            .category-header h3 {
                font-size: 1.8rem;
            }
            
            .gallery-item {
                height: 200px;
            }
            
            .btn-primary {
                padding: 10px 20px;
                margin: 5px;
            }
        }

        @media (max-width: 576px) {
            .container {
                padding-left: 15px;
                padding-right: 15px;
            }
            
            .btn-primary {
                margin: 5px;
                padding: 10px 20px;
                font-size: 0.9rem;
            }
            
            .gallery-item {
                height: 180px;
            }
            
            .hero .container {
                padding: 25px 15px;
            }
            
            .hero h1 {
                font-size: 2rem;
            }
            
            .newsletter-form .input-group {
                flex-direction: column;
            }
            
            .newsletter-form .form-control {
                border-radius: 25px;
                margin-bottom: 10px;
            }
            
            .newsletter-form .btn {
                border-radius: 25px;
                width: 100%;
            }
        }
    </style>
</head>
<body>

<% Users user = (Users)session.getAttribute("currentUser");%>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <a class="navbar-brand" href="#">The Sweet Tooth</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="#home">Home</a></li>               
                <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                <li class="nav-item"><a class="nav-link" href="#menu">Menu</a></li>
                <li class="nav-item"><a class="nav-link" href="#gallery">Gallery</a></li>
                <li class="nav-item"><a class="nav-link" href="#testimonials">Testimonials</a></li>
                <li class="nav-item"><a class="nav-link" href="#footer">Contact</a></li>
                <li class="nav-item"><a class="btn btn-primary" href="ViewFeedback.jsp">Reviews</a></li>
                <% if (user != null) { %>
                <li class="nav-item"><a class="btn btn-primary" href="home.jsp">Dashboard</a></li>
                <% } else {%>
                <li class="nav-item"><a class="btn btn-primary" href="login.jsp">Log in</a></li>
                <% } %>	
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<header id="home" class="hero">
    <div class="container text-center">
        <h1><b>Love At First Bite</b></h1>
        <h1 class="display-4"><b>Welcome To Our SweetTooth Bakery</b></h1>
        <p class="lead">Freshly baked with love and care, just for you.</p>
        
        <% if (user != null) { %>
            <h3>Welcome, <%= user.getName() %></h3>
        <% } else {%>
            <div class="d-flex justify-content-center flex-wrap">
                <a href="login.jsp" class="btn btn-primary">Log in</a>
                <a href="Register.jsp" class="btn btn-primary btn-signup">Sign Up</a>
            </div>
        <% } %>
    </div>
</header>

<!-- About Section -->
<section id="about" class="about">
    <div class="container">
        <h2 class="section-title">Our Sweet Story</h2>
        <div class="row align-items-center">
            <div class="col-md-6">
                <div class="about-img">
                    <img src="images/5.jpg" alt="About Our Bakery" class="img-fluid">
                </div>
            </div>
            <div class="col-md-6">
                <div class="about-content">
                    <h3>Baking Happiness Since 2005</h3>
                    <p>The Sweet Tooth Bakery was born from a passion for creating delicious treats that bring joy to people's lives. What started as a small family kitchen experiment has grown into a beloved bakery known throughout the community.</p>
                    <p>Our secret ingredient? Love. Every pastry, cake, and bread is crafted with care by our talented bakers who have dedicated their lives to the art of baking.</p>
                    <p>We believe in using only the finest ingredients, supporting local suppliers, and creating memorable experiences through our delectable creations. Whether it's a birthday celebration, wedding, or just a sweet craving, we're here to make your moments special.</p>
                    <div class="text-center text-md-start">
                        <a href="#menu" class="btn btn-primary mt-3">Explore Our Menu</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Featured Products -->
<section class="products">
    <div class="container">
        <h2 class="section-title">Our Specialties</h2>
        <div class="row g-4">
            <div class="col-md-4 col-sm-6">
                <div class="card h-100">
                    <img src="images/2.jpg" class="card-img-top" alt="Custom Cakes">
                    <div class="card-body text-center">
                        <h5 class="card-title">Custom Cakes</h5>
                        <p class="card-text">Celebrate your special moments with our bespoke creations</p>
                        <a href="#menu" class="btn btn-primary btn-sm">View Options</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="card h-100">
                    <img src="images/5.jpg" class="card-img-top" alt="Artisan Pastries">
                    <div class="card-body text-center">
                        <h5 class="card-title">Artisan Pastries</h5>
                        <p class="card-text">Flaky, buttery perfection in every bite</p>
                        <a href="#menu" class="btn btn-primary btn-sm">View Options</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="card h-100">
                    <img src="images/4.jpg" class="card-img-top" alt="Fresh Breads">
                    <div class="card-body text-center">
                        <h5 class="card-title">Fresh Breads</h5>
                        <p class="card-text">Daily baked using traditional methods</p>
                        <a href="#menu" class="btn btn-primary btn-sm">View Options</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Menu Section -->
<section id="menu" class="menu">
    <div class="container">
        <h2 class="section-title">Our Delicious Menu</h2>
        
        <!-- Cakes Category -->
        <div class="category-header">
            <img src="images/20.jpg" alt="Cake Category">
            <div class="overlay">
                <h3>Cakes</h3>
            </div>
        </div>
        
        <div class="row g-4">
            <div class="col-md-4 col-sm-6">
                <div class="menu-item h-100">
                    <img src="images/6.jpg" alt="Chocolate Cake" class="menu-img">
                    <h4>Chocolate Indulgence</h4>
                    <div class="price">$35.00</div>
                    <div class="description">Rich chocolate layers with ganache and chocolate buttercream</div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="menu-item h-100">
                    <img src="images/7.jpg" alt="Vanilla Cake" class="menu-img">
                    <h4>Classic Vanilla</h4>
                    <div class="price">$30.00</div>
                    <div class="description">Light vanilla sponge with vanilla bean buttercream</div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="menu-item h-100">
                    <img src="images/8.jpg" alt="Red Velvet" class="menu-img">
                    <h4>Red Velvet Dream</h4>
                    <div class="price">$38.00</div>
                    <div class="description">Velvety red cake with cream cheese frosting</div>
                </div>
            </div>
        </div>
        
        <!-- Pastries Category -->
        <div class="category-header mt-5">
            <img src="https://images.unsplash.com/photo-1483695028939-5bb13f8648b0?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80" alt="Pastry Category">
            <div class="overlay">
                <h3>Pastries</h3>
            </div>
        </div>
        
        <div class="row g-4">
            <div class="col-md-4 col-sm-6">
                <div class="menu-item h-100">
                    <img src="images/9.jpg" alt="Croissant" class="menu-img">
                    <h4>Buttery Croissant</h4>
                    <div class="price">$3.50</div>
                    <div class="description">Flaky layers of buttery goodness</div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="menu-item h-100">
                    <img src="images/10.jpg" alt="Danish" class="menu-img">
                    <h4>Fruit Danish</h4>
                    <div class="price">$4.25</div>
                    <div class="description">Pastry filled with seasonal fruits and custard</div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="menu-item h-100">
                    <img src="images/11.jpg" alt="Eclair" class="menu-img">
                    <h4>Chocolate Eclair</h4>
                    <div class="price">$4.75</div>
                    <div class="description">Choux pastry filled with cream and topped with chocolate</div>
                </div>
            </div>
        </div>
            
        <!-- Breads Category -->
        <div class="category-header mt-5">
            <img src="https://images.unsplash.com/photo-1509440159596-0249088772ff?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80" alt="Bread Category">
            <div class="overlay">
                <h3>Breads</h3>
            </div>
        </div>
        
        <div class="row g-4">
            <div class="col-md-4 col-sm-6">
                <div class="menu-item h-100">
                    <img src="images/12.jpg" alt="Sourdough" class="menu-img">
                    <h4>Artisan Sourdough</h4>
                    <div class="price">$6.50</div>
                    <div class="description">Naturally fermented with our 10-year-old starter</div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="menu-item h-100">
                    <img src="images/13.jpg" alt="Baguette" class="menu-img">
                    <h4>French Baguette</h4>
                    <div class="price">$4.00</div>
                    <div class="description">Crispy crust with a soft, chewy interior</div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="menu-item h-100">
                    <img src="images/14.jpg" alt="Cinnamon Roll" class="menu-img">
                    <h4>Cinnamon Rolls</h4>
                    <div class="price">$3.75</div>
                    <div class="description">Soft rolls with cinnamon sugar and cream cheese frosting</div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Gallery Section -->
<section id="gallery" class="gallery">
    <div class="container">
        <h2 class="section-title">Sweet Moments Gallery</h2>
        <div class="row g-4">
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="gallery-item">
                    <img src="images/gallery1.jpg" onerror="this.src='https://images.unsplash.com/photo-1595272568891-123402d0fb3b?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'" alt="Freshly Baked Bread">
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="gallery-item">
                    <img src="images/gallery2.jpg" onerror="this.src='https://images.unsplash.com/photo-1608198093002-ad4e005484ec?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'" alt="Colorful Macarons">
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="gallery-item">
                    <img src="images/gallery3.jpg" onerror="this.src='https://images.unsplash.com/photo-1602351447937-745cb720612f?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'" alt="Chocolate Cake">
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="gallery-item">
                    <img src="images/gallery4.jpg" onerror="this.src='https://images.unsplash.com/photo-1587080413959-06b859fb107d?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'" alt="Croissants">
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="gallery-item">
                    <img src="images/gallery5.jpg" onerror="this.src='https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'" alt="Cupcakes">
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="gallery-item">
                    <img src="images/gallery6.jpg" onerror="this.src='https://images.unsplash.com/photo-1603532648955-039310d9ed75?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'" alt="Cinnamon Rolls">
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Testimonials Section -->
<section id="testimonials" class="testimonials">
    <div class="container">
        <h2 class="section-title">What Our Customers Say</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="testimonial-card h-100">
                    <div class="quote"><i class="fas fa-quote-left"></i></div>
                    <p>"The Sweet Tooth Bakery made my daughter's birthday cake. Not only did it look amazing, but it tasted even better. Everyone at the party was asking where it was from."</p>
                    <div class="client">- Sarah Johnson</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial-card h-100">
                    <div class="quote"><i class="fas fa-quote-left"></i></div>
                    <p>"I visit this bakery every weekend for their sourdough bread. It's simply the best in town. Their pastries are phenomenal too - especially the almond croissants. Highly recommended!"</p>
                    <div class="client">- Michael Stevens</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial-card h-100">
                    <div class="quote"><i class="fas fa-quote-left"></i></div>
                    <p>"Our wedding cake was beyond our expectations. The team was so helpful throughout the planning process and delivered a masterpiece that tasted as good as it looked. Thank you!"</p>
                    <div class="client">- Emma & David Thompson</div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Newsletter Section -->
<section class="newsletter">   
</section>

<!-- Footer -->
<footer id="footer" class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
                <a href="#" class="footer-logo">The Sweet Tooth</a>
                <p>Bringing sweetness to your everyday life with our handcrafted treats made with love.</p>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-pinterest"></i></a>
                </div>
            </div>
            
            <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
                <h5>Quick Links</h5>
                <ul class="footer-links">
                    <li><a href="#home">Home</a></li>
                    <li><a href="#about">About Us</a></li>
                    <li><a href="#menu">Menu</a></li>
                    <li><a href="#gallery">Gallery</a></li>
                    <li><a href="#testimonials">Testimonials</a></li>
                </ul>
            </div>
            
            <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
                <h5>Our Services</h5>
                <ul class="footer-links">
                    <li><a href="#">Custom Cakes</a></li>
                    <li><a href="#">Catering</a></li>
                    <li><a href="#">Gift Baskets</a></li>
                    <li><a href="#">Wedding Cakes</a></li>
                    <li><a href="#">Delivery</a></li>
                </ul>
            </div>
            
            <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
                <h5>Contact Info</h5>
                <ul class="footer-links">
                    <li><i class="fas fa-map-marker-alt"></i> 123 Sweet Street, Bakery Town</li>
                    <li><i class="fas fa-phone"></i> (123) 456-7890</li>
                    <li><i class="fas fa-envelope"></i> info@sweettooth.com</li>
                    <li><i class="fas fa-clock"></i> Mon-Fri: 7am - 7pm</li>
                </ul>
            </div>
        </div>
        
        <div class="row">
            <div class="col-12 text-center copyright">
                <p>&copy; 2025 The Sweet Tooth Bakery. All rights reserved. | Designed with <i class="fas fa-heart" style="color: #ff4d4d;"></i></p>
            </div>
        </div>
    </div>
</footer>

<!-- Back to Top Button -->
<a href="#" class="back-to-top" id="backToTop"><i class="fas fa-chevron-up"></i></a>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Back to top button
    const backToTopButton = document.getElementById("backToTop");
    
    window.addEventListener("scroll", () => {
        if (window.pageYOffset > 300) {
            backToTopButton.classList.add("show");
        } else {
            backToTopButton.classList.remove("show");
        }
    });
    
    backToTopButton.addEventListener("click", (e) => {
        e.preventDefault();
        window.scrollTo({ top: 0, behavior: "smooth" });
    });
    
    // Smooth scrolling for navbar links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            
            const targetId = this.getAttribute('href');
            if (targetId === '#') return;
            
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                window.scrollTo({
                    top: targetElement.offsetTop - 80,
                    behavior: 'smooth'
                });
            }
        });
    });

    // Image error handling
    document.addEventListener('DOMContentLoaded', function() {
        // This ensures images have fallbacks but preserves original sources
        const galleryImages = document.querySelectorAll('.gallery-item img');
        for (let img of galleryImages) {
            img.addEventListener('error', function() {
                // Only handle errors once to avoid loops
                if (!this.hasAttribute('data-error-handled')) {
                    this.setAttribute('data-error-handled', 'true');
                    console.log('Image failed to load: ' + this.src);
                }
            });
        }
    });
</script>
</body>
</html>