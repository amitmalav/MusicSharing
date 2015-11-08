<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.*"
            import= "java.sql.*"
    %>
    <%@ page import="database.Explore" %>
    <%@ page import="database.Track" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Responses</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<nav class = "navbar navbar-default">
<div class = "container-fluid">
<div class = "navbar-header col-md-12">
<a class = "navbar-brand col-md-3" href = "home.jsp">Home</a>
<a class = "navbar-brand col-md-3" href = "feedback.jsp">Give Feedback</a>
<a class = "navbar-brand col-md-3" href = "logout.jsp">Logout</a>
</div>
</div>
</nav>

<%
String users = (String)session.getAttribute("currentuser");
if(users==null){
	response.sendRedirect("index.jsp");
	
}
String artist = request.getParameter("artist");
String user = request.getParameter("user");
String album = request.getParameter("album");
List<Track> songs = Explore.getTrack(artist, user, album);
if(songs.size()==0) out.print("No songs found!");
else{%>
<table class="table table-striped">
	<thead>
      <tr>
        <th>Track Name</th>
        <th>Album Name</th>
        <th>Artist Name</th>
        <th>Rating</th>
        <th>Link</th>
      </tr>
    </thead>
    <tbody>
	<%for(Track t:songs){
		out.print("<tr>");
		out.print("<td>"+t.getTrack()+"</td>");
		out.print("<td>"+t.getAlbum()+"</td>");
		out.print("<td>"+t.getArtist()+"</td>");
		out.print("<td>"+t.getRating()+"</td>");
		out.print("<td><a href="+t.getLink()+" target='_blank'><div>Listen</div><a/></td></tr>");
	}
}
%>
</tbody>
</table>

</body>
</html>