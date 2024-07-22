<%-- 
    Document   : instrumentEdit
    Created on : 13 Nov 2023, 5:29:32 pm
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
        <title>Voice of Harmony!</title>
        <jsp:include page="include.jsp" />
    </head>
    <%
        String instrumentID = request.getParameter("id");
        InstrumentDAO instrumentdao = new InstrumentDAO();
        Instrument instrument = instrumentdao.retrieveById(instrumentID);
    %>


    <body>
        <jsp:include page="navbarHepa.jsp" />
        <div class="container">
            <div class="container rounded bg-white mt-5 mb-5">
                <div class="row">
                    <div class="col-md-12 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                            <img class="mt-5" width="250px" src="<%=instrument.getInstrumentImage()%>">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                            <div class="ml-auto mr-auto ">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h3 class="text-center"><strong>UPDATE INSTRUMENT</strong></h3>
                                </div>
                                <form class="needs-validation" novalidate action="instrumentEdit-process.jsp" method="post">
                                    <div class="row mt-3">
                                        <div class="col-md-16">
                                            <input type="hidden" name="instrumentID" id="instrumentID" value="<%=instrument.getInstrumentID()%>" readonly class="form-control" placeholder="Instrument ID">
                                        </div>
                                        <div class="col-md-16">
                                            <label class="labels">Instrument Name</label>
                                            <input type="text" name="instrumentName" id="instrumentName" value="<%=instrument.getInstrumentName()%>" class="form-control" placeholder="Instrument Name">
                                        </div>
                                        <div class="col-md-16">
                                            <label class="labels">Instrument Specialty</label>
                                            <input type="text" name="instrumentDescription" id="instrumentDescription" value="<%=instrument.getInstrumentDescription()%>" class="form-control" placeholder="Instrument Description">
                                        </div>
                                        <div class="col-md-16">
                                            <br><label class="labels">Instrument Image</label>
                                            <br><input type="file" id="uploadImage" name="uploadImage" required>
                                        </div>
                                        
                                    </div>
                                    <div class="mt-5 text-center">
                                        <input type="hidden" name="instrumentID" value="<%=instrumentID%>">
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
