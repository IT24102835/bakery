<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bakery Order | Bakery System</title>
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
        }
        
        .form-label {
            font-weight: 600;
            color: var(--dark-color);
            margin-bottom: 8px;
            display: block;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .form-control, .form-select {
            border-radius: 8px;
            padding: 10px 15px;
            background-color: rgba(255, 255, 255, 0.8);
            border: 1px solid rgba(0, 0, 0, 0.1);
            transition: all 0.3s;
        }
        
        .form-control:focus, .form-select:focus {
            box-shadow: 0 0 0 3px rgba(255, 107, 107, 0.25);
            border-color: var(--primary-color);
            background-color: #fff;
        }
        
        .form-control::placeholder {
            color: #adb5bd;
            opacity: 1;
            font-style: italic;
        }
        
        .select-placeholder {
            color: #adb5bd;
            font-style: italic;
        }
        
        .btn {
            border-radius: 30px;
            padding: 12px 20px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s;
            border: none;
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
        
        .btn-secondary {
            background: linear-gradient(135deg, #6c757d, #495057);
            box-shadow: 0 4px 10px rgba(108, 117, 125, 0.3);
            color: white;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }
        
        .btn-secondary:hover {
            background: linear-gradient(135deg, #5a6268, #343a40);
            box-shadow: 0 6px 15px rgba(108, 117, 125, 0.5);
            transform: translateY(-3px);
            color: white;
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
        
        .input-group-text {
            background-color: rgba(255, 107, 107, 0.1);
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-right: none;
            color: var(--primary-color);
        }
        
        .message {
            background-color: rgba(220, 53, 69, 0.1);
            color: #dc3545;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 500;
            border: 1px solid rgba(220, 53, 69, 0.3);
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
        
        .form-floating {
            margin-bottom: 1rem;
        }
        
        .action-buttons {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        
        .action-buttons .btn {
            flex: 1;
        }
        
        .dropdown-placeholder {
            color: #adb5bd !important;
            font-style: italic !important;
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
        <!-- Order Card -->
        <div class="order-card">
            <!-- Order Header -->
            <div class="order-header">
                <div class="mb-3">
                    <i class="fas fa-shopping-cart fa-3x"></i>
                </div>
                <h3 class="mb-1">Place Your Order</h3>
                <p class="mb-0 small">Fresh bakery items delivered to your door</p>
            </div>
            
            <!-- Order Form Body -->
            <div class="order-body">
                <%-- Show error message if redirected with a message parameter --%>
                <%
                    String message = request.getParameter("message");
                    if (message != null && !message.trim().isEmpty()) {
                %>
                    <div class="message">
                        <i class="fas fa-exclamation-circle me-2"></i><%= message %>
                    </div>
                <%
                    }
                %>

                <form method="post" action="BakeryOrderServlet" id="orderForm">
                    <div class="mb-4">
                        <label class="form-label"><i class="fas fa-user me-2"></i>Your Name</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                            <input type="text" class="form-control" name="customerName" placeholder="Enter your full name here" required>
                        </div>
                        <div class="form-text text-muted">How you'd like your name to appear on the order</div>
                    </div>
                    
                    <div class="mb-4">
                        <label class="form-label"><i class="fas fa-bread-slice me-2"></i>Choose the Item</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-bread-slice"></i></span>
                            <select name="itemType" class="form-select" required>
                                <option value="" class="dropdown-placeholder">Select a delicious bakery item</option>
                                <option value="Buns">Buns - Soft and fluffy</option>
                                <option value="Rolls">Rolls - Perfect for sandwiches</option>
                                <option value="Pastry">Pastry - Flaky and buttery</option>
                                <option value="Doughnuts">Doughnuts - Sweet and glazed</option>
                                <option value="Pizza">Pizza - Freshly baked</option>
                            </select>
                        </div>
                        <div class="form-text text-muted">Select from our handcrafted bakery items</div>
                    </div>
                    
                    <div class="mb-4">
                        <label class="form-label"><i class="fas fa-mortar-pestle me-2"></i>Sauce Flavour</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-mortar-pestle"></i></span>
                            <select name="sauceFlavour" class="form-select" required>
                                <option value="" class="dropdown-placeholder">Choose your preferred sauce</option>
                                <option value="Tomato">Tomato - Rich and tangy</option>
                                <option value="Cream">Cream - Smooth and velvety</option>
                                <option value="Mustard">Mustard - Sharp and zesty</option>
                                <option value="Sweet">Sweet - Honey-based glaze</option>
                            </select>
                        </div>
                        <div class="form-text text-muted">Enhance your bakery items with our special sauces</div>
                    </div>
                    
                    <div class="mb-4">
                        <label class="form-label"><i class="fas fa-sort-numeric-up-alt me-2"></i>Number of Items</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-sort-numeric-up-alt"></i></span>
                            <input type="number" class="form-control" name="itemCount" min="1" placeholder="Enter quantity (e.g. 2, 4, 6)" required>
                        </div>
                        <div class="form-text text-muted">How many items would you like to order?</div>
                    </div>
                    
                    <div class="mb-4">
                        <label class="form-label"><i class="fas fa-credit-card me-2"></i>Payment Method</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-credit-card"></i></span>
                            <select name="payment" class="form-select" required>
                                <option value="" class="dropdown-placeholder">Select how you'd like to pay</option>
                                <option value="Cash">Cash on Delivery - Pay when you receive</option>
                                <option value="Card">Credit/Debit Card - Secure payment</option>
                                <option value="Online">Online Payment - Quick and easy</option>
                            </select>
                        </div>
                        <div class="form-text text-muted">Choose your preferred payment method</div>
                    </div>

                    <div class="action-buttons">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-check-circle me-2"></i>Place Order
                        </button>
                        <a href="home.jsp" class="btn btn-secondary">
                            <i class="fas fa-arrow-left me-2"></i>Dashboard
                        </a>
                    </div>
                </form>
            </div>
        </div>
        
        <!-- Footer Info -->
        <div class="footer-info">
            <p class="mb-0">
                © 2025 Bakery Delights. All Rights Reserved. 
            </p>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Form fields animation
            const formElements = document.querySelectorAll('.mb-4');
            formElements.forEach((el, index) => {
                el.style.opacity = '0';
                el.style.transform = 'translateY(20px)';
                el.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
                
                setTimeout(() => {
                    el.style.opacity = '1';
                    el.style.transform = 'translateY(0)';
                }, 100 * index);
            });
            
            // Form validation highlight
            const form = document.getElementById('orderForm');
            const inputs = form.querySelectorAll('input, select');
            
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.closest('.input-group').style.boxShadow = '0 0 0 3px rgba(255, 107, 107, 0.25)';
                });
                
                input.addEventListener('blur', function() {
                    this.closest('.input-group').style.boxShadow = 'none';
                });
            });
            
            // Apply styling to placeholder options
            const selects = document.querySelectorAll('select');
            selects.forEach(select => {
                select.addEventListener('change', function() {
                    if (this.value === '') {
                        this.classList.add('select-placeholder');
                    } else {
                        this.classList.remove('select-placeholder');
                    }
                });
                
                // Initial check
                if (select.value === '') {
                    select.classList.add('select-placeholder');
                }
            });
        });
    </script>
</body>
</html>