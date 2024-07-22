<%@page import="java.util.List"%>
<%@page import="performance.Performance"%>
<%@page import="performance.PerformanceDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Book Performance</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <style>
        .radio-button {
            margin-bottom: 10px; /* Add some margin to separate each radio input and label */
        }

        .form-check-label {
            margin-left: 20px; /* Adjust the margin to your preference */
        }

        /* Added styles for lowering the "Book our services" section */
        .book-services-section {
            margin-top: 70px; /* Adjust the margin to your preference */
        }

        .book-services-heading {
            margin-bottom: 10px; /* Adjust the margin to your preference */
        }

        .book-services-paragraph {
            margin-bottom: 20px; /* Adjust the margin to your preference */
        }
    </style>

    <body>
        <div class="container">
            <jsp:include page="navbar.jsp" />

            <form action="bookPerformance-process.jsp" method="post" onsubmit="return validateForm();">

                <div class="container book-services-section">
                    <h3 class="text-center book-services-heading">LIST OF PERFORMANCES</h3>
                    <p class="text-center book-services-paragraph">Invite us to liven up your events!<br> Place your booking now! </p>

                    <div class="row text-center">
		               <%
		               
		               PerformanceDAO performanceTypeDAO = new PerformanceDAO();
		                   List<Performance> performanceTypes = performanceTypeDAO.retrievePerformance();
		                   for (Performance type : performanceTypes) {
		                	   System.out.println(type.getImage());
		               %>
		                   <div class="col-sm-4">
		                       <div class="thumbnail">
		                           <img src="<%= type.getImage()  %>" alt="<%= type.getPerformanceName() %>" width="400" height="300">
		                           <p><strong><%= type.getPerformanceName() %></strong></p>
		                           <p><%= type.getPerformanceDesc() %></p>
		                            <p>RM <%= type.getPrice() %></p>
		                           <p><a class="btn btn-secondary" href="bookPerformance-process.jsp?performanceId=<%= type.getPerformanceID() %>">Book Performance »</a></p>
		                       </div>
		                   </div>
		               <%
		                   }
		               %>
                        
                    </div>
                </div>
            </form>
        </div>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script>
                function validateForm() {
                    var selected = document.querySelector('input[name="bookedPerformance"]:checked');
                    if (selected) {
                        return true;
                    } else {
                        alert("Please select a performance option.");
                        return false;
                    }
                }
        </script>
    </body>

</html>