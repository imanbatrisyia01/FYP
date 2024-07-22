<%@page import="java.util.List"%>
<%@page import="instrumentbooking.InstrumentbookingDAO"%>
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
        String id = request.getParameter("id");
        InstrumentbookingDAO instrumentbookingdao = new InstrumentbookingDAO();
        int result = instrumentbookingdao.deleteInstrumentBooking(id);

        if (result > 0) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"Record deleted successfully\")");
            out.println("window.location.href='viewInstrumentBooking.jsp';");
            out.println("</script>");
        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"Failed to delete record\")");
            out.println("window.location.href='viewInstrumentBooking.jsp';");
            out.println("</script>");
        }
    %>
</body>
</html>
