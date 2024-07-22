<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="user.User"%>
<%@page import="performancebooking.PerformanceBooking"%>
<%@page import="performancebooking.PerformanceBookingDAO"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import = "org.apache.commons.fileupload.servlet.ServletFileUpload" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Assuming you have a user logged in and their information is stored in the session
    User loggedInUser = (User) session.getAttribute("loggedInUser");

    if (loggedInUser != null) {
        //String organization = request.getParameter("organization");
        // String objective = request.getParameter("objective");
        //String performanceDateTimeStr = request.getParameter("bookDateTime");
        //System.out.println("STR : " + performanceDateTimeStr);
        // String performanceType = request.getParameter("performanceType");
        String organization = "";
        String objective = "";
        LocalDateTime bookDateTime = null;
        String performanceType = "";
        FileItem uploadedFileItem = null; // To hold the uploaded file

        if (ServletFileUpload.isMultipartContent(request)) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            try {
                List<FileItem> formItems = upload.parseRequest(request);
                for (FileItem item : formItems) {
                    if (item.isFormField()) {
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString();

                        if ("organization".equals(fieldName)) {
                            organization = fieldValue;
                        } 
                        if ("objective".equals(fieldName)) {
                            objective = fieldValue;
                        } 
                        if ("bookDateTime".equals(fieldName)) {
                            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                            bookDateTime = LocalDateTime.parse(fieldValue, formatter);
                        } 
                        if ("performance_id".equals(fieldName)) {
                            performanceType = fieldValue;
                            System.out.println("PERFORMANCE TYPE : " + performanceType);
                        }
                    } else {
                        uploadedFileItem = item;
                    }
                }

                // Assuming you have a PerformanceDAO to handle database operations
                PerformanceBookingDAO performanceBookingDAO = new PerformanceBookingDAO();
                int performanceBookingId = performanceBookingDAO.addPerformanceBooking(loggedInUser.getUserID(), performanceType, bookDateTime, organization, objective);

                if (uploadedFileItem != null && !uploadedFileItem.getName().isEmpty()) {
                    String fileName = performanceBookingId + "_" + uploadedFileItem.getName();
                    String filePath = getServletContext().getRealPath("/") + "payments" + File.separator + fileName;
                    String filePathStore = "/FYP/payments" + File.separator + fileName;
                    System.out.println("file:: " + filePath);
                    performanceBookingDAO.updatePerformancePaymentReceipt(filePathStore, performanceBookingId);
                    //Save the file to disk in the payments folder
                    File storeFile = new File(filePath);
                    uploadedFileItem.write(storeFile);
                }

                //Redirect or forward after successful operation
                response.sendRedirect("bookingSuccess.jsp?type=performance&performanceBookingID=" + performanceBookingId); // or forward as needed

            } catch (FileUploadException e) {
                e.printStackTrace();
                // Handle the error
            }
        }

    } else {
        // Redirect to login page if the user is not logged in or bookedPerformance is null
        response.sendRedirect("login.jsp");
    }

%>