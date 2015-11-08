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
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<%if(session.getAttribute("currentuser") != null) {
	response.sendRedirect("home.jsp");
}
%>
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

<h1 class="text-center">Top Hits Now</h1>
<%
	List<Track> top = FirstPage.getTopSongs();
	out.print("<div class='form-group'>");
	out.print("<div class='col-md-12'>");
	out.print("<div class='form-group row'>");
	for(Track t: top){
		out.print("<div style='background: #bdbdbd; border-style:inset; border-color: #848484' class='col-md-4'>");
		out.print("<h3 class='col-md-12 text-center'>"+t.getTrack()+"</h3>");
		out.print("<h5 class='col-md-12 text-center'>"+t.getAlbum()+"</h5>");
		out.print("<div class='col-md-5'></div>");
		out.print("<div class='col-md-7'><div class='btn btn-default'><a href="+t.getLink()+" target='_blank'>Listen</a></div></div>");
		out.print("</div>");
	/* 	out.print("<div class='col-md-1'></div>"); */
		/* out.print(t.getTrack()+" from "+t.getAlbum() + "<br><br>"); */
	}
	out.println("</div>");
	out.println("</div>");
	out.println("</div>");	
%>
</body>
</html>