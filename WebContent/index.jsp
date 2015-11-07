<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"
            import= "java.sql.*"
    %>
    <%@ page import="database.FirstPage" %>
    <%@ page import="database.Track" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to the World of Music</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<nav class = "navbar navbar-default">
<div class = "container-fluid">
<div class = "navbar-header col-md-12">
<div class="navbar-brand col-md-6">Welcome to Music Sharing Application</div>
<a class = "navbar-brand col-md-1" href = "login.jsp">Login</a>
<a class = "navbar-brand col-md-1" href = "register.jsp">Register</a>
</div>
</div>
</nav>

<h2>Top Hits Now</h2>
<%
	List<Track> top = FirstPage.getTopSongs();
	for(Track t: top){
		out.print(t.getTrack()+" from "+t.getAlbum() + "<br><br>");
	}
%>
</body>
</html>