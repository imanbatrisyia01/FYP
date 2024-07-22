<%-- 
    Document   : viewInstrumentBooking
    Created on : 18 Nov 2023, 4:02:04 pm
    Author     : user
--%>

<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="studiobooking.Studiobooking"%>
<%@page import="studiobooking.StudiobookingDAO"%>
<%@ page import="db.DBConn" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voice of Harmony</title>
        <jsp:include page="include.jsp" />

    </head>

    <%

    StudiobookingDAO studiobookingDAO = new StudiobookingDAO();
    %>

    <body>
        <jsp:include page="navbarHepa.jsp" />
    
        <div class="container-max-widths">
            <div class="col-9 text-center container">
                <div class="py-3 text-center container">
                    <div class="row py-lg-3">
                        <div class="col-lg-6 col-md-8 mx-auto">
                            <h1 class="fw-light" style="margin-top: 4rem;">List of Studio Bookings</h1>
                        </div>
                    </div>
                </div>

                <div style="height: 500px; overflow: auto;">
                    <table class="table table-striped table-responsive table-bordered">
                        <thead>
                        <th>No.</th>
                            <th>Studio Name</th>
                            <th>Client's Name</th>
                            <th>Phone Number</th>
                            <th>Organization</th>
                            <th>Objective</th>
                            <th>From</th>
                            <th>To</th>
                        </thead>

                        <tbody>
                            <%
                                try {
                                	DBConn con = new DBConn();
                                    
                                    Statement st = con.getConnection().createStatement();
                                    
                                    String sql = "SELECT * FROM studiobooking left join studiotype on studiobooking.studioID = studiotype.studioID left join account on studiobooking.userID = account.userID ";
                                    ResultSet rs = st.executeQuery(sql);
                                    int index = 1;
                                    while (rs.next()) {
                                    
                                        String ibookingID = rs.getString("id");
                                        String studioName = rs.getString("studioName");
                                        String fullname = rs.getString("fullname");
                                        String user_phone = rs.getString("user_phone");
                                        String organization = rs.getString("organization");
                                        String objective = rs.getString("objective");
                                        String startDateTime = rs.getString("startDateTime");
                                        String finishDateTime = rs.getString("finishDateTime");
                            %>
                            <tr>
                                <td><%= index++%></td>
                                <td><%=studioName%></td>
                                <td><%=fullname%></td>
                                <td><%=user_phone%></td>
                                <td><%=organization%></td>
                                <td><%=objective%></td>
                                <td><%=startDateTime%></td>
                                <td><%=finishDateTime%></td>
                            </tr>
                            <%
                                    }
                                } catch (Exception e) {
                                    out.println(e);
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script>
            function confirmDelete(instrumentID, status) {
                var ask = window.confirm("Confirm to " + status + " this instrument?");
                if (ask) {

                    window.location.replace("updateBookingStatus.jsp?id=" + instrumentID + "&status=" + status + "&bookingType=studio");
                }
            }
        </script>
    </body>
</html>
