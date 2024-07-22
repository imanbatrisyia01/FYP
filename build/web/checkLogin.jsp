<%@ page import="user.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Get the referring URL
    String referrer = request.getHeader("Referer");

    // Check if the user is logged in
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    if (loggedInUser == null) {
    	System.out.println("CHECK LOGIN 2::" + loggedInUser);

%>
	<script>
		window.location.href = "login.jsp"
	</script>
<%

    } 
%>