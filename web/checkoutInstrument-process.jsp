<%@page import="instrumentbooking.InstrumentbookingDAO"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="user.User"%>
<%@page import="user.UserDAO"%>
<%@page import="instrument.Instrument"%>
<%@page import="instrument.InstrumentDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Assuming you have a user logged in and their information is stored in the session
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    Instrument bookedInstrument = (Instrument) session.getAttribute("bookedInstrument");

    if (loggedInUser != null && bookedInstrument != null) {
        String organization = request.getParameter("organization");
        String objective = request.getParameter("objective");
        String startDateTimeStr = request.getParameter("startDateTime");
        String finishDateTimeStr = request.getParameter("finishDateTime");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

        try {
            LocalDateTime startDateTime = LocalDateTime.parse(startDateTimeStr, formatter);
            LocalDateTime finishDateTime = LocalDateTime.parse(finishDateTimeStr, formatter);

            InstrumentbookingDAO instrumentbookingDAO = new InstrumentbookingDAO();

            // Check for overlapping bookings
            if (!instrumentbookingDAO.isInstrumentBookingOverlap(bookedInstrument.getInstrumentID(), startDateTime, finishDateTime)) {
                // If no overlap, proceed to add the booking
                instrumentbookingDAO.addInstrumentbooking(loggedInUser.getUserID(), bookedInstrument.getInstrumentID(), startDateTime, finishDateTime, objective, organization);
                response.sendRedirect("bookingSuccess.jsp"); // Redirect to a success page
            } else {
                // If overlap, redirect back to the form with an error message
                response.sendRedirect("bookInstrument.jsp?error=Booking failed. Overlapping with existing bookings. Please choose a different time. Do refer to the table on the right side of the page to see unavailable date and time for booking.");
            }
        } catch (Exception e) {
            // Handle exceptions and errors
            e.printStackTrace();
            // Redirect back to the form with an error message
            response.sendRedirect("bookInstrument.jsp?error=Booking failed. Please try again.");
        }
    } else {
        // Redirect to login page if the user is not logged in or bookedInstrument is null
        response.sendRedirect("login.jsp");
    }
%>
