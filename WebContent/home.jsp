<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.util.*"
            import= "java.sql.*"
    %>
    <%@ page import="database.LoginAct" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
<%
System.out.println("asdf");
String user = (String)session.getAttribute("currentuser");
if(user==null){
	response.sendRedirect("index.jsp");
	System.out.println("asdf");
}
out.print("<title>Home of " + user+"</title>");
%>

</head>
<body>
<nav class = "navbar navbar-default">
<div class = "container-fluid">
<div class = "navbar-header col-md-12">
<% out.print("<div class='navbar-brand col-md-7'>Welcome " + user + "</div>"); %>
<a class = "navbar-brand col-md-3" href = "explore.jsp">Explore Songs</a>
<a class = "navbar-brand col-md-3" href = "feedback.jsp">Give Feedback</a>
<%
if(session.getAttribute("role") == "admin"){%>
<a class = "navbar-brand col-md-3" href = "manage.jsp">Manage</a>

<%}%>
<a class = "navbar-brand col-md-3" href = "logout.jsp">Logout</a>
</div>
</div>
</nav>


<a href = "addsong.jsp">Add New Song</a>

<br/><br/>
<a href = "mysongs.jsp">My Songs</a>
<br/><br/>

<a href = "myplaylist.jsp">My Playlists</a>  
<!-- will have add playlist in it -->

<div></div>
</body>
</html>