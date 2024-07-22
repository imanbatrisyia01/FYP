<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Booking Successful</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="style.css">
        <style>
            body {
                font-size: 18px; /* Adjust the value to make the fonts bigger */
            }
            .container .row {
                margin-top: 20px;
            }
        </style>
    </head>
    <body class="bg-light">

        <jsp:include page="navbar.jsp" />

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="mt-5 text-center">Booking Successful</h2>
                    <div class="alert alert-success" role="alert">
                        <p>Your booking has been successfully processed</p>
                        <%
                        	String performanceBookingID = null;
                        	performanceBookingID = request.getParameter("performanceBookingID");
                        	if(performanceBookingID != null){
                        		
                        	
                        %>
                        <p>Please download your receipt  <a href="bookingReceipt.jsp?performanceBookingID=<%= performanceBookingID %>" target="_blank">here</a></p>
                        <a class="btn btn-primary mb-2 " href="bookingReceipt.jsp?performanceBookingID=<%= performanceBookingID %>" target="_blank">Download Receipt</a> 
                         <%
                        	}
                       	  	
                        %>
                        <p><a href="dashboard.jsp" class="btn btn-primary">Return to Dashboard</a></p>
                    </div>
                </div>
            </div>
        </div>

        <footer class="my-5 pt-5 text-muted text-center text-small">
            <p class="mb-1">&copy; 2017–2023 Company Name</p>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Privacy</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Support</a></li>
            </ul>
        </footer>

        <!-- Bootstrap JS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </body>
</html>