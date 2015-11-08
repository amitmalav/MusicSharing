<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"
            import= "java.sql.*"
    %>
    <%@ page import="database.HomepageAct" %>
    <%@ page import="database.Track" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Page</title>
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

<form action="Manage" method="post" >
<table class="table table-striped">
	<thead>
      <tr>
        <th>Track Name</th>
        <th>Album Name</th>
        <th>Artist Name</th>
        <th>Rating</th>
        <th>Status</th>
        <th>Link</th>
      </tr>
    </thead>
    <tbody>
<%
String user = (String)session.getAttribute("currentuser");
if(user==null){
	response.sendRedirect("index.jsp");
}
List<Track> unapps = HomepageAct.getUnapprovedSongs();
if(unapps.isEmpty()){
	response.sendRedirect("home.jsp");
}

for(Track t : unapps){
	out.print("<tr>");
	out.print("<td>"+t.getTrack()+"</td>");
	out.print("<td>"+t.getAlbum()+"</td>");
	out.print("<td>"+t.getArtist()+"</td>");
	out.print("<td>"+t.getRating()+"</td>");
	out.print("<td><input type=\"checkbox\" name=\"checked\""+ "value=\""+t.getTrackid()+"\"></td>");
	out.print("<td><a href="+t.getLink()+" target='_blank'><div>Listen</div><a/></td></tr>");
	}
%>
</tbody>
</table>
<div class="form-group col-md-10 form-group row">
		<div class="col-md-2"></div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</div> 
</form>

</body>
</html>