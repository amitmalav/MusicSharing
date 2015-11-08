<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.util.*"
            import= "java.sql.*"
    %>
    <%@ page import="database.LoginAct" %>
    <%@ page import="database.FirstPage" %>
    <%@ page import="database.Track" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
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
<% out.print("<div class='navbar-brand col-md-6'>Welcome " + user + "</div>"); %>
<a class = "navbar-brand col-md-2" href = "explore.jsp">Explore Songs</a>
<a class = "navbar-brand col-md-2" href = "feedback.jsp">Give Feedback</a>
<%
if(session.getAttribute("role") == "admin"){
System.out.println("poiuyt");%>
<a class = "navbar-brand col-md-1" href = "manage.jsp">Manage</a>

<%}
else{
	out.print("<div class='col-md-1'></div>");
}
%>
<a class = "navbar-brand col-md-1" href = "logout.jsp">Logout</a>
</div>
</div>
</nav>
<div class="col-md-12">
	<div class="col-md-9">
		<h1 class="text-center">Top Hits Now</h1>
<%
			List<Track> top = FirstPage.getTopSongs();
			out.print("<div class='form-group'>");
			out.print("<div class='col-md-12'>");
			out.print("<div class='form-group row'>");
			for(Track t: top){
				out.print("<div style='background: #bdbdbd; border-style:inset; border-color: #848484;height:300px' class='col-md-4'>");
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
	</div>
	<div class="col-md-3">
		<br><br><br><br>
		<div class="col-md-11"><a href = "addsong.jsp" class="btn btn-primary">Add New Song</a></div><br><br>
		<div class="col-md-11"><a href = "mysongs.jsp" class="btn btn-primary">My Songs</a></div><br><br>
		<div class="col-md-11"><a href = "myplaylist.jsp" class="btn btn-primary">My Playlists</a></div>
	</div>
</div>
</body>
</html>