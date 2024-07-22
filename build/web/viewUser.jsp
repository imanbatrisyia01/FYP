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

   <jsp:include page="include.jsp" />


    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Voice of Harmony</title>

    <style>
        .container {
            padding: 0;
        }
        .container-max-widths {
            padding-top: 0px; /* Adjust the padding as needed */
        }
        table.table {
            margin-top: 20px; /* Adjust the margin as needed */
        }
        table.table.table-striped.table-responsive.table-bordered {
            font-size: 1.5.0rem; /* Adjust the font size as needed */
        }
        h1.fw-light {
            font-size: 4.0rem; /* Adjust the font size as needed */
        }
        table.table th {
            text-align: center;
        }
        .btn-success-te {
            background-color: green;
            color: white; /* Set the text color to white for better contrast */
        }
        .btn-danger-te {
            background-color: red;
            color: white;
        }
    </style>

    <script>
        function confirmDelete(userID) {
            var ask = window.confirm("Confirm to delete this user?");
            if (ask) {
                $.ajax({
                    type: "POST",
                    url: "userDelete.jsp?id=" + userID,
                    success: function () {
                        // No need to use location.reload(true) here
                        // Simply reload the page
                        location.reload();
                    }
                });
            }
        }
    </script>
</head>

<%
    UserDAO userdao = new UserDAO();
    List<User> user = userdao.retrieveUser();
%>

<body>
    <div class="container-max-widths">
        <div class="row">
            <div class="container">
                <jsp:include page="navbarHepa.jsp" />
            </div>
        </div>
        <div class="col-9 text-center container">
            <div class="py-3 text-center container">
                <div class="row py-lg-3">
                    <div class="col-lg-6 col-md-8 mx-auto">
                        <h1 class="fw-light" style="margin-top: 4rem;">List of Users</h1>
                    </div>
                </div>
            </div>

            <div style="height: 500px; overflow: auto;">
                <table class="table table-striped table-responsive table-bordered">
                    <thead>
                        <th>No.</th>
                        <th>Full Name</th>
                        <th>Password</th>
                        <th>Email</th>
                        <th>Phone Number</th>
                        <th>Action</th>
                    </thead>

                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vohbs", "root", "");
                            Statement st = con.createStatement();
                            String sql = "SELECT * FROM account";
                            ResultSet rs = st.executeQuery(sql);
                            int index = 1;
                            while (rs.next()) {
                                String userID = rs.getString("userID");
                                String fullname = rs.getString("fullname");
                                String password = rs.getString("user_password");
                                String email = rs.getString("user_email");
                                String phone = rs.getString("user_phone");
                                // String path = rs.getString("path");
%>
                                <tbody>
                                    <tr>
                                        <td><%= index++%></td>
                                        <td><%=fullname%></td>
                                        <td><%=password%></td>
                                        <td><%=email%></td>
                                        <td><%=phone%></td>
                                        <td>
                                            <a href="assignPres.jsp?id=<%=userID%>" class="btn btn-sm btn-success">EDIT</a>
                                            <a class="btn btn-sm btn-danger" onclick="confirmDelete('<%=userID%>')">DELETE</a>
                                        </td>
                                    </tr>
                                </tbody>

                    <%
                            }
                        } catch (Exception e) {
                            out.println(e);
                        }
                    %>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
