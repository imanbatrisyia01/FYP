<%-- 
    Document   : instrumentEdit-process
    Created on : 13 Nov 2023, 5:35:27 pm
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page import="db.DBConn"%>
<%
    String instrumentName = request.getParameter("instrumentName");
    String instrumentID = request.getParameter("instrumentID");
    String instrumentDescription = request.getParameter("instrumentDescription");

    DBConn con = new DBConn();

    String sql = "UPDATE instrumenttype SET instrumentName=?, instrumentDescription = ? where instrumentID=?";
    PreparedStatement ps = con.getConnection().prepareStatement(sql);
    ps.setString(1, instrumentName);
    ps.setString(2, instrumentDescription);
    ps.setString(3, instrumentID);

    int row = ps.executeUpdate();
    if (row > 0) {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Instrument edited successfully!');");
        out.print("location='viewInstrument.jsp';");
        out.print("</script>");
    } else {
        out.print("<script type=\"text/javascript\">");
        out.print("alert('Failed to edit instrument!');");
        out.print("location='instrumentEdit.jsp';");
        out.print("</script>");
    }
    con.closeConnection();
%>
