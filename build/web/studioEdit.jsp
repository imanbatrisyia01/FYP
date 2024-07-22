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
<%@page import="studio.Studio"%>
<%@page import="studio.StudioDAO"%>
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
        StudioDAO studiodao = new StudioDAO();
        Studio studio = studiodao.retrieveById(studioID); // Use studiodao instead of StudioDAO
    %>

    <body>
        <jsp:include page="navbarHepa.jsp" />
        <div class="container">
            <div class="container rounded bg-white mt-5 mb-5">
                <div class="row">
                    <div class="col-md-12 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                            <img class="mt-5" width="250px" src="<%=studio.getStudioImg()%>">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="ml-auto mr-auto">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h3 class="text-center"><strong>UPDATE STUDIO</strong></h3>
                            </div>
                            <form class="needs-validation" novalidate action="studioEdit-process.jsp" method="post" enctype="multipart/form-data">
                                <div class="row mt-3">
                                    <div class="col-md-16">
                                        <input type="hidden" name="studioID" id="studioID" value="<%=studio.getStudioID()%>" readonly class="form-control" placeholder="Studio ID">
                                    </div>
                                    <div class="col-md-16">
                                        <label class="labels">Studio Name</label>
                                        <input type="text" name="studioName" id="studioName" value="<%=studio.getStudioName()%>" class="form-control" placeholder="Studio Name" required>
                                    </div>
                                    <div class="col-md-16">
                                        <label class="labels">Studio Suitability</label>
                                        <input type="text" name="studioDescription" id="studioDescription" value="<%=studio.getStudioDescription()%>" class="form-control" placeholder="Studio Description" required>
                                    </div>
                                    <div class="col-md-16">
                                        <label class="labels">Studio Size</label>
                                        <div class="input-group">
                                            <input type="text" name="studioSize" id="studioSize" value="<%=studio.getStudioSize()%>" class="form-control" placeholder="Studio Size" required>
                                            <span class="input-group-text">sq ft</span>
                                        </div>
                                    </div>
                                    <div class="col-md-16">
                                        <label class="labels">Studio Capacity</label>
                                        <div class="input-group">
                                            <input type="text" name="capacity" id="capacity" value="<%=studio.getCapacity()%>" class="form-control" placeholder="Capacity" required>
                                            <span class="input-group-text">person</span>
                                        </div>
                                    </div>
                                    <div class="col-md-16">
                                        <label class="labels">Studio Image</label>
                                        <br><input type="file" id="uploadImage" name="uploadImage" required>
                                    </div>

                                </div>
                                <div class="mt-5 text-center">
                                    <input type="hidden" name="studioID" value="<%=studioID%>">
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
