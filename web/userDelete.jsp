<%-- 
    Document   : userDelete
    Created on : 23 Aug 2022, 5:18:01 pm
    Author     : user
--%>

<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="user.User"%>
<%@page import="user.UserDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <%
            String userID = request.getParameter("id");
            UserDAO userdao = new UserDAO();
            int result = userdao.deleteUser(userID);

            String id = request.getParameter("id");
            userdao.deleteUser(userID);
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"Success update the Record\")");
            out.print("<p>Delete successfully!</p>");
            request.getRequestDispatcher("viewUser.jsp").include(request, response);
        %>
    </body>
    </body>
</html>
