<%-- 
    Document   : instrumentDelete
    Created on : 13 Nov 2023, 5:29:59 pm
    Author     : user
--%>

<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="instrument.Instrument"%>
<%@page import="instrument.InstrumentDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <%
            String instrumentID = request.getParameter("id");
            InstrumentDAO instrumentdao = new InstrumentDAO();
            int result = instrumentdao.deleteInstrument(instrumentID);

            String id = request.getParameter("id");
            instrumentdao.deleteInstrument(instrumentID);
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"Success update the Record\")");
            out.print("<p>Delete successfully!</p>");
            request.getRequestDispatcher("viewInstrument.jsp").include(request, response);
        %>
    </body>
    </body>
</html>
