<%-- 
    Document   : forgotPassword-process
    Created on : 13 Jan 2024, 11:17:38 pm
    Author     : user
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="your.package.UserDAO" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.IOException" %>

<%
    // Get the user's email from the form submission
    String userEmail = request.getParameter("email");

    // Check if the email exists in your database
    // If yes, generate a unique token, save it to the database with the user's email and an expiration timestamp

    // Generate a unique token (you can use Java's UUID class)
    String resetToken = UUID.randomUUID().toString();

    // Save the token, email, and expiration timestamp in the database
    // Update the user's record with the resetToken and expiration timestamp

    // Create a link with the resetToken and send it to the user's email
    String resetLink = "http://yourwebsite.com/reset_password.jsp?token=" + resetToken;

    // Send an email to the user with the reset link
    sendResetEmail(userEmail, resetLink);

    // Redirect the user to a confirmation page
    response.sendRedirect("forgot_password_confirmation.jsp");
%>

<%
// Function to send a reset email to the user
void sendResetEmail(String userEmail, String resetLink) {
    final String username = "your.email@gmail.com"; // Your email
    final String password = "your_email_password"; // Your email password

    // Set up properties for your email server
    Properties props = new Properties();
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.host", "smtp.gmail.com"); // Use your email provider's SMTP server
    props.put("mail.smtp.port", "587"); // Use your email provider's SMTP port

    // Create a session with the email server
    Session session = Session.getInstance(props, new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
        }
    });

    try {
        // Create a message
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(
                Message.RecipientType.TO,
                InternetAddress.parse(userEmail)
        );
        message.setSubject("Password Reset");
        message.setText("Click the link below to reset your password:\n\n" + resetLink);

        // Send the message
        Transport.send(message);

        System.out.println("Reset email sent.");

    } catch (MessagingException e) {
        throw new RuntimeException(e);
    }
}
%>
