<%@ page import="java.util.*, com.Bakery1.utils.FeedbackFileManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Feedback</title>
    <style>
        body {
            font-family: Arial;
            background: #f0fff0;
            padding: 40px;
        }
        h2 {
            color: #28a745;
        }
        .feedback-box {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<h2>Customer Feedback</h2>
<%
    String filePath = application.getRealPath("/") + "feedbacks.txt";
    List<String> feedbacks = FeedbackFileManager.getAllFeedback(filePath);
    if (feedbacks.isEmpty()) {
%>
        <p>No feedback submitted yet.</p>
<%
    } else {
        for (String feedback : feedbacks) {
%>
        <div class="feedback-box"><%= feedback %></div>
<%
        }
    }
%>
<a href="feedback.jsp">Add More Feedback</a>
</body>
</html>