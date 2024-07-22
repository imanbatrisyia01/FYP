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
<%@page import="instrument.Instrument"%>
<%@page import="instrument.InstrumentDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voice of Harmony</title>

        <jsp:include page="include.jsp" />


    </head>

    <%

        InstrumentDAO instrumentDAO = new InstrumentDAO();
        List<Instrument> instrument = instrumentDAO.retrieveInstrument();
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
            <div class="row">
                <div class="col-9 text-center container">
                    <div class="py-3 text-center container">
                        <div class="row py-lg-3">
                            <div class="col-lg-6 col-md-8 mx-auto">
                                <h1 class="fw-light" style="margin-top: 4rem;">List of Instruments</h1>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addStudioModal">
                                    Add New Instrument
                                </button>
                            </div>
                        </div>
                    </div>

                    <div style="height: 500px; overflow: auto;">
                        <table class="table table-striped table-responsive table-bordered">
                            <thead>
                            <th>No.</th>
                            <th>Instrument Name</th>
                            <th>Instrument Specialty</th>
                            <th>Image</th>
                            <th>Action</th>
                            </thead>

                            <%
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vohbs", "root", "");
                                    Statement st = con.createStatement();
                                    String sql = "SELECT * FROM instrumentType";
                                    ResultSet rs = st.executeQuery(sql);
                                    int index = 1;
                                    while (rs.next()) {
                                        String instrumentID = rs.getString("instrumentID");
                                        String instrumentName = rs.getString("instrumentName");
                                        String instrumentDescription = rs.getString("instrumentDescription");
                                        // String path = rs.getString("path");
                            %>
                            <tbody>
                                <tr>
                                    <td><%= index++%></td>
                                    <td><%=instrumentName%></td>
                                    <td><%=instrumentDescription%></td>
                                    <td style="width: 30%;"><img style="width: 100%;" class="bd-placeholder-img card-img-top" src="<%=rs.getString("instrumentImg")%>"></td>
                                    <td><a href="instrumentEdit.jsp?id=<%=instrumentID%>" class="btn btn-sm btn-success">EDIT</a>

                                        <script>
                                            function deleteItem() {
                                                var ask = window.confirm("Confirm to delete this instrument?");
                                                if (ask) {
                                                    window.location.href = "instrumentDelete.jsp?id=<%=instrumentID%>";
                                                }
                                            }
                                        </script>
                                        <a class="btn btn-sm btn-danger" onclick="confirmDelete('<%=instrumentID%>')">DELETE</a>

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
                    </div>
                </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="addStudioModal" tabindex="-1" aria-labelledby="addStudioModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addStudioModalLabel">Add New Instrument</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- Form -->
                            <form id="addStudioForm" action="registerInstrument-process.jsp" method="post" enctype="multipart/form-data">
                                <div class="mb-3">
                                    <label for="instrumentName" class="form-label">Instrument Name</label>
                                    <input type="text" class="form-control" placeholder="Instrument Name" id="instrumentName" name="instrumentName" required>
                                </div>
                                <div class="mb-3">
                                    <label for="instrumentDescription" class="form-label">Instrument Specialty</label>
                                    <input type="text" class="form-control" placeholder="Specifications" id="instrumentDescription" name="instrumentDescription" required>
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
                            <button type="submit" class="btn btn-primary" form="addStudioForm">Add Instrument</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- Your existing code --%>
        <script>
            function confirmDelete(instrumentID) {
                var ask = window.confirm("Confirm to delete this instrument?");
                if (ask) {
                    $.ajax({
                        type: "POST",
                        url: "instrumentDelete.jsp?id=" + instrumentID,
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