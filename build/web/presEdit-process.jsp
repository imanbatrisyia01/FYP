<%@page import="java.sql.*"%>
<%@page import="db.DBConn"%>
<%
    String fullname = request.getParameter("fullname");
    String user_password = request.getParameter("user_password");
    String user_email = request.getParameter("user_email");
    String user_phone = request.getParameter("user_phone");
    String user_type = request.getParameter("user_type"); // Add this line for user_type
    String userID = request.getParameter("userID");

    DBConn con = new DBConn();

    String sql = "UPDATE account SET fullname=?, user_password=?, user_email=?, user_phone=?, user_type=? WHERE userID=?";
    PreparedStatement ps = con.getConnection().prepareStatement(sql);
    ps.setString(1, fullname);
    ps.setString(2, user_password);
    ps.setString(3, user_email);
    ps.setString(4, user_phone);
    ps.setString(5, user_type); // Set user_type parameter
    ps.setString(6, userID);

    int row = ps.executeUpdate();
    if (row > 0) {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Profile edited successfully!');");
        out.print("location='viewPerformanceBooking.jsp';");
        out.print("</script>");
    } else {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Failed to edit profile!');");
        out.print("location='presEdit.jsp';");
        out.print("</script>");
    }
    con.closeConnection();
%>
