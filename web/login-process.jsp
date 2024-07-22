<%@ page  import="db.DBConn"%>
<%@ page  import="user.User"%>
<%@ page  import="user.UserDAO"%>
<%@ page  import="java.sql.*" %>
<%@ page  contentType="text/html" pageEncoding="UTF-8"%>

<%
    String user_email = request.getParameter("user_email");
    String user_password = request.getParameter("user_password");

    int status = 0;
    DBConn con = new DBConn();
    String sql = "SELECT * FROM account WHERE user_email=? AND user_password=?";
    PreparedStatement ps = con.getConnection().prepareStatement(sql);
    ps.setString(1, user_email);
    ps.setString(2, user_password);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        // If user authentication is successful, create a User object and set it in the session
        UserDAO userdao = new UserDAO();
        User user = userdao.retrieveById(rs.getString("userID"));
        session.setAttribute("loggedInUser", user);

        // Check user_type
        int userType = rs.getInt("user_type");
        if (userType == 0) {
            // user_type = 0
            response.sendRedirect("dashboard.jsp");
        } else if (userType == 1) {
            // user_type = 1
            response.sendRedirect("viewStudioBooking.jsp"); //admin/hepa
        } else if (userType == 2) {
            //user_type = 2
            response.sendRedirect("admin-site.jsp"); // presiden
        } else {
            // Handle other user_types if needed
            out.print("<script type=\"text/javascript\">");
            out.print("alert('Invalid user_type!');");
            out.print("location='login.jsp';");
            out.print("</script>");
        }
    } else {
        // Display an error message if login fails
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Sorry, Invalid username or password!');");
        out.print("location='login.jsp';");
        out.print("</script>");
    }

    con.closeConnection();
%>
