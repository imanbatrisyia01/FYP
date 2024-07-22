<%-- 
    Document   : bookStudio.jsp
    Created on : 7 Jun 2023, 3:51:07 am
    Author     : user
--%>

<%@ page  import="db.DBConn"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="studio.Studio"%>
<%@page import="studio.StudioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.84.0">
        <title>List Of Studios</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/album/">



        <!-- Bootstrap core CSS -->
        <link href="/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <!-- Favicons -->
        <link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
        <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
        <meta name="theme-color" content="#7952b3">


        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>


    </head>
    <body>

        <%

            StudioDAO studioDAO = new StudioDAO();
            List<Studio> studio = studioDAO.retrieveStudio();
        %>

        <jsp:include page="navbar.jsp" />

        <main>

            <div class="py-5 text-center container">
                <div class="row py-lg-5">
                    <div class="col-lg-6 col-md-8 mx-auto">
                        <h1 class="fw-light">List of Studios</h1>
                    </div>
                </div>
            </div>

            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vohbs", "root", "");
                    Statement st = con.createStatement();
                    String sql = "SELECT * FROM studioType";
                    ResultSet rs = st.executeQuery(sql);
            %>
            <div class="album py-5 bg-light">
                <div class="container">
                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                        <% while (rs.next()) {%>
                        <div class="col">
                            <div class="card shadow-sm">
                                <img class="bd-placeholder-img card-img-top" width="100%" src="<%=rs.getString("studioImg")%>">
                                <div class="card-body">
                                    <p class="card-text"><strong style="text-transform: uppercase;"><%=rs.getString("studioName")%></strong></p>
                                    <div class="studio-info">
                                        <label>Studio Description:</label>
                                        <span><%=rs.getString("studioDescription")%></span>
                                    </div>
                                    <div class="studio-info">
                                        <label>Studio Size:</label>
                                        <span><strong><%=rs.getString("studioSize")%></span>
                                        <label>sq ft</label>
                                    </div>
                                    <div class="studio-info">
                                        <label>Capacity:</label>
                                        <span><%=rs.getString("capacity")%></span>
                                        <label>person</label>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-sm btn-outline-secondary" onclick="window.location.href = 'bookStudio-process.jsp?id=<%=rs.getString("studioID")%>'">Book Now</button>
                                        </div>
                                        <small class="text-muted">FREE</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
            <%
                } catch (Exception e) {
                    out.println(e);
                }
            %>

        </main>

        <footer class="text-muted py-5">
            <div class="container">
                <p class="float-end mb-1">
                    <a href="#">Back to top</a>
                </p>
                <p class="mb-1">Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
                <p class="mb-0">New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a href="/docs/5.0/getting-started/introduction/">getting started guide</a>.</p>
            </div>
        </footer>

        <%
            String errorMessage = request.getParameter("error");

            if (errorMessage != null && !errorMessage.isEmpty()) {
                // Display the error message using JavaScript alert or any other suitable way
                // Here, I'm using JavaScript to show an alert box
        %>
        <script>
            alert("<%= errorMessage%>");
        </script>
        <%
            }
        %>

        <script src="/docs/5.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


    </body>
</html>
