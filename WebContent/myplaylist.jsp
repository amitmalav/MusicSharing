<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
    <%@ page import="java.util.*"
            import= "java.sql.*"
    %>
    <%@ page import="database.HomepageAct" %>
    <%@ page import="database.Playlist" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br><br>
<%
String user = (String)session.getAttribute("currentuser");
	out.print(user + "<br><br>");	
	List<Playlist> rs = HomepageAct.getMySongs(user);
	
	for(Playlist song : rs){
		out.print("<br><br>**** <br>");
		out.print(song.getUser() + "		" + song.getTrack()+"		" + song.getAlbum()+"		" + song.getArtist()+"		" + song.getStatus()+"		"+ song.getLink()+"		");
	}
%>


<a href = newplaylist.jsp>Create new playlist</a>

</body>
</html>