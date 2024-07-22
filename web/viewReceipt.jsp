<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="image/jpeg">    <title>View Image</title>
</head>
<body>
    <%
        try {
            // Establish database connection (replace with your connection details)
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vohbs", "root", "");

            // Execute a query to get the image URL from the database (replace with your query)
            String sql = "SELECT paymentReceipt FROM performancebooking";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            if (rs.next()) {
                // Get the image URL from the result set
                String imageUrl = rs.getString("paymentReceipt");
    %>

    <h2>Payment Receipt</h2>

    <img src="<%=rs.getString("paymentReceipt")%>" alt="Image" >

    <%
            } else {
    %>
    <p>No image found.</p>
    <%
            }

            // Close database resources
            rs.close();
            st.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
    %>
    <p>Error: <%= e.getMessage() %></p>
    <%
        }
    %>
</body>
</html>
