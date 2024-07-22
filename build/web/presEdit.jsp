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
<%@page import="user.User"%>
<%@page import="user.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voice of Harmony!</title>
        <jsp:include page="include.jsp" />
        
    </head>
    <%
        String userID = request.getParameter("id");
        UserDAO userdao = new UserDAO();
        User user = userdao.retrieveById(userID);
    %>

    <body>
            <jsp:include page="navbarPres.jsp" />
    
        <%
            User loggedInUser = (User) session.getAttribute("loggedInUser");
            if (loggedInUser != null) {
        %>
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-3 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                        <span class="font-weight-bold"><%=loggedInUser.getFullname()%></span>
                        <span class="text-black-50"><%=loggedInUser.getUser_email()%></span>
                    </div>
                </div>
                <div class="col-md-7 border-right">
                    <div class="p-5 py-10">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h3 class="text-center"><strong>UPDATE PROFILE</strong></h3>
                        </div>
                        <form class="needs-validation" novalidate action="presEdit-process.jsp" method="post">
                            <div class="row mt-3">
                                <div class="col-md-16">
                                    <input type="hidden" name="userID" id="userID" value="<%=loggedInUser.getUserID()%>" readonly class="form-control" placeholder="User ID" value="">
                                </div>
                                <div class="col-md-16">
                                    <input type="hidden" name="user_type" id="user_type" value="<%=loggedInUser.getUser_type()%>" readonly class="form-control" placeholder="User Type" value="">
                                </div>
                                <div class="col-md-16">
                                    <label class="labels">Full Name</label>
                                    <input type="text" name="fullname" id="fullname" value="<%=loggedInUser.getFullname()%>" class="form-control" placeholder="Full Name" value="">
                                </div>
                                <div class="col-md-16">
                                    <label class="labels">Phone Number</label>
                                    <input type="text" name="user_phone" id="user_phone" value="<%=loggedInUser.getUser_phone()%>" class="form-control" placeholder="Phone Number" value="">
                                </div>
                               
                                <div class="col-md-16">
                                    <label class="labels">Email</label>
                                    <input type="text" name="user_email" id="user_email" value="<%=loggedInUser.getUser_email()%>" class="form-control" placeholder="Email" value="">
                                </div>
                                <div class="col-md-16">
                                    <label class="labels">Change Password Here</label>
                                    <input type="password" name="user_password" id="user_password" value="<%=loggedInUser.getUser_password()%>" class="form-control" placeholder="New Password" value="">
                                </div>
                                <div class="col-md-16">
                                    <label class="labels">Confirm New Password</label>
                                    <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="Confirm New Password" value="">
                                </div>
                            </div>
                            <div class="mt-5 text-center">
                                <input type="hidden" name="userID" value="<%=loggedInUser.getUserID()%>">
                                <input class="btn btn-primary profile-button" type="submit" value="Confirm Update">
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>



    </body>
</html>
