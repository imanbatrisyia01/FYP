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

<%@ page import="db.DBConn" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="checkLogin.jsp" />

<!DOCTYPE html>
<html>
    <head>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voice of Harmony</title>

        <jsp:include page="include.jsp" />



    </head>


    <body>
        <div class="container-max-widths">
            <div class="row">
                <div class="container">
                    <jsp:include page="navbarHepa.jsp" />
                </div>
            </div>
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
                        <th>No.</th>
                        <th>Performance Name</th>
                        <th>Client's Name</th>
                        <th>Phone Number</th>
                        <th>Organization</th>
                        <th>Remark</th>
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
                                    int index = 1;
                                    while (rs.next()) {

                                        String ibookingID = rs.getString("id");
                                        String instrumentName = rs.getString("performanceName");
                                        String fullname = rs.getString("fullname");
                                        String user_phone = rs.getString("user_phone");
                                        String organization = rs.getString("organization");
                                        String objective = rs.getString("objective");
                                        String performanceDateTime = rs.getString("performanceDateTime");
                                        String paymentReceipt = rs.getString("paymentReceipt");
                            %>
                            <tr>
                                <td><%= index++%></td>
                                <td><%=instrumentName%></td>
                                <td><%=fullname%></td>
                                <td><%=user_phone%></td>
                                <td><%=organization%></td>
                                <td><%=objective%></td>
                                <td><%=performanceDateTime%></td>
                                <td style="width: 20%;">
                                    <a href="<%= rs.getString("paymentReceipt").replace('\\', '/')%>" target="_blank">View Receipt</a>
                                </td>


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

                    window.location.replace("updateBookingStatus.jsp?id=" + instrumentID + "&status=" + status + "&bookingType=performance");
                }
            }
        </script>
    </body>
</html>
