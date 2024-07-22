<%@page import="studiobooking.StudiobookingDAO"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="user.User"%>
<%@page import="user.UserDAO"%>
<%@page import="studio.Studio"%>
<%@page import="studio.StudioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Assuming you have a user logged in and their information is stored in the session
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    Studio bookedStudio = (Studio) session.getAttribute("bookedStudio");

    if (loggedInUser != null && bookedStudio != null) {
        String organization = request.getParameter("organization");
        String objective = request.getParameter("objective");
        String startDateTimeStr = request.getParameter("startDateTime");
        String finishDateTimeStr = request.getParameter("finishDateTime");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

        try {
            LocalDateTime startDateTime = LocalDateTime.parse(startDateTimeStr, formatter);
            LocalDateTime finishDateTime = LocalDateTime.parse(finishDateTimeStr, formatter);

            StudiobookingDAO studiobookingDAO = new StudiobookingDAO();

            // Check for overlapping bookings
            if (!studiobookingDAO.isBookingOverlap(bookedStudio.getStudioID(), startDateTime, finishDateTime)) {
                // No overlap, proceed with the booking
                studiobookingDAO.addStudiobooking(loggedInUser.getUserID(), bookedStudio.getStudioID(), startDateTime, finishDateTime, objective, organization);
                response.sendRedirect("bookingSuccess.jsp"); // Redirect to a success page
            } else {
                // Overlap detected, show an error message
                response.sendRedirect("bookStudio.jsp?error=The selected time slot is already booked. Please choose a different time. Do refer to the table on the right side of the page to see unavailable date and time for booking.");
            }
        } catch (Exception e) {
            // Handle exceptions and errors
            e.printStackTrace();
            // Redirect back to the form with an error message
            response.sendRedirect("bookStudio.jsp?error=Booking failed. Please try again.");
        }
    } else {
        // Redirect to login page if the user is not logged in or bookedStudio is null
        response.sendRedirect("login.jsp");
    }
%>
