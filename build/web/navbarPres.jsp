<!DOCTYPE html>
<%@page import="user.User"%>
<%@page import="user.UserDAO"%>


<%
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    System.out.println(loggedInUser);
    String userType = null;
    if (loggedInUser != null) {
        userType = loggedInUser.getUser_type();
    }
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Voice of Harmony Booking System</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <%
                    if (loggedInUser != null && userType.equals("1")) {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="viewUser.jsp">Users</a>
                </li>

                <%
                    }
                %>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Bookings
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">

                        <%
                            if (loggedInUser != null && userType.equals("1")) {
                       	%>
                        <li><a class="dropdown-item" href="viewStudioBooking.jsp">Studio Bookings</a></li>
                        <li><a class="dropdown-item" href="viewInstrumentBooking.jsp">Instrument Bookings</a></li>
                            <%
                                }
                            %>
                            <%
                                if (loggedInUser != null && userType.equals("2")) {
                            %>
                        <li><a class="dropdown-item" href="admin-site.jsp">Performance Bookings</a></li>             
                            <%
                                }
                            %>  
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Assets
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">

                        <%
                            if (loggedInUser != null && userType.equals("1")) {
                        %>
                        <li><a class="dropdown-item" href="viewStudio.jsp">Studio</a></li>
                        <li><a class="dropdown-item" href="viewInstrument.jsp">Instrument</a></li>
                            <%
                                }
                            %>
                            <%
                                if (loggedInUser != null && userType.equals("2")) {
                            %>
                        <li><a class="dropdown-item" href="viewPerformance.jsp">Performance</a></li>             
                            <%
                                }
                            %> 
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Account
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <%
                            if (loggedInUser != null && userType.equals("1")) {
                        %> 
                        <li><a class="dropdown-item" href="adminEdit.jsp">Edit Profile</a></li>
                        <li><a class="dropdown-item" href="index.html">Log Out</a></li>
                            <%
                                }
                            %>
                            <%
                                if (loggedInUser != null && userType.equals("2")) {
                            %>
                        <li><a class="dropdown-item" href="presEdit.jsp">Edit Profile</a></li>
                        <li><a class="dropdown-item" href="index.html">Log Out</a></li>
                            <%
                                }
                            %> 
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav> 


