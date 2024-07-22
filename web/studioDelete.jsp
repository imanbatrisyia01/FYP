<%-- 
    Document   : studioDelete
    Created on : 2 Nov 2023, 8:17:16 pm
    Author     : user
--%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="studio.Studio"%>
<%@page import="studio.StudioDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <%
            String studioID = request.getParameter("id");
            StudioDAO studiodao = new StudioDAO();
            int result = studiodao.deleteStudio(studioID);

            String id = request.getParameter("id");
            studiodao.deleteStudio(studioID);
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"Success update the Record\")");
            out.print("<p>Delete successfully!</p>");
            request.getRequestDispatcher("viewStudio.jsp").include(request, response);
        %>
    </body>
    </body>
</html>
