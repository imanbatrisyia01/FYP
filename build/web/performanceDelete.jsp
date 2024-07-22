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
<%@page import="performance.Performance"%>
<%@page import="performance.PerformanceDAO"%>

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
        	PerformanceDAO performanceDAO = new PerformanceDAO();
            int result = performanceDAO.deletePerformance(studioID);

            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"Success delete the Record\")");
            out.print("<p>Delete successfully!</p>");
            request.getRequestDispatcher("viewPerformance.jsp").include(request, response);
        %>
    </body>
    </body>
</html>
