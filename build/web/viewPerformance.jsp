<%-- 
    Document   : viewInstrument
    Created on : 13 Nov 2023, 5:25:01 pm
    Author     : user
--%>

<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="performance.Performance"%>
<%@page import="performance.PerformanceDAO"%>
<%@ page import="db.DBConn" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voice of Harmony</title>

        <jsp:include page="include.jsp" />


    </head>

    <%

        PerformanceDAO performanceDAO = new PerformanceDAO();
        List<Performance> performance = performanceDAO.retrievePerformance();
    %>

    <body>
        <jsp:include page="navbarHepa.jsp" />

        <div class="container-max-widths">

            <%
                String message = request.getParameter("message");
                if ((message != null) && message.equals("success")) {


            %>
            <div class="row">
                <div class="col-md-12 mt-5">
                    <div class="alert alert-success" role="alert">
                        <p>Store successful.</p>
                    </div>
                </div>
            </div>

            <%             }
            %>

            <div class="col-9 text-center container">
                <div class="py-3 text-center container">
                    <div class="row py-lg-3">
                        <div class="col-lg-6 col-md-8 mx-auto">
                            <h1 class="fw-light" style="margin-top: 4rem;">List of Performances</h1>
                        </div>
                    </div>
                </div>

                <div style="height: 500px; overflow: auto;">
                    <table class="table table-striped table-responsive table-bordered">
                        <thead>
                        <th>No.</th>
                        <th>Performance Name</th>
                        <th>Performance Price</th>
                        <th>Image</th>
                        <th>Action</th>
                        </thead>

                        <%
                            try {
                                DBConn con = new DBConn();

                                Statement st = con.getConnection().createStatement();

                                String sql = "SELECT * FROM performancetype";
                                ResultSet rs = st.executeQuery(sql);
                                int index = 1;
                                while (rs.next()) {
                                    String performanceID = rs.getString("performanceID");
                                    String performanceName = rs.getString("performanceName");
                                    Double price = rs.getDouble("price");
                                    // String path = rs.getString("path");
%>
                        <tbody>
                            <tr>
                                <td><%= index++%></td>
                                <td><%=performanceName%></td>
                                <td>RM <%=price.toString()%></td>
                                <td style="width: 30%;"><img style="width: 100%;" class="bd-placeholder-img card-img-top" src="<%=rs.getString("image")%>"></td>
                                <td><a href="performanceEdit.jsp?id=<%=performanceID%>" class="btn btn-sm btn-success">EDIT</a>

                                    <script>
                                        function deleteItem() {
                                            var ask = window.confirm("Confirm to delete this instrument?");
                                            if (ask) {
                                                window.location.href = "performanceDelete.jsp?id=<%=performanceID%>";
                                            }
                                        }
                                    </script>
                                    <a class="btn btn-sm btn-danger" onclick="confirmDelete('<%=performanceID%>')">DELETE</a>

                                </td>
                            </tr>
                        <br>
                        </tbody>

                        <%
                                }
                            } catch (Exception e) {
                                out.println(e);
                            }
                        %>
                        </div>
                    </table>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addStudioModal">
                        Add New Performance
                    </button>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="addStudioModal" tabindex="-1" aria-labelledby="addStudioModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addStudioModalLabel">Add New Performance</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Form -->
                        <form id="addStudioForm" action="registerPerformance-process.jsp" method="post" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="performanceName" class="form-label">Performance Name</label>
                                <input type="text" class="form-control" id="performanceName" name="performanceName" required>
                            </div>
                            <div class="mb-3">
                                <label for="performanceDesc" class="form-label">Performance Description</label>
                                <input type="text" class="form-control" id="performanceDesc" name="performanceDesc" required>
                            </div>
                            <div class="mb-3">
                                <label for="price" class="form-label">Performance Price</label>
                                <input type="number" step="0.1" class="form-control" id="price" name="price" required>
                            </div>
                            <div class="mb-3">
                                <label for="image" class="form-label">Image</label>
                                <input class="form-control" type="file" id="uploadImage" name="uploadImage" required>
                            </div>

                            <!-- Additional fields as required -->
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" form="addStudioForm">Add Performance</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%-- Your existing code --%>
    <script>
        function confirmDelete(instrumentID) {
            var ask = window.confirm("Confirm to delete this performance?");
            if (ask) {
                $.ajax({
                    type: "POST",
                    url: "performanceDelete.jsp?id=" + instrumentID,
                    success: function () {
                        // No need to use location.reload(true) here
                        // Simply reload the page
                        location.reload();
                    }
                });
            }
        }
    </script>
</body>
</html>