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
<title>My Songs</title>
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
<a href = "addsong.jsp" class="col-md-12"><input type="button" value="Add a new Song" name="add"></a>
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
	List<Track> rs = HomepageAct.getMySongs(user);	
	
	for(Track song : rs){
		out.print("<tr>");
		out.print("<td>"+song.getTrack()+"</td>");
		out.print("<td>"+song.getAlbum()+"</td>");
		out.print("<td>"+song.getArtist()+"</td>");
		out.print("<td>"+song.getRating()+"</td>");
		out.print("<td>"+song.getStatus()+"</td>");
		out.print("<td><a href="+song.getTrack()+"><div>Listen</div><a/></td>");
	}
%>
</tbody>
</table>

</body>
<!-- <script>
function addSong(){
	loaction.href = "addsong.jsp";  
}
</script> -->
</html>