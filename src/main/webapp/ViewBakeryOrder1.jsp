<%@ page import="com.Bakery1.models.BakeryOrder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Bakery Order</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff8f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            text-align: left;
            max-width: 500px;
        }
        h2 {
            color: #333;
            text-align: center;
        }
        p {
            margin: 10px 0;
            font-size: 16px;
        }
        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
        }
        .btn:hover {
            background-color: #c82333;
        }
        .back-link {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
<%
    BakeryOrder order = (BakeryOrder) request.getAttribute("order");
    String message = (String) request.getAttribute("message");

    if (order != null) {
%>
        <h2>Your Bakery Order</h2>
        <p><strong>Customer:</strong> <%= order.getCustomerName() %></p>
        <p><strong>Item:</strong> <%= order.getItemType() %></p>
        <p><strong>Sauce Flavour:</strong> <%= order.getSauceFlavour() %></p>
        <p><strong>Quantity:</strong> <%= order.getItemCount() %></p>
        <p><strong>Payment:</strong> <%= order.getPayment() %></p>

          <a href="feedback.jsp" class="btn btn-primary">Enter Your Feedback</a>
          <br><br>

        <form method="post" action="DeleteBakeryOrderServlet">
            <input type="hidden" name="customerName" value="<%= order.getCustomerName() %>">
            <input type="submit" value="Delete My Order" class="btn">
        </form>
<%
    } else {
%>
        <p style="color:red;"><%= message != null ? message : "No order found." %></p>
<%
    }
%>
    <br><a href="home.jsp" class="back-link">← Back to Dashboard</a>
</div>
</body>
</html>