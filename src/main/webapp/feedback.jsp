<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Submit Feedback</title>
    <style>
        body {
            font-family: Arial;
            background: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .box {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .box input, .box textarea {
            width: 100%;
            margin: 10px 0;
            padding: 10px;
        }
        .box button {
            background: #28a745;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
        }
        .box button:hover {
            background: #218838;
        }
    </style>
</head>
<body>
<div class="box">
    <h2>Leave Feedback</h2>
    <form method="post" action="FeedbackServlet">
        <input type="text" name="name" placeholder="Your Name" required><br>
        <textarea name="message" rows="4" placeholder="Your Feedback" required></textarea><br>
        <button type="submit">Submit</button>
    </form>
</div>
</body>
</html>