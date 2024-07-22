<%-- 
    Document   : editStudio
    Created on : 2 Nov 2023, 5:24:31 pm
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
        <title>Voice of Harmony</title>
        <jsp:include page="include.jsp" />


    </head>

    <%

        StudioDAO studioDAO = new StudioDAO();
        List<Studio> studio = studioDAO.retrieveStudio();
    %>

    <body>
        <jsp:include page="navbarHepa.jsp" />

        <div class="container-max-widths">
            <%
                String message = request.getParameter("message");
                if ((message != null) && message.equals("success")) {


            %>
            <div class="row">
                <div class="col-md-12">
                    <div class="alert alert-success" role="alert">
                        <p>Store successful.</p>
                    </div>
                </div>
            </div>

            <%             }
            %>



            <div class="row">
                <div class="col-9 text-center container">
                    <div class="py-3 text-center container">
                        <div class="row py-lg-3">
                            <div class="col-lg-6 col-md-8 mx-auto">
                                <h1 class="fw-light" style="margin-top: 4rem;">List of Studios</h1>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addStudioModal">
                                    Add New Studio
                                </button>
                            </div>
                        </div>
                    </div>

                    <div style="height: 500px; overflow: auto;">
                        <table class="table table-striped table-responsive table-bordered">
                            <thead>
                            <th>No.</th>
                            <th>Studio Name</th>
                            <th>Studio Suitability</th>
                            <th>Studio Size</th>
                            <th>Capacity</th>
                            <th>Image</th>
                            <th>Action</th>
                            </thead>


                            <%
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vohbs", "root", "");
                                    Statement st = con.createStatement();
                                    String sql = "SELECT * FROM studioType";
                                    ResultSet rs = st.executeQuery(sql);
                                    int index = 1;
                                    while (rs.next()) {
                                        String studioID = rs.getString("studioID");
                                        String studioName = rs.getString("studioName");
                                        String studioDescription = rs.getString("studioDescription");
                                        String studioSize = rs.getString("studioSize");
                                        String capacity = rs.getString("capacity");
                                        // String path = rs.getString("path");
                            %>
                            <tbody>
                                <tr>
                                    <td><%= index++%></td>
                                    <td><%=studioName%></td>
                                    <td><%=studioDescription%></td>
                                    <td><%=studioSize%></td>
                                    <td><%=capacity%></td>
                                    <td style="width: 30%;"><img style="width: 100%;" class="bd-placeholder-img card-img-top" src="<%=rs.getString("studioImg")%>"></td>
                                    <td><a href="studioEdit.jsp?id=<%=studioID%>" class="btn btn-sm btn-success">EDIT</a>

                                        <script>
                                            function deleteItem() {
                                                var ask = window.confirm("Confirm to delete this studio?");
                                                if (ask) {
                                                    window.location.href = "studioDelete.jsp?id=<%=studioID%>";
                                                }
                                            }
                                        </script>
                                        <a class="btn btn-sm btn-danger" onclick="confirmDelete('<%=studioID%>')">DELETE</a>

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
            <!-- Modal -->
            <div class="modal fade" id="addStudioModal" tabindex="-1" aria-labelledby="addStudioModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addStudioModalLabel">Add New Studio</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- Form -->
                            <form id="addStudioForm" action="registerStudio-process.jsp" method="post" enctype="multipart/form-data">
                                <div class="mb-3">
                                    <label for="studioName" class="form-label">Studio Name</label>
                                    <input type="text" class="form-control" placeholder="Studio Name" id="studioName" name="studioName" required>
                                </div>
                                <div class="mb-3">
                                    <label for="studioDescription" class="form-label">Studio Suitability</label>
                                    <input type="text" class="form-control" placeholder="Suitability" id="studioDescription" name="studioDescription" required>
                                </div>
                                <div class="mb-3">
                                    <label for="size" class="form-label">Size in Sq Ft</label>
                                    <div class="input-group">
                                        <input type="number" class="form-control" id="studioSize" name="studioSize" placeholder="Enter size" required>
                                        <span class="input-group-text">sq ft</span>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="capacity" class="form-label">Capacity</label>
                                    <div class="input-group">
                                        <input type="number" class="form-control" id="capacity" name="capacity" placeholder="Enter capacity" required>
                                        <span class="input-group-text">Person</span>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="image" class="form-label">Image</label>
                                    <input class="form-control" type="file" id="uploadImage" name="uploadImage" required>
                                </div>

                                <!-- Modal Footer -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Add Studio</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

    <%-- Your existing code --%>
    <script>
        function confirmDelete(studioID) {
            var ask = window.confirm("Confirm to delete this studio?");
            if (ask) {
                $.ajax({
                    type: "POST",
                    url: "studioDelete.jsp?id=" + studioID,
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
