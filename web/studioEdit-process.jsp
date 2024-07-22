<%@page import="java.sql.*"%>
<%@page import="db.DBConn"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import = "org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@page import="studio.Studio"%>
<%@page import="studio.StudioDAO"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
DBConn con = new DBConn();

if (ServletFileUpload.isMultipartContent(request)) {
    DiskFileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);

    String studioName = "";
    String studioDescription = "";
    String studioID = "";
    String studioSize = "";
    String capacity = "";
    String errorMessage = "";

    FileItem uploadedFileItem = null; // To hold the uploaded file

    try {
        List<FileItem> formItems = upload.parseRequest(request);
        for (FileItem item : formItems) {
            if (item.isFormField()) {
                String fieldName = item.getFieldName();
                String fieldValue = item.getString();

                if ("studioName".equals(fieldName)) {
                    studioName = fieldValue;
                    if (studioName.isEmpty()) {
                        errorMessage = "Studio Name is required.";
                    }
                }
                if ("studioDescription".equals(fieldName)) {
                    studioDescription = fieldValue;
                    if (studioDescription.isEmpty()) {
                        errorMessage = "Studio Description is required.";
                    }
                }
                if ("studioSize".equals(fieldName)) {
                    studioSize = fieldValue;
                    if (studioSize.isEmpty()) {
                        errorMessage = "Studio Size is required.";
                    }
                }
                if ("capacity".equals(fieldName)) {
                    capacity = fieldValue;
                    if (capacity.isEmpty()) {
                        errorMessage = "Capacity is required.";
                    }
                }
                if ("studioID".equals(fieldName)) {
                    studioID = fieldValue;
                    if (studioID.isEmpty()) {
                        errorMessage = "Studio ID is required.";
                    }
                }

            } else {
                uploadedFileItem = item;
            }
        }

        if (errorMessage.isEmpty()) {
            String sql = "UPDATE studiotype SET studioName=?, studioDescription = ?, studioSize=?, capacity=? where studioID=?";
            PreparedStatement ps = con.getConnection().prepareStatement(sql);
            ps.setString(1, studioName);
            ps.setString(2, studioDescription);
            ps.setString(3, studioSize);
            ps.setString(4, capacity);
            ps.setInt(5, Integer.parseInt(studioID));

            if (uploadedFileItem != null && !uploadedFileItem.getName().isEmpty()) {
                LocalDateTime now = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
                String timestamp = now.format(formatter);

                String fileName = timestamp + "_" + uploadedFileItem.getName();
                String filePath = getServletContext().getRealPath("/") + "studio" + File.separator + fileName;
                String filePathStore = "/FYP/studio" + File.separator + fileName;
                System.out.println("file:: " + filePath);
                StudioDAO studioDAO = new StudioDAO();

                studioDAO.updateStudioImage(filePathStore, Integer.parseInt(studioID));

                // Save the file to disk in the studio folder
                File storeFile = new File(filePath);
                uploadedFileItem.write(storeFile);
            }

            int row = ps.executeUpdate();
            if (row > 0) {
                out.print("<script type=\"text/javascript\">");
                out.print("alert('Studio edited successfully!');");
                out.print("location='viewStudio.jsp?id=" + studioID + "';");
                out.print("</script>");
            } else {
                out.print("<script type=\"text/javascript\">");
                out.print("alert('Failed to edit studio!');");
                out.print("location='studioEdit.jsp?id=" + studioID + "';");
                out.print("</script>");
            }
        } else {
            // Display error message and redirect back to the form
            out.print("<script type=\"text/javascript\">");
            out.print("alert('" + errorMessage + "');");
            out.print("location='studioEdit.jsp?id=" + studioID + "';");
            out.print("</script>");
        }

    } catch (FileUploadException e) {
        e.printStackTrace();
        // Handle the error
    }
}

con.closeConnection();
%>
