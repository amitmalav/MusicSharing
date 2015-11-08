<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"
            import= "java.sql.*"
    %>
    <%@ page import="database.HomepageAct" %>
    <%@ page import="database.Track" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add new playlist</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<%
String user = (String)session.getAttribute("currentuser");
if(user==null){
	response.sendRedirect("index.jsp");
}
%>
<nav class = "navbar navbar-default">
<div class = "container-fluid">
<div class = "navbar-header col-md-12">
<a class = "navbar-brand col-md-3" href = "home.jsp">Home</a>
<a class = "navbar-brand col-md-3" href = "feedback.jsp">Give Feedback</a>
<a class = "navbar-brand col-md-3" href = "logout.jsp">Logout</a>
</div>
</div>
</nav>
<form action="AddPlaylist" method="post" role="form" class="form-horizontal">

	<div class="form-group">
		<div class="col-md-10">
			<div class="form-group row">
				<label for="plname" class="col-md-2 control-label">PlaylistName:</label>
				<div class="col-md-3">
					<input type="text" class="form-control" name="plname">
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-md-10">
			<div class="form-group row">
				<label for="secure" class="col-md-2 control-label">privacy Option:</label>
				<div class="col-md-1">
					<div class="radio">
						<label><input type="radio" name="secure" value="1">Public</label>
					</div>
				</div>
				<div class="col-md-1">
					<div class="radio">
						<label><input type="radio" name="secure" value="0">Private</label>
					</div>
				</div>
			</div>
		</div>
	</div>

<table class="table table-striped">
	<thead>
      <tr>
        <th>Track Name</th>
        <th>Album Name</th>
        <th>Artist Name</th>
        <th>Rating</th>
        <th>Add</th>
        <th>Link</th>
      </tr>
    </thead>
    <tbody>

<%	
	List<Track> rs = HomepageAct.getallSongs();
	
	for(Track t : rs){
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
		<button type="submit" class="btn btn-primary">Create Playlist</button>
	</div>
</form>
</body>
</html>