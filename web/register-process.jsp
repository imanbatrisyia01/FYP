<%@page import="db.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    String fullname = request.getParameter("fullname");
    String user_password = request.getParameter("user_password");
    String user_email = request.getParameter("user_email");
    String user_phone = request.getParameter("user_phone");

    // Add additional validation for email uniqueness here if needed.

    DBConn con = new DBConn();
    
    try {
        String checkExistingEmailQuery = "SELECT COUNT(*) FROM account WHERE user_email = ?";
        PreparedStatement checkEmailStmt = con.getConnection().prepareStatement(checkExistingEmailQuery);
        checkEmailStmt.setString(1, user_email);
        ResultSet emailResult = checkEmailStmt.executeQuery();

        emailResult.next();
        int existingEmailCount = emailResult.getInt(1);
        checkEmailStmt.close();

        if (existingEmailCount > 0) {
            // Email already exists, show an error message.
            out.print("<script type=\"text/javascript\">");
            out.print("alert('Failed to register! Email already in use.');");
            out.print("location='register.jsp';");
            out.print("</script>");
        } else {
            // Email is unique, proceed with registration.
            String insertQuery = "INSERT INTO account (fullname, user_password, user_email, user_phone, user_type) VALUES (?, ?, ?, ?, 0)";
            PreparedStatement insertStmt = con.getConnection().prepareStatement(insertQuery);
            insertStmt.setString(1, fullname);
            insertStmt.setString(2, user_password);
            insertStmt.setString(3, user_email);
            insertStmt.setString(4, user_phone);
            //insertStmt.setString(5, user_type);
            int rowsAffected = insertStmt.executeUpdate();
            insertStmt.close();

            if (rowsAffected > 0) {
                out.print("<script type=\"text/javascript\">");
                out.print("alert('Registration Successful!');");
                out.print("location='login.jsp';");
                out.print("</script>");
            } else {
                out.print("<script type=\"text/javascript\">");
                out.print("alert('Failed to register! Please try again.');");
                out.print("location='register.jsp';");
                out.print("</script>");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Handle this error more gracefully in a production environment.
    } finally {
        con.closeConnection();
    }
%>