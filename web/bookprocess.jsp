<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*"%>
<%@page import="db.DBConn"%>

<%
try {
    String userID = request.getParameter("userID");
    String organization = request.getParameter("organization");
    String objective = request.getParameter("objective");
    String performanceDateTime = request.getParameter("bookDateTime");
    String performanceID = request.getParameter("performance_id");
    String contextPath = request.getContextPath();

    // Retrieve the image file
    Part imagePart = request.getPart("paymentReceipt");
    InputStream imageStream = null;
    if (imagePart != null) {
        imageStream = imagePart.getInputStream();
    }

    DBConn con = new DBConn();
    Connection connection = con.getConnection();
    connection.setAutoCommit(false); // Disable auto-commit

    String sql = "INSERT INTO performancebooking (userID, organization, objective, performanceDateTime, performanceID, paymentReceipt) VALUES (?, ?, ?, ?, ?, ?)";
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setString(1, userID);
        ps.setString(2, organization);
        ps.setString(3, objective);
        ps.setString(4, performanceDateTime);
        ps.setString(5, performanceID);
        if (imageStream != null) {
            ps.setBlob(6, imageStream);
        } else {
            // Handle the case when the image is not provided
            ps.setNull(6, Types.BLOB);
        }

        int row = ps.executeUpdate();
        if (row > 0) {
            connection.commit(); // Commit the transaction
            out.print("<script type=\"text/javascript\">");
            out.print("alert('Activity created successfully!');");
            out.print("location='" + contextPath + "/dashboard.jsp';");
            out.print("</script>");
        } else {
            connection.rollback(); // Rollback the transaction
            out.print("<script type=\"text/javascript\">");
            out.print("alert('Failed to create activity!');");
            out.print("location='" + contextPath + "/dashboard.jsp';");
            out.print("</script>");
        }
    } catch (SQLException e) {
        connection.rollback(); // Rollback the transaction in case of exception
        e.printStackTrace();
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Error: " + e.getMessage().replace("'", "\\'") + "');");
        out.print("location='" + contextPath + "/dashboard.jsp';");
        out.print("</script>");
    } finally {
        connection.setAutoCommit(true); // Enable auto-commit
        con.closeConnection();
    }
} catch (Exception e) {
    e.printStackTrace();
    out.print("<script type=\"text/javascript\">");
    out.print("alert('Unexpected error: " + e.getMessage().replace("'", "\\'") + "');");
    out.print("</script>");
}
%>
