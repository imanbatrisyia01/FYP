<%@page import="db.DBConn"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="user.User"%>
<%@page import="performance.Performance"%>
<%@page import="performance.PerformanceDAO"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import = "org.apache.commons.fileupload.servlet.ServletFileUpload" %>


<%

User loggedInUser = (User) session.getAttribute("loggedInUser");

if (loggedInUser != null) {

    if (ServletFileUpload.isMultipartContent(request)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        String performanceName = "";
        String performanceDesc = "";
        String image = "";
        Double price = 0.00;
        
        LocalDateTime bookDateTime = null;
        String performanceType = "";
        FileItem uploadedFileItem = null; // To hold the uploaded file

        try {
            List<FileItem> formItems = upload.parseRequest(request);
            for (FileItem item : formItems) {
                if (item.isFormField()) {
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString();

                    if ("performanceName".equals(fieldName)) {
                    	performanceName = fieldValue;
                    }
                    if ("performanceDesc".equals(fieldName)) {
                    	performanceDesc = fieldValue;
                    }
                    if ("price".equals(fieldName)) {
                    	price = Double.parseDouble(fieldValue);
                    }
                    
                } else {
                	uploadedFileItem = item;
                }
            }

            PerformanceDAO performanceDAO = new PerformanceDAO();
            
            int performanceID = performanceDAO.addPerformance(performanceName, performanceDesc, price);
            
            
           if (uploadedFileItem != null && !uploadedFileItem.getName().isEmpty()) {
                String fileName = performanceID + "_" + uploadedFileItem.getName();
                String filePath = getServletContext().getRealPath("/") + "performance" + File.separator + fileName;
                String filePathStore = "/FYP/performance" + File.separator + fileName;
				System.out.println("file:: " + filePath);
				performanceDAO.updatePerformanceImage(filePathStore, performanceID);
                 //Save the file to disk in the payments folder
                File storeFile = new File(filePath);
                uploadedFileItem.write(storeFile);
            }

             //Redirect or forward after successful operation
             response.sendRedirect("viewPerformance.jsp?message=success"); // or forward as needed

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
