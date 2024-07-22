<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="instrumentbooking.Instrumentbooking"%>
<%@page import="instrumentbooking.InstrumentbookingDAO"%>
<%@page import="studiobooking.StudiobookingDAO"%>
<%@page import="studiobooking.Studiobooking"%>
<%@page import="performancebooking.PerformanceBookingDAO"%>
<%@page import="performancebooking.PerformanceBooking"%>

<%@ page import="db.DBConn" %>
<%
    String bookingType = request.getParameter("bookingType");
	String bookingID = request.getParameter("id");
	String status = request.getParameter("status");
    String referer = request.getHeader("Referer"); // URL of the previous page

    try {
        if ("instrument".equals(bookingType)) {
        	
        	InstrumentbookingDAO instrumentBookingDAO = new InstrumentbookingDAO();
        	instrumentBookingDAO.updateInstrumentBookingStatus(status, Integer.parseInt(bookingID));
        	response.sendRedirect(referer);
        	
        } else if ("studio".equals(bookingType)) {
        	
        	StudiobookingDAO studioBookingDAO = new StudiobookingDAO();
        	studioBookingDAO.updateStudioBookingStatus(status, Integer.parseInt(bookingID));
        	response.sendRedirect(referer);
        	
        } else if ("performance".equals(bookingType)) {
        	
        	PerformanceBookingDAO performanceBookingDAO = new PerformanceBookingDAO();
        	performanceBookingDAO.updatePerformanceBookingStatus(status, Integer.parseInt(bookingID));
        	response.sendRedirect(referer);
        	
        } else {
            // Handle the case where bookingType is not valid or not provided
            out.println("<p>Error: Invalid booking type.</p>");
        }
        

    } catch (Exception e) {
        // Handle exceptions
        out.println("<p>Error processing request: " + e.getMessage() + "</p>");
    }
%>
    