<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bakery Delights</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <style>
        /* Original Styles */
        body {
            background: linear-gradient(rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.9)),
                        url('images/1.jpg') center/cover fixed;
            min-height: 100vh;
            overflow-x: hidden;
            font-family: 'Montserrat', sans-serif;
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
            overflow: hidden;
            padding: 20px;
            letter-spacing: 1px;
            word-spacing: 4px;
            text-transform: capitalize;
            line-height: 1.4;
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

        /* Enhanced Animations CSS */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideInLeft {
            from { opacity: 0; transform: translateX(-50px); }
            to { opacity: 1; transform: translateX(0); }
        }

        @keyframes slideInRight {
            from { opacity: 0; transform: translateX(50px); }
            to { opacity: 1; transform: translateX(0); }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-15px); }
            100% { transform: translateY(0px); }
        }

        /* Word reveal animation - enhanced */
        @keyframes wordReveal {
            0% { opacity: 0; transform: translateY(50px) scale(0.8); }
            70% { opacity: 1; transform: translateY(-10px) scale(1.05); }
            100% { opacity: 1; transform: translateY(0) scale(1); }
        }

        /* Letter bounce animation - enhanced */
        @keyframes letterBounce {
            0% { transform: translateY(0); }
            30% { transform: translateY(-25px); }
            50% { transform: translateY(0); }
            75% { transform: translateY(-10px); }
            100% { transform: translateY(0); }
        }

        /* 3D card flip effect */
        @keyframes cardFlip {
            0% { transform: perspective(800px) rotateY(0); }
            100% { transform: perspective(800px) rotateY(180deg); }
        }

        /* New shining animation - enhanced */
        @keyframes shine {
            0% {
                left: -150%;
                opacity: 0;
            }
            10% {
                opacity: 0.5;
            }
            50% {
                opacity: 0.8;
            }
            100% {
                left: 150%;
                opacity: 0;
            }
        }

        /* Card swing animation - enhanced */
        @keyframes cardSwing {
            0% { transform: rotate(0deg); }
            25% { transform: rotate(5deg); }
            75% { transform: rotate(-5deg); }
            100% { transform: rotate(0deg); }
        }

        /* Button pulse animation - enhanced */
        @keyframes buttonPulse {
            0% { box-shadow: 0 0 0 0 rgba(255, 77, 77, 0.9); }
            70% { box-shadow: 0 0 0 15px rgba(255, 77, 77, 0); }
            100% { box-shadow: 0 0 0 0 rgba(255, 77, 77, 0); }
        }

        /* Rotating animation */
        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /* Bounce animation - enhanced */
        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
            40% { transform: translateY(-30px); }
            60% { transform: translateY(-15px); }
        }

        /* Heartbeat animation - enhanced */
        @keyframes heartbeat {
            0% { transform: scale(1); }
            25% { transform: scale(1.2); }
            40% { transform: scale(1); }
            60% { transform: scale(1.2); }
            100% { transform: scale(1); }
        }

        /* Water ripple animation - enhanced */
        @keyframes ripple {
            0% { transform: scale(1); opacity: 1; }
            100% { transform: scale(3.5); opacity: 0; }
        }

        /* Staggered text animation */
        .word-animation {
            display: inline-block;
            opacity: 0;
            animation: wordReveal 0.7s forwards;
        }

        .letter-animation {
            display: inline-block;
            animation: letterBounce 0.5s forwards;
        }

        .animate-fadeIn {
            opacity: 0;
            animation: fadeIn 1s ease forwards;
        }

        .animate-slideInLeft {
            opacity: 0;
            animation: slideInLeft 1s ease forwards;
        }

        .animate-slideInRight {
            opacity: 0;
            animation: slideInRight 1s ease forwards;
        }

        .delay-100 { animation-delay: 0.1s; }
        .delay-200 { animation-delay: 0.2s; }
        .delay-300 { animation-delay: 0.3s; }
        .delay-400 { animation-delay: 0.4s; }
        .delay-500 { animation-delay: 0.5s; }

        /* Enhanced hover effects */
        .enhanced-hover {
            transition: all 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
        }

        .enhanced-hover:hover {
            transform: translateY(-20px) scale(1.05);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        }

        .enhanced-hover::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(to right, #ff4d4d, #ff9e8a);
            transform: scaleX(0);
            transition: transform 0.5s cubic-bezier(0.165, 0.84, 0.44, 1);
        }

        .enhanced-hover:hover::after {
            transform: scaleX(1);
        }

        /* 3D Parallax effect - enhanced */
        .parallax-bg {
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;
            overflow: hidden;
        }

        .parallax-content {
            transform-style: preserve-3d;
            transform: perspective(1000px);
        }

        /* Animated buttons - enhanced */
        .btn-animated {
            position: relative;
            overflow: hidden;
            z-index: 1;
            transition: all 0.4s cubic-bezier(0.19, 1, 0.22, 1);
        }

        .btn-animated:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 0;
            background: rgba(255, 255, 255, 0.3);
            transition: all 0.4s cubic-bezier(0.19, 1, 0.22, 1);
            z-index: -1;
        }

        .btn-animated:hover {
            transform: translateY(-8px) scale(1.05);
            box-shadow: 0 15px 30px rgba(255, 77, 77, 0.5);
        }

        .btn-animated:hover:after {
            height: 100%;
        }

        /* Pulsing button - enhanced */
        .btn-pulse {
            animation: buttonPulse 2s infinite;
        }

        /* Text gradient effect - enhanced */
        .gradient-text {
            background: linear-gradient(45deg, #ff4d4d, #ff9696);
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
            display: inline-block;
            position: relative;
            font-weight: bold;
        }

        .gradient-text::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -8px;
            width: 100%;
            height: 4px;
            background: linear-gradient(45deg, #ff4d4d, #ff9696);
            transform: scaleX(0);
            transform-origin: right;
            transition: transform 0.5s ease-out;
        }

        .gradient-text:hover::after {
            transform: scaleX(1);
            transform-origin: left;
        }

        /* Enhanced floating icons */
        .floating-icon {
            animation: float 4s ease-in-out infinite;
            position: relative;
        }

        .floating-icon::before {
            content: '';
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 60%;
            height: 10px;
            background: radial-gradient(ellipse at center, rgba(0,0,0,0.2) 0%, rgba(0,0,0,0) 80%);
            border-radius: 50%;
            opacity: 0.5;
            animation: shadow 4s ease-in-out infinite;
        }

        @keyframes shadow {
            0%, 100% { transform: translateX(-50%) scale(1); }
            50% { transform: translateX(-50%) scale(0.6); }
        }

        /* Enhanced navbar */
        .navbar-enhanced {
            transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
        }

        .navbar-scrolled {
            padding: 5px 0;
            background: rgba(255, 255, 255, 0.98) !important;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1) !important;
        }

        /* Enhanced Feature Cards */
        .feature-card {
            position: relative;
            z-index: 1;
            overflow: hidden;
            transform-style: preserve-3d;
            transition: all 0.6s cubic-bezier(0.165, 0.84, 0.44, 1);
            height: 380px;
            margin-bottom: 30px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            background-position: center;
            background-size: cover;
            border-radius: 15px;
        }

        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(to bottom, rgba(0,0,0,0.1), rgba(0,0,0,0.7));
            opacity: 0.8;
            transition: all 0.6s ease;
            z-index: 1;
            border-radius: 15px;
        }

        .feature-card:hover::before {
            opacity: 0.9;
            background: linear-gradient(to bottom, rgba(255,77,77,0.8), rgba(0,0,0,0.8));
        }

        .card-content {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            padding: 30px;
            z-index: 2;
            transform: translateY(30px);
            transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
            color: white;
            text-align: left;
        }

        .feature-card:hover .card-content {
            transform: translateY(0);
        }

        .feature-card h3 {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 15px;
            transform: translateY(20px);
            opacity: 0.9;
            transition: all 0.5s cubic-bezier(0.23, 1, 0.32, 1);
            text-shadow: 2px 2px 4px rgba(0,0,0,0.4);
        }

        .feature-card:hover h3 {
            transform: translateY(0);
            opacity: 1;
        }

        .feature-card p {
            opacity: 0;
            transform: translateY(20px);
            transition: all 0.5s cubic-bezier(0.23, 1, 0.32, 1);
            transition-delay: 0.05s;
            margin-bottom: 20px;
            font-size: 1.1rem;
        }

        .feature-card:hover p {
            opacity: 1;
            transform: translateY(0);
        }

        .feature-card .feature-details {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 15px;
            opacity: 0;
            transform: translateY(20px);
            transition: all 0.5s cubic-bezier(0.23, 1, 0.32, 1);
            transition-delay: 0.1s;
        }

        .feature-card:hover .feature-details {
            opacity: 1;
            transform: translateY(0);
        }

        .feature-tag {
            background: rgba(255, 255, 255, 0.2);
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
            backdrop-filter: blur(5px);
        }

        .feature-card .btn-feature {
            position: absolute;
            bottom: 30px;
            right: 30px;
            background: #ff4d4d;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 30px;
            transform: translateY(80px);
            opacity: 0;
            transition: all 0.5s cubic-bezier(0.23, 1, 0.32, 1);
            transition-delay: 0.15s;
            z-index: 3;
            font-weight: 600;
            font-size: 1rem;
        }

        .feature-card:hover .btn-feature {
            transform: translateY(0);
            opacity: 1;
        }

        .btn-feature:hover {
            background: #ff3333;
            box-shadow: 0 10px 20px rgba(255, 77, 77, 0.5);
            transform: translateY(-8px) !important;
        }

        /* Ripple effect for buttons - enhanced */
        .btn-ripple {
            position: relative;
            overflow: hidden;
        }

        .btn-ripple:after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 15px;
            height: 15px;
            background: rgba(255, 255, 255, 0.6);
            border-radius: 50%;
            transform: scale(0);
            animation: ripple 1.2s linear;
            opacity: 0;
        }

        .btn-ripple:hover:after {
            opacity: 1;
            transform-origin: center;
            animation: ripple 1.2s linear;
        }

        .feature-icon-large {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 3.8rem;
            color: rgba(255, 255, 255, 0.3);
            z-index: 2;
            transition: all 0.5s ease;
        }

        .feature-card:hover .feature-icon-large {
            transform: rotate(15deg) scale(1.3);
            color: rgba(255, 255, 255, 0.6);
        }

        /* New hover shine effect - enhanced */
        .shine-effect {
            position: relative;
            overflow: hidden;
        }

        .shine-effect:before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 75%;
            height: 100%;
            background: linear-gradient(to right, rgba(255,255,255,0) 0%, rgba(255,255,255,0.4) 100%);
            transform: skewX(-25deg);
            transition: all 0.75s;
            z-index: 2;
        }

        .shine-effect:hover:before {
            animation: shine 1.5s;
        }

        /* Heartbeat animation for icons - enhanced */
        .heartbeat-icon {
            animation: heartbeat 2s ease-in-out infinite;
            transform-origin: center;
        }

        /* Swing animation for cards - enhanced */
        .swing-on-hover:hover {
            animation: cardSwing 2s ease-in-out;
        }

        .custom-cake-card {
            background-image: url('https://images.unsplash.com/photo-1588195538326-c5b1e9f80a1b?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80');
        }

        .fresh-bread-card {
            background-image: url('https://images.unsplash.com/photo-1509440159596-0249088772ff?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80');
        }

        .pastries-card {
            background-image: url('https://images.unsplash.com/photo-1517686469429-8bdb88b9f907?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80');
        }

        /* 3D Tilt Effect - enhanced */
        .tilt-card {
            transition: transform 0.5s ease;
            transform-style: preserve-3d;
            perspective: 1000px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
        }

        /* Rotating animation - enhanced */
        .rotate-animation {
            animation: rotate 20s linear infinite;
        }

        /* Blob animation for background - enhanced */
        .blob-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
            overflow: hidden;
        }

        .blob {
            position: absolute;
            border-radius: 50%;
            opacity: 0.15;
            filter: blur(80px);
        }

        @keyframes blobFloat {
            0% { transform: translate(0, 0) scale(1); }
            33% { transform: translate(60px, 60px) scale(1.15); }
            66% { transform: translate(-60px, 30px) scale(0.85); }
            100% { transform: translate(30px, -40px) scale(1.1); }
        }

        /* Confetti effect - enhanced */
        .confetti {
            position: absolute;
            width: 12px;
            height: 12px;
            background-color: #ff4d4d;
            opacity: 0.9;
            animation: confetti-fall linear forwards;
        }

        @keyframes confetti-fall {
            0% {
                transform: translateY(-100vh) rotate(0deg);
                opacity: 1;
            }
            100% {
                transform: translateY(100vh) rotate(720deg);
                opacity: 0;
            }
        }

        /* Hero word-by-word animation - enhanced */
        .hero-text-wrapper {
            display: inline-block;
            overflow: visible;
        }

        .hero-word {
            display: inline-block;
            margin-right: 12px;
            opacity: 0;
            animation: wordReveal 0.8s cubic-bezier(0.215, 0.61, 0.355, 1) forwards;
            transform: perspective(1000px);
        }

        /* Section Titles - enhanced */
        .section-title {
            position: relative;
            margin-bottom: 60px;
            font-weight: 800;
            font-size: 3rem;
            overflow: hidden;
            color: #333;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 5px;
            background: linear-gradient(to right, #ff4d4d, #ff9e8a);
            border-radius: 3px;
        }

        .subtitle {
            color: #666;
            max-width: 800px;
            margin: 0 auto 50px;
            font-size: 1.3rem;
            line-height: 1.6;
        }

        /* New bounce animation for buttons - enhanced */
        .bounce-animation:hover {
            animation: bounce 1s ease;
        }

        /* New text reveal animation */
        .reveal-text {
            position: relative;
            overflow: hidden;
        }

        .reveal-text span {
            display: inline-block;
            transform: translateY(100%);
            opacity: 0;
            transition: all 0.5s cubic-bezier(0.55, 0.085, 0.68, 0.53);
        }

        .reveal-text.active span {
            transform: translateY(0);
            opacity: 1;
        }

        /* Particle animation - enhanced */
        .particle {
            position: absolute;
            border-radius: 50%;
            pointer-events: none;
            animation: particleFloat 4s linear infinite;
            z-index: 3;
        }

        @keyframes particleFloat {
            0% {
                transform: translateY(0) rotate(0deg);
                opacity: 1;
            }
            100% {
                transform: translateY(-150px) rotate(360deg);
                opacity: 0;
            }
        }

        /* Swing animation for icons - enhanced */
        .swing-icon {
            transform-origin: top center;
            animation: swing 3s ease infinite;
        }

        @keyframes swing {
            20% { transform: rotate(20deg); }
            40% { transform: rotate(-15deg); }
            60% { transform: rotate(10deg); }
            80% { transform: rotate(-10deg); }
            100% { transform: rotate(0deg); }
        }

        /* Order Button Sections - enhanced */
        .order-section {
            padding: 60px 0;
            margin: 40px 0;
            position: relative;
            overflow: hidden;
            border-radius: 25px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            transition: all 0.4s ease;
        }

        .order-section:hover {
            transform: translateY(-10px);
            box-shadow: 0 30px 60px rgba(0, 0, 0, 0.15);
        }

        .custom-order-section {
            background: linear-gradient(135deg, #ffafbd, #ffc3a0);
        }

        .bakery-order-section {
            background: linear-gradient(135deg, #a1c4fd, #c2e9fb);
        }

        .order-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 40px;
            color: white;
            text-align: center;
        }

        .order-content h3 {
            font-size: 2.8rem;
            font-weight: 800;
            margin-bottom: 20px;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
        }

        .order-content p {
            font-size: 1.3rem;
            margin-bottom: 30px;
            max-width: 700px;
            line-height: 1.6;
        }

        .btn-xl {
            padding: 16px 45px;
            font-size: 1.3rem;
            border-radius: 50px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }

        .btn-xl:hover {
            transform: translateY(-10px) scale(1.05);
            box-shadow: 0 20px 30px rgba(0, 0, 0, 0.2);
        }

        .btn-custom-order {
            background: #ff4d4d;
            border: none;
            color: white;
            box-shadow: 0 15px 25px rgba(255, 77, 77, 0.3);
        }

        .btn-custom-order:hover {
            background: #ff3333;
            box-shadow: 0 20px 35px rgba(255, 77, 77, 0.5);
        }

        .btn-bakery-order {
            background: #5e8fff;
            border: none;
            color: white;
            box-shadow: 0 15px 25px rgba(94, 143, 255, 0.3);
        }

        .btn-bakery-order:hover {
            background: #4a7eff;
            box-shadow: 0 20px 35px rgba(94, 143, 255, 0.5);
        }

        .order-icon {
            font-size: 6rem;
            margin-bottom: 25px;
            color: white;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
        }

        .or-divider {
            position: relative;
            text-align: center;
            margin: 50px 0;
        }

        .or-divider::before,
        .or-divider::after {
            content: '';
            position: absolute;
            top: 50%;
            width: 40%;
            height: 2px;
            background: rgba(0, 0, 0, 0.1);
        }

        .or-divider::before {
            left: 0;
        }

        .or-divider::after {
            right: 0;
        }

        .or-text {
            display: inline-block;
            padding: 15px 30px;
            background: #fff;
            border-radius: 50px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 1;
            font-weight: 700;
            font-size: 1.2rem;
            color: #666;
            letter-spacing: 2px;
        }
    </style>
</head>
<body>
    <!-- Blob container for animated background elements -->
    <div class="blob-container">
        <div class="blob" style="width: 350px; height: 350px; left: 20%; top: 20%; background: rgba(255, 120, 120, 1); animation: blobFloat 22s ease-in-out infinite alternate;"></div>
        <div class="blob" style="width: 400px; height: 400px; left: 60%; top: 60%; background: rgba(255, 150, 150, 1); animation: blobFloat 28s ease-in-out infinite alternate;"></div>
        <div class="blob" style="width: 300px; height: 300px; left: 80%; top: 30%; background: rgba(255, 180, 180, 1); animation: blobFloat 20s ease-in-out infinite alternate;"></div>
    </div>

    <nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-enhanced">
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
                    <li class="nav-item"><a class="btn btn-nav btn-animated btn-pulse" href="logout.jsp">Log out</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div id="home" class="hero parallax-bg">
        <h1 class="text-center" id="hero-text">Delicious Cakes & Pastries Just for You</h1>
    </div>

    <section id="about" class="section">
        <div class="container">
            <h2 class="section-title" data-aos="fade-up">Our Specialties</h2>
            <p class="subtitle" data-aos="fade-up" data-aos-delay="100">
                Indulge in our handcrafted creations made with the finest ingredients and passion for baking excellence.
            </p>
            <div class="row g-4">
                <!-- Custom Cakes Card -->
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="feature-card custom-cake-card shine-effect swing-on-hover">
                        <div class="card-content">
                            <h3>Custom Cakes</h3>
                            <p>Celebrate your special moments with our personalized cake designs, tailored to your unique vision and taste preferences.</p>
                            <div class="feature-details">
                                <span class="feature-tag">Birthday</span>
                                <span class="feature-tag">Wedding</span>
                                <span class="feature-tag">Anniversary</span>
                                <span class="feature-tag">Custom Design</span>
                            </div>
                        </div>
                        <i class="fas fa-birthday-cake feature-icon-large heartbeat-icon"></i>
                        <a href="custom.jsp" class="btn btn-feature btn-ripple">Design Now</a>
                    </div>
                </div>
                
                <!-- Fresh Breads Card -->
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                    <div class="feature-card fresh-bread-card shine-effect swing-on-hover">
                        <div class="card-content">
                            <h3>Fresh Breads</h3>
                            <p>Savor the aroma and taste of our daily baked artisanal breads, crafted using traditional techniques and premium ingredients.</p>
                            <div class="feature-details">
                                <span class="feature-tag">Sourdough</span>
                                <span class="feature-tag">Baguette</span>
                                <span class="feature-tag">Whole Grain</span>
                                <span class="feature-tag">Gluten-Free</span>
                            </div>
                        </div>
                        <i class="fas fa-bread-slice feature-icon-large swing-icon"></i>
                        <a href="BakeryOrder.jsp" class="btn btn-feature btn-ripple">Order Now</a>
                    </div>
                </div>
                
                <!-- Artisan Pastries Card -->
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
                    <div class="feature-card pastries-card shine-effect swing-on-hover">
                        <div class="card-content">
                            <h3>Artisan Pastries</h3>
                            <p>Indulge in our exquisite selection of handcrafted pastries, from flaky croissants to decadent éclairs and delicate macarons.</p>
                            <div class="feature-details">
                                <span class="feature-tag">Croissants</span>
                                <span class="feature-tag">Éclairs</span>
                                <span class="feature-tag">Macarons</span>
                                <span class="feature-tag">Danish</span>
                            </div>
                        </div>
                        <i class="fas fa-cookie feature-icon-large floating-icon"></i>
                        <a href="BakeryOrder.jsp" class="btn btn-feature btn-ripple">Order Now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Custom Order Section -->
    <section id="custom-order" class="section">
        <div class="container" data-aos="fade-up">
            <div class="order-section custom-order-section">
                <div class="order-content">
                    <i class="fas fa-birthday-cake order-icon floating-icon"></i>
                    <h3>Custom Cake Orders</h3>
                    <p>Create your perfect cake masterpiece for any special occasion. Choose your design, flavors, and decorations exactly how you want them.</p>
                    <a href="custom.jsp" class="btn btn-xl btn-custom-order btn-animated btn-pulse bounce-animation">Design Your Cake</a>
                </div>
            </div>
        </div>
    </section>

    <!-- OR Divider -->
    <div class="container">
        <div class="or-divider">
            <span class="or-text">OR</span>
        </div>
    </div>

    <!-- Bakery Order Section -->
    <section id="bakery-order" class="section">
        <div class="container" data-aos="fade-up">
            <div class="order-section bakery-order-section">
                <div class="order-content">
                    <i class="fas fa-shopping-basket order-icon swing-icon"></i>
                    <h3>Bakery Products</h3>
                    <p>Order from our selection of freshly baked breads, pastries, cookies, and more. Perfect for your daily enjoyment or special gatherings.</p>
                    <a href="BakeryOrder.jsp" class="btn btn-xl btn-bakery-order btn-animated bounce-animation">Order Bakery Items</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vanilla-tilt/1.7.0/vanilla-tilt.min.js"></script>
    <script>
        // Initialize animations when document is loaded
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize AOS animations with enhanced settings
            AOS.init({
                duration: 1000,
                easing: 'ease-out-cubic',
                once: false,
                mirror: true,
                offset: 120,
                delay: 100,
                anchor: 'top-center'
            });
            
            // Initialize enhanced tilt effect
            VanillaTilt.init(document.querySelectorAll(".tilt-card"), {
                max: 20,
                speed: 500,
                glare: true,
                "max-glare": 0.3,
                scale: 1.05,
                perspective: 1000
            });
            
            // Smooth scrolling for anchor links
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function(e) {
                    e.preventDefault();
                    
                    const targetId = this.getAttribute('href');
                    if(targetId === '#') return;
                    
                    const targetElement = document.querySelector(targetId);
                    if (!targetElement) return;
                    
                    window.scrollTo({
                        top: targetElement.offsetTop - 80,
                        behavior: 'smooth'
                    });
                });
            });
            
            // Enhanced navbar scroll effect
            const navbar = document.querySelector('.navbar');
            window.addEventListener('scroll', function() {
                if (window.scrollY > 50) {
                    navbar.classList.add('navbar-scrolled');
                } else {
                    navbar.classList.remove('navbar-scrolled');
                }
            });
            
            // Enhanced parallax effect for background
            const parallaxElements = document.querySelectorAll('.parallax-bg');
            window.addEventListener('scroll', function() {
                parallaxElements.forEach(element => {
                    const scrollPosition = window.pageYOffset;
                    const speed = 0.5; // Enhanced speed
                    element.style.backgroundPositionY = (scrollPosition * speed) + 'px';
                });
            });
            
            // Enhanced word by word animation for hero text
            animateHeroText();
            
            // Add interactive confetti effect with improved visual
            document.querySelectorAll('.btn-feature, .btn-custom-order, .btn-bakery-order').forEach(button => {
                button.addEventListener('mouseover', createConfetti);
                button.addEventListener('click', function(e) {
                    createEnhancedConfetti(e, 40); // More confetti on click
                });
            });
            
            // Function to add confetti effect
            function createConfetti(e) {
                const confettiCount = 15;
                const colors = ['#ff4d4d', '#ffacac', '#ff9696', '#ffcece', '#ffffff'];
                
                for (let i = 0; i < confettiCount; i++) {
                    const confetti = document.createElement('div');
                    confetti.className = 'confetti';
                    confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                    confetti.style.left = (e.clientX + (Math.random() * 100 - 50)) + 'px';
                    confetti.style.top = (e.clientY + (Math.random() * 20 - 10)) + 'px';
                    confetti.style.width = (Math.random() * 10 + 5) + 'px';
                    confetti.style.height = (Math.random() * 10 + 5) + 'px';
                    confetti.style.animationDuration = (Math.random() * 3 + 2) + 's';
                    confetti.style.transform = 'rotate(' + (Math.random() * 360) + 'deg)';
                    document.body.appendChild(confetti);
                    
                    // Remove the confetti after animation completes
                    setTimeout(() => {
                        confetti.remove();
                    }, 5000);
                }
            }
            
            // Enhanced confetti effect
            function createEnhancedConfetti(e, count) {
                const confettiCount = count || 20;
                const colors = ['#ff4d4d', '#ffacac', '#ff9696', '#ffcece', '#ffffff', '#ffd700', '#ff9e8a'];
                
                for (let i = 0; i < confettiCount; i++) {
                    const confetti = document.createElement('div');
                    confetti.className = 'confetti';
                    confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                    confetti.style.left = (e.clientX + (Math.random() * 200 - 100)) + 'px';
                    confetti.style.top = (e.clientY + (Math.random() * 20 - 10)) + 'px';
                    
                    // Random shapes for confetti
                    const shapeRandom = Math.random();
                    if (shapeRandom > 0.7) {
                        // Circle
                        confetti.style.borderRadius = '50%';
                    } else if (shapeRandom > 0.4) {
                        // Square
                        confetti.style.borderRadius = '0';
                    } else {
                        // Triangle (using clip-path)
                        confetti.style.clipPath = 'polygon(50% 0%, 0% 100%, 100% 100%)';
                    }
                    
                    confetti.style.width = (Math.random() * 12 + 5) + 'px';
                    confetti.style.height = (Math.random() * 12 + 5) + 'px';
                    confetti.style.animationDuration = (Math.random() * 5 + 2) + 's';
                    confetti.style.transform = 'rotate(' + (Math.random() * 360) + 'deg)';
                    document.body.appendChild(confetti);
                    
                    // Remove the confetti after animation completes
                    setTimeout(() => {
                        confetti.remove();
                    }, 7000);
                }
            }
            
            // Enhanced word by word animation for the hero text
            function animateHeroText() {
                const heroText = document.getElementById('hero-text');
                if (!heroText) return;
                
                const text = heroText.textContent.trim();
                heroText.innerHTML = '';
                
                // Add wrapper for perspective effect
                const textWrapper = document.createElement('div');
                textWrapper.className = 'hero-text-wrapper';
                heroText.appendChild(textWrapper);
                
                // Split the text into words and animate each word
                const words = text.split(' ');
                words.forEach((word, index) => {
                    const wordSpan = document.createElement('span');
                    wordSpan.className = 'hero-word';
                    wordSpan.textContent = word;
                    wordSpan.style.animationDelay = `${index * 0.2}s`; // Slightly longer delay between words
                    textWrapper.appendChild(wordSpan);
                });
            }
            
            // Add enhanced particle effect on hover for order sections with improved visuals
            document.querySelectorAll('.order-section').forEach(section => {
                section.addEventListener('mousemove', createEnhancedParticles);
            });
            
            function createEnhancedParticles(e) {
                if(Math.random() > 0.7) { // Reduced frequency for cleaner effect
                    const rect = this.getBoundingClientRect();
                    const x = e.clientX - rect.left;
                    const y = e.clientY - rect.top;
                    
                    const particle = document.createElement('div');
                    particle.className = 'particle';
                    
                    // Larger, more visible particles
                    particle.style.width = (Math.random() * 10 + 4) + 'px';
                    particle.style.height = particle.style.width;
                    
                    // Different colors based on section type
                    if(this.classList.contains('custom-order-section')) {
                        particle.style.background = `rgba(255, ${Math.floor(Math.random() * 100) + 150}, ${Math.floor(Math.random() * 100) + 150}, 0.8)`;
                    } else {
                        particle.style.background = `rgba(${Math.floor(Math.random() * 100) + 150}, ${Math.floor(Math.random() * 100) + 150}, 255, 0.8)`;
                    }
                    
                    particle.style.left = x + 'px';
                    particle.style.top = y + 'px';
                    particle.style.boxShadow = '0 0 10px rgba(255,255,255,0.5)'; // Add glow effect
                    
                    this.appendChild(particle);
                    
                    // Remove after animation completes
                    setTimeout(() => {
                        particle.remove();
                    }, 4000);
                }
            }
        });
    </script>
</body>
</html>