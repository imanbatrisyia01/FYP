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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voice of Harmony!</title>
    </head>
    <%
        String userID = request.getParameter("id");
        UserDAO userdao = new UserDAO();
        User user = userdao.retrieveById(userID);
    %>
    <style>
        body {
            background: rgb(99, 39, 120)
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #BA68C8
        }

        .profile-button {
            background: rgb(99, 39, 120);
            box-shadow: none;
            border: none
        }

        .profile-button:hover {
            background: #682773
        }

        .profile-button:focus {
            background: #682773;
            box-shadow: none
        }

        .profile-button:active {
            background: #682773;
            box-shadow: none
        }

        .back:hover {
            color: #682773;
            cursor: pointer
        }

        .labels {
            font-size: 11px
        }

        .add-experience:hover {
            background: #BA68C8;
            color: #fff;
            cursor: pointer;
            border: solid 1px #BA68C8
        }
    </style>
    <body>
        <jsp:include page="navbarHepa.jsp" />
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-3 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                        <img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                        <span class="font-weight-bold"><%=user.getFullname()%></span>
                        <span class="text-black-50"><%=user.getUser_email()%></span>
                    </div>
                </div>
                <div class="col-md-7 border-right">
                    <div class="p-5 py-10">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h3 class="text-center"><strong>ASSIGN PRESIDENT</strong></h3>
                        </div>
                        <form class="needs-validation" novalidate action="assignPres-process.jsp" method="post">
                            <div class="row mt-3">
                                <div class="col-md-16">
                                    <input type="hidden" name="userID" id="userID" value="<%=user.getUserID()%>" readonly class="form-control" placeholder="User ID" value="">
                                </div>
                                <div class="col-md-16">
                                    <label class="labels">User Type</label>
                                    <select name="user_type" id="user_type" class="form-control">
                                        <option value="0" <% if (user.getUser_type().equals("0")) { %>selected<% } %>>User</option>
                                        <option value="1" <% if (user.getUser_type().equals("1")) { %>selected<% } %>>HEPA</option>
                                        <option value="2" <% if (user.getUser_type().equals("2")) { %>selected<% } %>>President</option>
                                    </select>
                                </div>

                                <div class="col-md-16">
                                    <label class="labels">Full Name</label>
                                    <input type="text" name="fullname" id="fullname" value="<%=user.getFullname()%>" readonly class="form-control" placeholder="Full Name" value="">
                                </div>
                                <div class="col-md-16">
                                    <label class="labels">Phone Number</label>
                                    <input type="text" name="user_phone" id="user_phone" value="<%=user.getUser_phone()%>" readonly class="form-control" placeholder="Phone Number" value="">
                                </div>
                                <div class="col-md-16">
                                    <label class="labels">Email</label>
                                    <input type="text" name="user_email" id="user_email" value="<%=user.getUser_email()%>" readonly class="form-control" placeholder="Email" value="">
                                </div>
                                <div class="col-md-16">
                                    <input type="hidden" name="user_password" id="user_password" value="<%=user.getUser_password()%>" readonly class="form-control" placeholder="Password" value="">
                                </div>
                            </div>
                            <div class="mt-5 text-center">
                                <input type="hidden" name="userID" value="<%=user.getUserID()%>">
                                <input class="btn btn-primary profile-button" type="submit" value="Confirm Update">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
