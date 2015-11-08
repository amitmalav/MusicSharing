<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
    <%@ page import="java.util.*"
            import= "java.sql.*"
    %>
    <%@ page import="database.HomepageAct" %>
    <%@ page import="database.Playlist" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>See my playlist</title>
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
String user = (String)session.getAttribute("currentuser");
if(user==null){
	response.sendRedirect("index.jsp");
	
}
	/* out.print(user + "<br><br>"); */	
	List<Playlist> rs = HomepageAct.getMyplaylists(user);
	boolean empty = true;
	for(Playlist pl : rs){
		empty = false;
		out.print(pl.getPlaylistname());
		out.print("<br><br>");
	}
	if(empty) out.print("No Playlists yet!"+"<br/><br/>");
%>


<!-- //Add the onclick show data functionality bebo!! i don't know how to do that. -->

<a href = newplaylist.jsp>Create new playlist</a>

</body>
</html>
