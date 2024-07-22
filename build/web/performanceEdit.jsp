<%-- 
    Document   : userEdit
    Created on : 23 Aug 2022, 5:15:43 pm
    Author     : user
--%>

<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="performance.Performance"%>
<%@page import="performance.PerformanceDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voice of Harmony!</title>
        <jsp:include page="include.jsp" />
    </head>
    <%
        String studioID = request.getParameter("id");
    PerformanceDAO performanceDAO = new PerformanceDAO();
    Performance performance = performanceDAO.retrieveById(studioID); // Use studiodao instead of StudioDAO
    %>

    <body>
        <jsp:include page="navbarHepa.jsp" />
           <div class="container">
                <div class="container rounded bg-white mt-5 mb-5">
	        	 <div class="row">
		            <div class="col-md-12 border-right">
		               <div class="d-flex flex-column align-items-center text-center p-3 py-5">
		               <img class="mt-5" width="250px" src="<%=performance.getImage()%>">
		               </div>
		           </div>
		        </div>
	            <div class="row">
	                <div class="col-md-12">
	                    <div class="ml-auto mr-auto">
	                        <div class="d-flex justify-content-between align-items-center mb-3">
	                            <h3 class="text-center"><strong>UPDATE PERFORMANCE</strong></h3>
	                        </div>
	                        <form class="needs-validation" novalidate action="performanceEdit-process.jsp" method="post" enctype="multipart/form-data">
	                            <div class="row mt-3">
	                                <div class="col-md-16"><label class="labels">Performance ID</label><input type="text" name="performanceID" id="performanceID" value="<%=performance.getPerformanceID()%>" readonly class="form-control" placeholder="Performance ID"></div>
	                                <div class="col-md-16"><label class="labels">Performance Name</label><input type="text" name="performanceName" id="performanceName" value="<%=performance.getPerformanceName()%>" class="form-control" placeholder="Performance Name"></div>
	                            	<div class="col-md-16"><label class="labels">Performance Description</label><input type="text" name="performanceDesc" id="performanceDesc" value="<%=performance.getPerformanceDesc()%>" class="form-control" placeholder="Performance Description"></div>
	                            	<div class="col-md-16"><label class="labels">Performance Price</label><input type="number" step="0.1" name="price" id="price" value="<%=performance.getPrice()%>" class="form-control" placeholder="Performance price"></div>
	                            	<div class="col-md-16"><label class="labels">Performance Image</label><br><input type="file" id="uploadImage" name="uploadImage"></div>
	                            	
	                            </div>
	                            <div class="mt-5 text-center">
	                                <input type="hidden" name="performanceID" value="<%=studioID%>">
	                                <input class="btn btn-primary profile-button" type="submit" value="Confirm Update">
	                            </div>
	                        </form>
	                    </div>
	                </div>
	            </div>
        	</div>
        </div>
    </body>
</html>
