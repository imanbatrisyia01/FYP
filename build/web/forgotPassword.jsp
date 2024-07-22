<%-- 
    Document   : forgotPassword
    Created on : 13 Jan 2024, 11:16:27 pm
    Author     : user
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Add your head content here -->
    <title>Forgot Password</title>
</head>
<body>
    <!-- Your page content -->
    <h1>Forgot Password</h1>
    <form action="forgotPassword-process.jsp" method="post">
        <!-- Include necessary input fields for email, etc. -->
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <br>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
