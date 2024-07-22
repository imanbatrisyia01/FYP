<%@page import="db.DBConn"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="user.User"%>
<%@page import="studio.Studio"%>
<%@page import="studio.StudioDAO"%>
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

    String studioName = "";
    String studioDescription = "";
    String studioSize = "";
    String capacity = "";

    
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

                    if ("studioName".equals(fieldName)) {
                        studioName = fieldValue;
                    }
                    if ("studioDescription".equals(fieldName)) {
                        studioDescription = fieldValue;
                    }
                    if ("studioSize".equals(fieldName)) {
                        studioSize = fieldValue;
                    }
                    if ("capacity".equals(fieldName)) {
                        capacity = fieldValue;
                    }
                } else {
                    uploadedFileItem = item;
                }
            }

            StudioDAO studioDAO = new StudioDAO();

            int studioID = studioDAO.addStudio(studioName, studioDescription, studioSize, capacity);

            if (uploadedFileItem != null && !uploadedFileItem.getName().isEmpty()) {
                String fileName = studioID + "_" + uploadedFileItem.getName();
                String filePath = getServletContext().getRealPath("/") + "studio" + File.separator + fileName;
                String filePathStore = "/FYP/studio" + File.separator + fileName;
                System.out.println("file:: " + filePath);
                studioDAO.updateStudioImage(filePathStore, studioID);
                // Save the file to disk in the studio folder
                File storeFile = new File(filePath);
                uploadedFileItem.write(storeFile);
            }

            // Redirect or forward after a successful operation
            response.sendRedirect("viewStudio.jsp?message=success");

        } catch (FileUploadException e) {
            e.printStackTrace();
            // Handle the error
        }
    }

} else {
    // Redirect to the login page if the user is not logged in or bookedPerformance is null
    response.sendRedirect("login.jsp");
}

%>
