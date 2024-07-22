<%@ page import="java.sql.*" %>
<%@page import="db.DBConn"%>

<%
    // Fetch performanceBookingID from request
    String performanceBookingIDRequest = request.getParameter("performanceBookingID");

    // Database query
    String query = "SELECT performanceName, performanceDateTime, organization, objective, price "
                 + "FROM performancebooking "
                 + "LEFT JOIN performancetype ON performancebooking.performanceID = performancetype.performanceID "
                 + "WHERE performancebooking.id = ?";

    // Initialize variables to hold data
    String performanceName = "";
    String performanceDateTime = "";
    String organization = "";
    String objective = "";
    String price = "";

    // Database connection and query execution
    DBConn con = new DBConn();
    try {
        PreparedStatement ps = con.getConnection().prepareStatement(query);
        ps.setString(1, performanceBookingIDRequest);
        
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            performanceName = rs.getString("performanceName");
            performanceDateTime = rs.getString("performanceDateTime");
            organization = rs.getString("organization");
            objective = rs.getString("objective");
            price = rs.getString("price");
        }

        rs.close();
        ps.close();
    } catch (SQLException e) {
        e.printStackTrace();
        // Handle exceptions
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Receipt</title>
    <style>
    .center-p {
        margin-left: auto;
        margin-right: auto;
        width: fit-content; /* This makes the width of the p element fit its content */
    }
</style>
    <script>
        window.onload = function() {
            window.print();
        }
    </script>
    
</head>
<body>
    <div id="receipt" >
        <h1 style="text-align: center;">Voice of Harmony Booking System</h1>
        <h2 style="text-align: center;">Thank you for your bookings!</h2>
		<div style="">
                    <br><p class="center-p" style="text-align:left;"><strong>Booking ID:</strong>VOHBS#<%= performanceBookingIDRequest %></p>
		    <p class="center-p"><strong>Performance Name:</strong> <%= performanceName %></p>
		    <p class="center-p"><strong>Performance Date Time:</strong> <%= performanceDateTime %></p>
		    <p class="center-p"><strong>Organization:</strong> <%= organization %></p>
		    <p class="center-p"><strong>Objective:</strong> <%= objective %></p>
		    <p class="center-p"><strong>Price:</strong> RM <%= price %></p>
		</div>

    </div>
</body>
</html>