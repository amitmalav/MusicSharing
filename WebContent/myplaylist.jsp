<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
    <%@ page import="java.util.*"
            import= "java.sql.*"
    %>
    <%@ page import="database.HomepageAct" %>
    <%@ page import="database.Playlist" %>
    <%@ page import="database.Track" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>See my playlist</title>
<link rel="stylesheet" href="css/bootstrap.css">
<style>
	.hidden{
		display:none;
	}
</style>
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
		out.print("<div class='master col-md-12 btn btn-primary' id="+pl.getPlaylistname()+">"+pl.getPlaylistname()+"</div>");
		List<Track> a = pl.getSongs();
		String poi="asdf";
		out.print("<div class='form-group' id="+pl.getPlaylistname().concat(poi)+">");
		out.print("<div class='col-md-12'>");
		out.print("<div class='form-group row'>");
		for(Track t: a){
			out.print("<div style='background: #bdbdbd; border-style:inset; border-color: #848484' class='col-md-4'>");
			out.print("<h3 class='col-md-12 text-center'>"+t.getTrack()+"</h3>");
			out.print("<h5 class='col-md-12 text-center'>"+t.getAlbum()+"</h5>");
			out.print("<div class='col-md-5'></div>");
			out.print("<div class='col-md-7'><div class='btn btn-default'><a href="+t.getLink()+" target='_blank'>Listen</a></div></div>");
			out.print("</div>");
		}
		out.println("</div>");
		out.println("</div>");
		out.println("</div>");	
	}
	if(empty) out.print("No Playlists yet!"+"<br/><br/>");
%>


<!-- //Add the onclick show data functionality bebo!! i don't know how to do that. -->

<a href = newplaylist.jsp class="col-md-12">Create new playlist</a>

	<script src="js/jquery-2.1.4.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
		$(".master").click(function(){
			var a=$(this).attr('id');
			var b="asdf";
			a=a.concat(b);
			$('#'+a).toggleClass("hidden");
		});
	</script>

</body>
</html>
