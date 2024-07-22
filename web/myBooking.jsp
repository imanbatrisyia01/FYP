<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="studiobooking.Studiobooking"%>
<%@page import="studiobooking.StudiobookingDAO"%>
<%@page import="instrumentbooking.Instrumentbooking"%>
<%@page import="instrumentbooking.InstrumentbookingDAO"%>
<%@page import="performancebooking.PerformanceBooking"%>
<%@page import="performancebooking.PerformanceBookingDAO"%>
<%@ page import="db.DBConn" %>
<%@ page import="user.User" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Bookings</title>
        <jsp:include page="include.jsp" />
    </head>

    <body>
        <jsp:include page="navbar.jsp" />

        <div class="container-max-widths">
            <div class="col-9 text-center container">
                <div class="py-3 text-center container">
                    <div class="row py-lg-3">
                        <div class="col-lg-6 col-md-8 mx-auto">
                            <h1 class="fw-light" style="margin-top: 4rem;">My Bookings</h1>
                        </div>
                    </div>
                </div>

                <div style="height: 500px; overflow: auto;">
                    <h2>Studio Bookings</h2>
                    <table class="table table-striped table-responsive table-bordered">
                        <thead>
                        <th>No.</th>
                        <th>Studio Name</th>
                        <th>Organization</th>
                        <th>Objective</th>
                        <th>From</th>
                        <th>To</th>
                        </thead>

                        <tbody>
                            <%
                                User loggedInUser = (User) session.getAttribute("loggedInUser");

                                if (loggedInUser != null) {
                                    int userID = loggedInUser.getUserID(); // Replace with the actual method in your User class

                                    try {
                                        DBConn con = new DBConn();
                                        Statement st = con.getConnection().createStatement();

                                        String sql = "SELECT * FROM studiobooking "
                                                + "LEFT JOIN studiotype ON studiobooking.studioID = studiotype.studioID "
                                                + "LEFT JOIN account ON studiobooking.userID = account.userID "
                                                + "WHERE studiobooking.userID = " + userID;
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
                                }
                            %>
                        </tbody>
                    </table>
                    <br><h2>Instrument Bookings</h2>
                    <table class="table table-striped table-responsive table-bordered">
                        <!-- Instrument Booking Table Header -->
                        <thead>
                        <th>No.</th>
                        <th>Instrument Name</th>
                        <th>Organization</th>
                        <th>Objective</th>
                        <th>From</th>
                        <th>To</th>
                        </thead>

                        <!-- Instrument Booking Table Body -->
                        <tbody>
                            <%
                                if (loggedInUser != null) {
                                    int userID = loggedInUser.getUserID();

                                    try {
                                        DBConn con = new DBConn();
                                        Statement st = con.getConnection().createStatement();

                                        String instrumentSql = "SELECT * FROM instrumentbooking "
                                                + "LEFT JOIN instrumenttype ON instrumentbooking.instrumentID = instrumenttype.instrumentID "
                                                + "LEFT JOIN account ON instrumentbooking.userID = account.userID "
                                                + "WHERE instrumentbooking.userID = " + userID;
                                        ResultSet instrumentRs = st.executeQuery(instrumentSql);
                                        int index = 1;
                                        while (instrumentRs.next()) {
                                            String ibookingID = instrumentRs.getString("id");
                                            String instrumentName = instrumentRs.getString("instrumentName");
                                            String fullname = instrumentRs.getString("fullname");
                                            String user_phone = instrumentRs.getString("user_phone");
                                            String organization = instrumentRs.getString("organization");
                                            String objective = instrumentRs.getString("objective");
                                            String startDateTime = instrumentRs.getString("startDateTime");
                                            String finishDateTime = instrumentRs.getString("finishDateTime");
                            %>
                            <tr>
                                <td><%= index++%></td>
                                <td><%= instrumentName%></td>
                                <td><%= organization%></td>
                                <td><%= objective%></td>
                                <td><%= startDateTime%></td>
                                <td><%= finishDateTime%></td>
                            </tr>
                            <%
                                        }
                                    } catch (Exception e) {
                                        out.println(e);
                                    }
                                }
                            %>
                        </tbody>
                    </table>  

                    <br><h2>Performance Bookings</h2>
                    <table class="table table-striped table-responsive table-bordered">
                        <!-- Performance Booking Table Header -->
                        <thead>
                        <th>No.</th>
                        <th>Performance Name</th>
                        <th>Organization</th>
                        <th>Objective</th>
                        <th>Booking Date Time</th>
                        </thead>

                        <!-- Performance Booking Table Body -->
                        <tbody>
                            <%
                                if (loggedInUser != null) {
                                    int userID = loggedInUser.getUserID();

                                    try {
                                        DBConn con = new DBConn();
                                        Statement st = con.getConnection().createStatement();

                                        String performanceSql = "SELECT * FROM performancebooking "
                                                + "LEFT JOIN performancetype ON performancebooking.performanceID = performancetype.performanceID "
                                                + "LEFT JOIN account ON performancebooking.userID = account.userID "
                                                + "WHERE performancebooking.userID = " + userID;
                                        ResultSet performanceRs = st.executeQuery(performanceSql);
                                        int index = 1;
                                        while (performanceRs.next()) {
                                            String ibookingID = performanceRs.getString("id");
                                            String performanceName = performanceRs.getString("performanceName");
                                            String fullname = performanceRs.getString("fullname");
                                            String user_phone = performanceRs.getString("user_phone");
                                            String organization = performanceRs.getString("organization");
                                            String objective = performanceRs.getString("objective");
                                            String performanceDateTime = performanceRs.getString("performanceDateTime");
                            %>
                            <tr>
                                <td><%= index++%></td>
                                <td><%= performanceName%></td>
                                <td><%= organization%></td>
                                <td><%= objective%></td>
                                <td><%= performanceDateTime%></td>
                            </tr>
                            <%
                                        }
                                    } catch (Exception e) {
                                        out.println(e);
                                    }
                                }
                            %>
                        </tbody>
                    </table>  
                </div>
            </div>
        </div>
    </body>
</html>
