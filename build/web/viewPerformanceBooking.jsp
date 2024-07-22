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
<%@ page import="java.net.URLEncoder" %>

<%@ page import="db.DBConn" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voice of Harmony</title>


        <jsp:include page="include.jsp" />
    </style>
</head>


<body>
    <jsp:include page="navbarPres.jsp" />
    <div class="container-max-widths">
        <div class="col-9 text-center container">
            <div class="py-3 text-center container">
                <div class="row py-lg-3">
                    <div class="col-lg-6 col-md-8 mx-auto">
                        <h1 class="fw-light" style="margin-top: 4rem;">List of Performance Bookings</h1>
                    </div>
                </div>
            </div>

            <div style="height: 500px; overflow: auto;">
                <table class="table table-striped table-responsive table-bordered">
                    <thead>
                    <th>Booking ID</th>
                    <th>Studio Name</th>
                    <th>Client's Name</th>
                    <th>Phone Number</th>
                    <th>Organization</th>
                    <th>Objective</th>
                    <th>Date Time</th>
                    <th>Receipt</th>
                    </thead>

                    <tbody>
                        <%
                            try {
                                DBConn con = new DBConn();

                                Statement st = con.getConnection().createStatement();

                                String sql = "SELECT * FROM performancebooking left join performancetype on performancebooking.performanceID = performancetype.performanceID left join account on performancebooking.userID = account.userID ";
                                ResultSet rs = st.executeQuery(sql);
                                while (rs.next()) {
                                    String ibookingID = rs.getString("id");
                                    String instrumentName = rs.getString("performanceName");
                                    String fullname = rs.getString("fullname");
                                    String user_phone = rs.getString("user_phone");
                                    String organization = rs.getString("organization");
                                    String objective = rs.getString("objective");
                                    String performanceDateTime = rs.getString("performanceDateTime");
                                    String receiptURL = rs.getString("receiptURL");
                                    String encodedURL = URLEncoder.encode(receiptURL, "UTF-8");
                        %>
                        <tr>
                            <td><%=ibookingID%></td>
                            <td><%=instrumentName%></td>
                            <td><%=fullname%></td>
                            <td><%=user_phone%></td>
                            <td><%=organization%></td>
                            <td><%=objective%></td>
                            <td><%=performanceDateTime%></td>
                            <td><a href="viewReceipt.jsp?url=<%=encodedURL%>" target="_blank">View Receipt</a></td>
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
</body>
</html>
