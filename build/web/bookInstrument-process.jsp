<%-- 
    Document   : bookInstrument-process.jsp
    Created on : 29 Oct 2023, 9:40:20 pm
    Author     : user
--%>

<%@ page import="db.DBConn" %>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="user.User"%>
<%@page import="user.UserDAO"%>
<%@page import="instrument.Instrument"%>
<%@page import="instrument.InstrumentDAO"%>
<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.84.0">

        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/checkout/">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Assume you have the booked start and finish date-time values in session attributes
                var bookedStartDateTime = "<%= session.getAttribute("bookedStartDateTime")%>";
                var bookedFinishDateTime = "<%= session.getAttribute("bookedFinishDateTime")%>";

                flatpickr('#startDateTime, #finishDateTime', {
                    enableTime: true,
                    altFormat: "F j, Y H:i",
                    dateFormat: "Y-m-d H:i",
                    minDate: "today",
                    disable: [
                        function (date) {
                            // Disable dates before today
                            return date < new Date();
                        },
                        function (date) {
                            // Disable dates between bookedStartDateTime and bookedFinishDateTime
                            return date >= new Date(bookedStartDateTime) && date <= new Date(bookedFinishDateTime);
                        }
                    ]
                });

                // You can customize the options based on your needs
            });
        </script>


        <!-- Bootstrap core CSS -->
        <link href="/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <!-- Favicons -->
        <link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
        <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
        <meta name="theme-color" content="#7952b3">

        <style>
            .bd-placeholder-img {
                font-size: 3.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            .input-group input::placeholder {
                font-size: 14px;
            }


            @media (min-width: 720px) {
                .bd-placeholder-img-lg {
                    font-size: 5.5rem;
                }
            }

            .container .row {
                margin-top: 20px;
            }


            /* Increase font size for various elements */
            body, h4, h6, small, label, input, select, .btn {
                font-size: 18px; /* Adjust the value to make the fonts bigger */
            }

            .lower-section {
                margin-top: 20px;
            }


        </style>
        <!-- Custom styles for this template -->
        <link href="form-validation.css" rel="stylesheet">


    </head>
    <body class="bg-light">
    	<jsp:include page="checkLogin.jsp" />

        <%
            InstrumentDAO instrumentDAO = new InstrumentDAO();
            List<Instrument> instrument = instrumentDAO.retrieveInstrument();
        %>

        <%
            String userID = request.getParameter("id");
            UserDAO userdao = new UserDAO();
            User user = userdao.retrieveById(userID);
            System.out.println(user.getUser_email());
            String instrumentID = request.getParameter("id");

        %>

        <jsp:include page="navbar.jsp" />

        <%
            User loggedInUser = (User) session.getAttribute("loggedInUser");
        System.out.println(loggedInUser);

            if (loggedInUser != null) {
        %>

        <div class="container">
            <main>
                <%
                    try {
                      	
                    	DBConn con = new DBConn();
                    
                        Statement st = con.getConnection().createStatement();
                        
                        String sql = "SELECT * FROM instrumentType";
                        ResultSet rs = st.executeQuery(sql);
                        String instrumentName = ""; // Initialize the instrumentName variable
                        Instrument bookedInstrument = null;
                        // Find the instrument details if a valid instrument ID is provided
                       // Retrieve the selected instrument's ID
                        if (instrumentID != null && !instrumentID.isEmpty()) {
                            // Fetch information about the selected instrument using the instrumentID
                            // You can perform a database query to retrieve the instrument's details based on the InstrumentID

                            // Example database query (adjust to your database schema):
                            sql = "SELECT * FROM instrumentType WHERE instrumentID = " + instrumentID;

                            // Execute the query, retrieve data, and display it
                            rs = st.executeQuery(sql);
                            if (rs.next()) {
                                instrumentName = rs.getString("instrumentName");
                                bookedInstrument = new Instrument();
                                bookedInstrument.setInstrumentID(rs.getInt("instrumentID"));
                                bookedInstrument.setInstrumentName(instrumentName);
                            } else {
                                // Instrument not found with the specified ID
                                out.println("Instrument not found.");
                            }
                        } else {
                            // Instrument ID is not provided
                            out.println("Please provide a valid instrument ID.");
                        }
                        session.setAttribute("bookedInstrument", bookedInstrument);
                %>

                <div class="row g-5">
                    <div class="col-md-3  order-md-first lower-section" style="margin-top: 100px;">
                        <h3 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-primary">Your cart</span>
                            <span class="badge bg-primary rounded-pill">1</span>
                        </h3>
                        <ul class="list-group mb-3">
                            <li class="list-group-item d-flex justify-content-between lh-sm">
                                <div>
                                    <h5 class="my-1"><%= rs.getString("instrumentName")%></h5>
                                    <small class="text-muted">Specialty: <%= rs.getString("instrumentDescription")%></small>
                                </div>
                                <span class="text-muted">FREE</span>
                            </li>
                        </ul>
                    </div>
                                    
                    <div class="col-md-6">
                        <h2 class="mb-3">Booking Details</h2>

                        <div class="row g-3">
                            <form class="needs-validation" action="checkoutInstrument-process.jsp" method="post">
                                <div class="col-sm-6">
                                    <label for="fullName" class="form-label">Full Name</label>
                                    <input type="text" class="form-control" id="fullname" placeholder="Full Name" value="<%=loggedInUser.getFullname()%>" required>
                                    <div class="invalid-feedback">
                                        Valid first name is required.
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <label for="organization" class="form-label">Organization</label>
                                    <input type="text" class="form-control" id="organization" name="organization" placeholder="Faculty/Club" required>
                                </div>

                                <div class="col-12">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" placeholder="you@example.com" value="<%=loggedInUser.getUser_email()%>">
                                </div>

                                <div class="col-12">
                                    <label for="objective" class="form-label">Objective of Booking</label>
                                    <textarea class="form-control" id="objective" name="objective" rows="4" placeholder="Please provide the objective of your booking"></textarea>
                                </div>

                                <div class="form-group col-sm-6">
                                    <label for="startDateTime">Start Booking Date and Time</label>
                                    <input class="form-control" type="datetime-local" id="startDateTime" name="startDateTime" placeholder="Choose a date" required>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label for="finishDateTime">End Booking Date and Time</label>
                                    <input class="form-control" type="datetime-local" id="finishDateTime" name="finishDateTime" placeholder="Choose a date" required>
                                </div>
                                 <input type="hidden" id="instrumentID" name="instrumentID" value="<%= instrumentID %>">
                                
                                <button class="w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-3 mt-5">
						<div class="table-responsive" style=" max-height: 500px; overflow-y: auto;">
						<h5>Booked Instrument List</h5>
						    <table class="table">
						        <thead>
						            <tr>
						                <th>Date From</th>
						                <th>Date To</th>
						                <th>Organization</th>
						            </tr>
						        </thead>
						        <tbody>
						            <%
						                try {
						                     st = con.getConnection().createStatement();
						                    String query = "SELECT startDateTime, finishDateTime, organization FROM instrumentbooking where instrumentID = " + instrumentID;
						                     rs = st.executeQuery(query);
						
						                    while (rs.next()) {
						                        String startDateTime = rs.getString("startDateTime");
						                        String finishDateTime = rs.getString("finishDateTime");
						                        String organization = rs.getString("organization");
						            %>
						                        <tr>
						                            <td><%= startDateTime %></td>
						                            <td><%= finishDateTime %></td>
						                            <td><%= organization %></td>
						                        </tr>
						            <%
						                    }
						                    rs.close();
						                    st.close();
						                } catch (SQLException e) {
						                    e.printStackTrace();
						                    // Handle SQL exceptions
						                }
						            %>
						        </tbody>
						    </table>
						</div>
            		</div>

                    <hr class="my-4">



                </div>
        </div>
        <%
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </main>

    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2017–2021 Company Name</p>
        <ul class="list-inline">
            <li class="list-inline-item"><a href="#">Privacy</a></li>
            <li class="list-inline-item"><a href="#">Terms</a></li>
            <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
    </footer>
</div>


<script src="/docs/5.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script src="form-validation.js"></script>
<script>
            config = {
                altInput: true,
                enableTime: true,
                altFormat: "F j, Y",
                dateFormat: "Y-m-d",
                minDate: "today",
            }
            flatpickr("input[type=date-timelocal]", config);
</script>
</body>
<%
    }
%>
</html>
