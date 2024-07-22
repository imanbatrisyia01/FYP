
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
<%@page import="performance.Performance"%>
<%@page import="performance.PerformanceDAO"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%

    DBConn con = new DBConn();


    
    if (ServletFileUpload.isMultipartContent(request)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        String performanceName = "";
        String performanceDesc = "";
        String performanceID = "";
        String price = "";

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
                    if ("performanceID".equals(fieldName)) {
                    	performanceID = fieldValue;
                    }
                    if ("price".equals(fieldName)) {
                    	price = fieldValue;
                    }
                    
                } else {
                	uploadedFileItem = item;
                }
            }

            String sql = "UPDATE performancetype SET performanceName=?, performanceDesc = ?, price = ? where performanceID=?";
            PreparedStatement ps = con.getConnection().prepareStatement(sql);
            ps.setString(1, performanceName);
            ps.setString(2, performanceDesc);
            ps.setDouble(3, Double.parseDouble(price));
            ps.setString(4, performanceID);
            
            
           if (uploadedFileItem != null && !uploadedFileItem.getName().isEmpty()) {
        	   
        	   LocalDateTime now = LocalDateTime.now();
        	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        	    String timestamp = now.format(formatter);
        	    
                String fileName = timestamp + "_" + uploadedFileItem.getName();
                String filePath = getServletContext().getRealPath("/") + "performance" + File.separator + fileName;
                String filePathStore = "/FYP/performance" + File.separator + fileName;
				System.out.println("file:: " + filePath);
				PerformanceDAO performanceDAO = new PerformanceDAO();
				performanceDAO.updatePerformanceImage(filePathStore, Integer.parseInt(performanceID));
                 //Save the file to disk in the payments folder
                File storeFile = new File(filePath);
                uploadedFileItem.write(storeFile);
            }
           
           int row = ps.executeUpdate();
           System.out.println(row);
           if (row > 0) {
               out.print("<script type=\"text/javascript\">");
               out.print("alert('Performance edited successfully!');");
               out.print("location='viewPerformance.jsp';");
               out.print("</script>");
           } else {
               out.print("<script type=\"text/javascript\">");
               out.print("alert('Failed to edit Performance!');");
               out.print("location='performanceEdit.jsp?id='" + performanceID + ";");
               out.print("</script>");
           }


        } catch (FileUploadException e) {
            e.printStackTrace();
            System.out.println(e);
            // Handle the error
        }
    }
    
    con.closeConnection();
%>
