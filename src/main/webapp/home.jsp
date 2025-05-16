<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bakery Delights</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            background: linear-gradient(rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.9)),
                        url('images/1.jpg') center/cover fixed;
            min-height: 100vh;
        }
        
        .navbar {
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
        }
        
        .navbar-brand {
            color: #ff4d4d !important;
            font-weight: 700;
            font-size: 1.5rem;
        }
        
        .nav-link {
            color: #333 !important;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .nav-link:hover {
            color: #ff4d4d !important;
            transform: translateY(-2px);
        }
        
        .hero {
            height: 70vh;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.3);
        }
        
        .hero h1 {
            color: white;
            font-size: 3.5rem;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.6);
            position: relative;
            z-index: 1;
        }
        
        .section {
            padding: 80px 0;
            text-align: center;
        }
        
        .card {
            border: none;
            border-radius: 15px;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.95);
        }
        
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        
        .feature-icon {
            font-size: 2.5rem;
            color: #ff4d4d;
            margin-bottom: 1rem;
        }
        
        .btn-primary {
            background: #ff4d4d;
            border: none;
            padding: 12px 30px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(255, 77, 77, 0.3);
        }
        
         .btn-nav {
            background: #ff4d4d;
            border: none;
            padding: 9px 25px;
            font-weight: bold;
            border-radius: 25px;
            transition: all 0.3s ease;
            margin: 0 10px;
        }

        .btn-nav:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            background: #ff3333;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">Bakery Delights</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="custom.jsp">Custom Cakes</a></li>
                    <li class="nav-item"><a class="nav-link" href="BakeryOrder.jsp">Order</a></li>
                    <li class="nav-item"><a class="nav-link" href="profile.jsp">Profile</a></li>
                    <li class="nav-item"><a class="btn btn-nav" href="logout.jsp">Log out</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div id="home" class="hero">
        <h1 class="text-center">Delicious Cakes & Pastries<br>Just for You</h1>
    </div>

    <section id="about" class="section">
        <div class="container">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card p-4">
                        <i class="fas fa-birthday-cake feature-icon"></i>
                        <h3>Custom Cakes</h3>
                        <p>Personalized designs for your special occasions</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card p-4">
                        <i class="fas fa-bread-slice feature-icon"></i>
                        <h3>Fresh Breads</h3>
                        <p>Daily baked using traditional recipes</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card p-4">
                        <i class="fas fa-cookie feature-icon"></i>
                        <h3>Artisan Pastries</h3>
                        <p>Handcrafted with premium ingredients</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="customization" class="section bg-light">
        <div class="container">
            <h2 class="mb-5">Create Your Dream Cake</h2>
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

    <section id="order" class="section">
        <div class="container">
            <h2 class="mb-4">Ready to Order?</h2>
            <p class="lead mb-5">Place your order now and enjoy our fresh baked goods!</p>
            <div class="row g-4 justify-content-center">
                <div class="col-md-8">
                    <div class="card p-5">
                        <h3 class="mb-4">Special Offer!</h3>
                        <p class="text-muted">Get 15% off your first order</p>
                        <a href="BakeryOrder.jsp" class="btn btn-primary btn-lg">Order Now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>